[MH3U_Ultrawide_US_v32]
moduleMatches = 0x9d2f15e5

; Each frame, the viewport update at 0x02ba0474 sets a camera's aspect
; (camera +0x38) from its viewport's integer rect: (x1-x0)/(y1-y0).
; At that point r0 holds the width and r8 the height. Only the full
; 1920x1080 TV viewport gets widened, so smaller views keep their aspect.
; r7 and f13 are rewritten before the game reads them again.

.origin = codecave

_aspectScale:
.float ($width / $height) / (16.0 / 9.0)

_widenAspect:
fdivs f11, f11, f13
cmpwi r0, 1920
bne _widenAspectDone
cmpwi r8, 1080
bne _widenAspectDone
lis r7, _aspectScale@ha
lfs f13, _aspectScale@l(r7)
fmuls f11, f11, f13
_widenAspectDone:
blr

0x02ba0474 = bl _widenAspect

; Name tags over characters are placed in 1920-wide HUD space from the
; camera's screen position: x = fraction * width, fraction in 0..1.
; The HUD shaders squeeze HUD space into the middle 16:9, so widen the
; fraction around the center by the same amount to keep tags on target.
; Only f1, f13 and r12 change; the screen-size call before already
; clobbers f13 and r12, and cr0 is left alone for the branch after.

_tagHalf:
.float 0.5
_tagWiden:
.float ($width / $height) / (16.0 / 9.0)

; f1 = ((fraction - 0.5) * widen + 0.5) * width, fraction in f7, width in f8
_tagXf7f8:
lis r12, _tagHalf@ha
lfs f13, _tagHalf@l(r12)
fsubs f1, f7, f13
lis r12, _tagWiden@ha
lfs f13, _tagWiden@l(r12)
fmuls f1, f1, f13
lis r12, _tagHalf@ha
lfs f13, _tagHalf@l(r12)
fadds f1, f1, f13
fmuls f1, f1, f8
blr

; Same, with the fraction in f0 and the width in f7
_tagXf0f7:
lis r12, _tagHalf@ha
lfs f13, _tagHalf@l(r12)
fsubs f1, f0, f13
lis r12, _tagWiden@ha
lfs f13, _tagWiden@l(r12)
fmuls f1, f1, f13
lis r12, _tagHalf@ha
lfs f13, _tagHalf@l(r12)
fadds f1, f1, f13
fmuls f1, f1, f7
blr

0x02618214 = bl _tagXf7f8
0x026182bc = bl _tagXf7f8
0x026189d4 = bl _tagXf0f7
0x02618a7c = bl _tagXf0f7
