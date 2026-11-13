; ============================================================================
; TPHD Tools
;
; This .asm is our hook installer.
;
; it patches the game at known sites and routes every site into ONE exported RPL
; function, TPHDToolsEntry(reason, a, b). The RPL is our single "module main" and
; dispatches on "reason", so adding future hooks never needs another export.
;
;   reason 0 (PRESENT): a = &g_abTvColorBuffer, b = &g_abDrcColorBuffer
;   reason 1 (VPAD):    a = VPADStatus* buffers, b = sample count
;   reason 2 (KPAD):    a = KPADStatus* buffers, b = sample count
;   reason 3 (DRC):     a = GX2ColorBuffer* at the DRC scan-out copy
;   reason 4 (PHASE_1): a = dScnPly* immediately before dScnPly::phase_1
;   reason 5 (ROOM_PRE):  a = dScnRoom* before room.dzr is parsed
;   reason 6 (ROOM_POST): a = dScnRoom* after its dSv_zone_c is allocated
;
; Hook sites:
;   0x02af0f94  bl Gfx_PresentFrameAndSwap  -> draw ImGui, then chain present
;   0x02bde82c  bl GX2CopyColorBufferToScanBuffer -> draw DRC immediately
;               before scan-out, after the game has finished the buffer
;   0x02bfae38  bl VPADRead                 -> real read, then filter game input
;   0x10129b28  dScnPly phase table slot    -> inject pending save-state data
;                                               at the exact phase_1 boundary
;   0x10129bd8  dScnRoom phase table slot   -> restore saved stage flags before
;                                               room.dzr can order its events
;
; One-time on the first present: OSDynLoad_Acquire("tphd_tools") + one FindExport
; to resolve TPHDToolsEntry. Both hooks then call the resolved address.
;
; IMPORTANT for Cemu: HLE imports (coreinit/vpad/...) MUST be called via the
; 'bl import.<rpl>.<func>' syntax.
; ============================================================================

[TPHDv81]
moduleMatches = 0x1A03E108

; -------------------------- Zelda.rpx symbols -------------------------------
0x102816d8 = _g_abTvColorBuffer:
0x10281820 = _g_abDrcColorBuffer:
0x02bde770 = _Gfx_PresentFrameAndSwap:
0x02ac1108 = _dScnPly_phase_1:
0x02ac3f68 = _dScnRoom_zone_create_phase:

.origin = codecave

; ------------------------------- data ---------------------------------------
_ovl_state:            ; 0 = export not yet resolved, 1 = resolve attempted
.byte 0
.align 4

_ovl_module:
.int 0                 ; OSDynLoad_Module handle (out)

_ovl_fn:
.int 0                 ; resolved TPHDToolsEntry address (out); 0 until resolved

_ovl_name:
.string "tphd_tools"   ; module name for OSDynLoad_Acquire (loads tphd_tools.rpl)
.align 4

_ovl_export:
.string "TPHDToolsEntry" ; the single export we resolve
.align 4

; --------------------------- present hook -----------------------------------
; Replaces 'bl Gfx_PresentFrameAndSwap' at 0x02af0f94. On entry LR = 0x02af0f98
; (return into main). We touch only volatiles, so main's nonvolatiles survive.
; Our return addr is saved at 0x34(r1) -- NOT 0x04(r1), which callees overwrite.
overlay_present_hook:
    stwu  r1, -0x40(r1)
    mflr  r0
    stw   r0, 0x34(r1)

    ; ---- one-time: acquire module + resolve TPHDToolsEntry ----
    lis   r3, _ovl_state@ha
    lbz   r4, _ovl_state@l(r3)
    cmpwi r4, 0
    bne   ovl_call_entry              ; already resolved (or attempted) -> skip

    li    r4, 1
    stb   r4, _ovl_state@l(r3)        ; mark attempted so resolution runs once

    ; OSDynLoad_Acquire("overlay", &_ovl_module)
    lis   r3, _ovl_name@ha
    addi  r3, r3, _ovl_name@l
    lis   r4, _ovl_module@ha
    addi  r4, r4, _ovl_module@l
    bl    import.coreinit.OSDynLoad_Acquire

    ; bail if no module handle (Acquire failed / file not found) -> fn stays 0
    lis   r3, _ovl_module@ha
    lwz   r3, _ovl_module@l(r3)
    cmpwi r3, 0
    beq   ovl_call_entry

    ; OSDynLoad_FindExport(module, 0, "TPHDToolsEntry", &_ovl_fn)  (r3 = module)
    li    r4, 0
    lis   r5, _ovl_export@ha
    addi  r5, r5, _ovl_export@l
    lis   r6, _ovl_fn@ha
    addi  r6, r6, _ovl_fn@l
    bl    import.coreinit.OSDynLoad_FindExport

ovl_call_entry:
    ; ---- every frame: TPHDToolsEntry(0, &g_abTvColorBuffer, &g_abDrcColorBuffer) ----
    lis   r3, _ovl_fn@ha
    lwz   r3, _ovl_fn@l(r3)
    cmpwi r3, 0
    beq   ovl_after_load              ; export not resolved -> skip draw
    mtctr r3                          ; CTR = TPHDToolsEntry (capture before reusing r3)
    li    r3, 0                       ; reason = PRESENT
    lis   r4, _g_abTvColorBuffer@ha
    addi  r4, r4, _g_abTvColorBuffer@l
    lis   r5, _g_abDrcColorBuffer@ha
    addi  r5, r5, _g_abDrcColorBuffer@l
    bctrl                             ; loaded RPL export = real PPC -> bctrl ok

ovl_after_load:
    ; original present is real PPC, so an indirect bctrl is safe
    lis   r0, _Gfx_PresentFrameAndSwap@hi
    ori   r0, r0, _Gfx_PresentFrameAndSwap@l
    mtctr r0
    bctrl

    lwz   r0, 0x34(r1)
    mtlr  r0
    addi  r1, r1, 0x40
    blr

; ----------------------- GamePad scan-out hook ------------------------------
; Gfx_PresentFrameAndSwap performs its DRC copy at 0x02bde82c with
; r3 = GX2ColorBuffer* and r4 = GX2_SCAN_TARGET_DRC. Drawing from the earlier
; main-loop hook is too soon: the game can still replace or modify this buffer.
; Draw here, then perform the original GX2 copy so the overlay reaches scan-out.
drc_copy_hook:
    stwu  r1, -0x20(r1)
    mflr  r0
    stw   r0, 0x1c(r1)
    stw   r3, 0x10(r1)             ; save DRC color buffer
    stw   r4, 0x0c(r1)             ; save scan target

    cmpwi r4, 4                     ; GX2_SCAN_TARGET_DRC
    bne   drc_copy_real

    ; TPHDToolsEntry(3, colorBuffer, 0) if resolved
    lis   r9, _ovl_fn@ha
    lwz   r9, _ovl_fn@l(r9)
    cmpwi r9, 0
    beq   drc_copy_real
    mtctr r9
    li    r3, 3                    ; reason = DRC
    lwz   r4, 0x10(r1)             ; r4 = GX2ColorBuffer*
    li    r5, 0
    bctrl

drc_copy_real:
    lwz   r3, 0x10(r1)
    lwz   r4, 0x0c(r1)
    bl    import.gx2.GX2CopyColorBufferToScanBuffer

    lwz   r0, 0x1c(r1)
    mtlr  r0
    addi  r1, r1, 0x20
    blr

; --------------------------- VPADRead hook ----------------------------------
; The game polls the GamePad from a single site: 'bl VPADRead' at 0x02bfae38
; inside FUN_02bfae04, called as VPADRead(chan=r3, buffers=r4, count=8=r5,
; &error=r6). We replace that bl with 'bla vpad_read_hook'. The hook calls the
; real VPADRead (filling the game's buffer), then TPHDToolsEntry(1, buffers,
; count), which zeroes the input when the menu is open + blocking. We return
; VPADRead's sample count in r3, exactly as the original bl would. Our own menu
; reads the real controller separately, so it is unaffected.
;
; 'bla' sets LR to the instruction after the original bl (0x02bfae3c); we save
; that and blr back to it. r9 is scratch (volatile around the original call).
vpad_read_hook:
    stwu  r1, -0x20(r1)
    mflr  r0
    stw   r0, 0x1c(r1)             ; incoming LR (return into FUN_02bfae04)
    stw   r4, 0x10(r1)             ; save buffers ptr (r4 is volatile across call)

    bl    import.vpad.VPADRead     ; real read; r3 = sample count
    stw   r3, 0x0c(r1)             ; save count

    ; TPHDToolsEntry(1, buffers, count) if resolved
    lis   r9, _ovl_fn@ha
    lwz   r9, _ovl_fn@l(r9)
    cmpwi r9, 0
    beq   vpad_read_done
    mtctr r9
    li    r3, 1                    ; reason = VPAD
    lwz   r4, 0x10(r1)             ; r4 = buffers
    lwz   r5, 0x0c(r1)             ; r5 = count
    bctrl

vpad_read_done:
    lwz   r3, 0x0c(r1)             ; r3 = VPADRead's sample count (return value)
    lwz   r0, 0x1c(r1)
    mtlr  r0
    addi  r1, r1, 0x20
    blr

; --------------------------- KPADReadEx hook --------------------------------
; The Pro Controller / Classic Controller / Wiimote are read via KPADReadEx, NOT
; VPADRead. The game has two identical call sites -- 0x02bfb94c (FUN_02bfb920)
; and 0x02bfceac (FUN_02bfce80) -- both KPADReadEx(chan=r3, data=r4, size=4=r5,
; &error=r6), returning sample count in r3. Same wrap-and-filter pattern as VPAD:
; real read, then TPHDToolsEntry(2, buffers, count) zeroes the samples when the
; menu is open + blocking. Both sites use the same hook (ABI args identical).
kpad_read_hook:
    stwu  r1, -0x20(r1)
    mflr  r0
    stw   r0, 0x1c(r1)             ; incoming LR (return into the wrapper)
    stw   r4, 0x10(r1)             ; save data buffer ptr

    bl    import.padscore.KPADReadEx   ; real read; r3 = sample count
    stw   r3, 0x0c(r1)             ; save count

    ; TPHDToolsEntry(2, buffers, count) if resolved
    lis   r9, _ovl_fn@ha
    lwz   r9, _ovl_fn@l(r9)
    cmpwi r9, 0
    beq   kpad_read_done
    mtctr r9
    li    r3, 2                    ; reason = KPAD
    lwz   r4, 0x10(r1)            ; r4 = buffers
    lwz   r5, 0x0c(r1)            ; r5 = count
    bctrl

kpad_read_done:
    lwz   r3, 0x0c(r1)            ; r3 = KPADReadEx's sample count (return value)
    lwz   r0, 0x1c(r1)
    mtlr  r0
    addi  r1, r1, 0x20
    blr

; ------------------------ dScnPly::phase_1 hook -----------------------------
; Ghidra identifies FUN_02ac1108 as dScnPly::phase_1; its phase-table entry at
; 0x10129b28 is the function's only data xref. Routing the table slot here gives
; the loader the exact old-scene-gone/new-scene-not-started boundary. Call the
; RPL first, then chain Nintendo's original phase function and preserve its
; return value.
scene_phase1_hook:
    stwu  r1, -0x40(r1)
    mflr  r0
    stw   r0, 0x34(r1)
    stw   r3, 0x30(r1)             ; above the callee parameter-save area

    lis   r9, _ovl_fn@ha
    lwz   r9, _ovl_fn@l(r9)
    cmpwi r9, 0
    beq   scene_phase1_real
    mtctr r9
    li    r3, 4                    ; reason = PHASE_1
    lwz   r4, 0x30(r1)             ; a = dScnPly*
    li    r5, 0
    bctrl

scene_phase1_real:
    lwz   r3, 0x30(r1)
    lis   r12, _dScnPly_phase_1@ha
    addi  r12, r12, _dScnPly_phase_1@l
    mtctr r12
    bctrl

    lwz   r0, 0x34(r1)             ; leave original return value in r3
    mtlr  r0
    addi  r1, r1, 0x40
    blr

; --------------------- dScnRoom zone-create phase hook ---------------------
; FUN_02ac3f68 allocates the room's dSv_zone_c, stores its slot in room
; control, and parses room.dzr. Restore mMemory/mDan before entering it -- the
; same timing as a normal getSave load -- then merge the new zone after it.
room_zone_phase_hook:
    stwu  r1, -0x40(r1)
    mflr  r0
    stw   r0, 0x34(r1)
    stw   r3, 0x30(r1)             ; dScnRoom*

    lis   r9, _ovl_fn@ha
    lwz   r9, _ovl_fn@l(r9)
    cmpwi r9, 0
    beq   room_zone_phase_real
    mtctr r9
    li    r3, 5                    ; reason = ROOM_PRE
    lwz   r4, 0x30(r1)             ; a = dScnRoom*
    li    r5, 0
    bctrl

room_zone_phase_real:
    lwz   r3, 0x30(r1)
    lis   r12, _dScnRoom_zone_create_phase@ha
    addi  r12, r12, _dScnRoom_zone_create_phase@l
    mtctr r12
    bctrl
    stw   r3, 0x2c(r1)             ; preserve original phase result

    lis   r9, _ovl_fn@ha
    lwz   r9, _ovl_fn@l(r9)
    cmpwi r9, 0
    beq   room_zone_phase_done
    mtctr r9
    li    r3, 6                    ; reason = ROOM_POST
    lwz   r4, 0x30(r1)             ; a = dScnRoom*
    li    r5, 0
    bctrl

room_zone_phase_done:
    lwz   r3, 0x2c(r1)
    lwz   r0, 0x34(r1)
    mtlr  r0
    addi  r1, r1, 0x40
    blr

; ------------------------------- hooks --------------------------------------
0x02af0f94 = bla overlay_present_hook
0x02bde82c = bla drc_copy_hook
0x02bfae38 = bla vpad_read_hook
0x02bfb94c = bla kpad_read_hook
0x02bfceac = bla kpad_read_hook
0x10129b28 = .int scene_phase1_hook
0x10129bd8 = .int room_zone_phase_hook
