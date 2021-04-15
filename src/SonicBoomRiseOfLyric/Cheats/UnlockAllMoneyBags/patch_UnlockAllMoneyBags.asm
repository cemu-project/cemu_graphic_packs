[WiiULauncher0US]
moduleMatches = 0x90DAC5CE

; Jump to success condition
0x34BD3E4 = b 0x34BD524

; Force loop to iterate four times to unlock all bonuses
0x34BD544 = li r27, 4

; Branch back to first condition to unlock the UI
0x34BD5AC = b 0x34BD4FC

; Skip saving callback in 3DS response payload
0x34BFCB8 = nop

[WiiULauncher0EU]
moduleMatches = 0x8F7D2702

; Jump to success condition
0x34BD480 = b 0x34BD5CC

; Force loop to iterate four times to unlock all bonuses
0x34BD5EC = li r27, 4

; Branch back to first condition to unlock the UI
0x34BD654 = b 0x34BD5A4

; Skip saving callback in 3DS response payload
0x34BFD6C = nop

[WiiULauncher0JP]
moduleMatches = 0x0D395735

; Jump to success condition
0x34BD7DC = b 0x34BD928

; Force loop to iterate four times to unlock all bonuses
0x34BD948 = li r27, 4

; Branch back to first condition to unlock the UI
0x34BD9B0 = b 0x34BD900

; Skip saving callback in 3DS response payload
0x34C0128 = nop

[WiiULauncher16]
moduleMatches = 0x113CC316

; Jump to success condition
0x34BD898 = b 0x34BD9E4

; Force loop to iterate four times to unlock all bonuses
0x34BDA04 = li r27, 4

; Branch back to first condition to unlock the UI
0x34BDA6C = b 0x34BD9BC

; Skip saving callback in 3DS response payload
0x34C0184 = nop