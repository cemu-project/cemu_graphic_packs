[XCX_EMANUAL_101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
; ----------------------------------------------------------------------------
; WHO  : menu::MenuMainMenu::funcManual((int))
; WHAT : Replace eManual function with timeManipulate function
_openTimeManipulate = 0x02C7A2F0 ; MenuTask::openTimeManipulate(void)
_isFinishTM = 0x02C7A4CC ; MenuTask::isFinishTimeManipulate((void))
0x02B83CB4 = bl _openTimeManipulate
0x02B83CCC = bl _openTimeManipulate
0x02B83C7C = bl _isFinishTM
0x02B83C98 = bl _isFinishTM

[XCX_EMANUAL_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
_openTimeManipulate = 0x02C7A290 ; MenuTask::openTimeManipulate(void)
_isFinishTM = 0x02C7A46C ; MenuTask::isFinishTimeManipulate((void))
0x02B83CA4 = bl _openTimeManipulate
0x02B83CBC = bl _openTimeManipulate
0x02B83C6C = bl _isFinishTM
0x02B83C88 = bl _isFinishTM

[XCX_EMANUAL_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
_openTimeManipulate = 0x02C757E4 ; MenuTask::openTimeManipulate(void)
_isFinishTM = 0x02C759C0 ; MenuTask::isFinishTimeManipulate((void))
0x02B7FBF0 = bl _openTimeManipulate
0x02B7FC08 = bl _openTimeManipulate
0x02B7FBB8 = bl _isFinishTM
0x02B7FBD4 = bl _isFinishTM

[XCX_EMANUAL_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
_openTimeManipulate = 0x02C7A118 ; MenuTask::openTimeManipulate(void)
_isFinishTM = 0x02C7A2F4 ; MenuTask::isFinishTimeManipulate((void))
0x02B83C28 = bl _openTimeManipulate
0x02B83C40 = bl _openTimeManipulate
0x02B83BF0 = bl _isFinishTM
0x02B83C0C = bl _isFinishTM

[XCX_EMANUAL_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
_openTimeManipulate = 0x02C71CD0 ; MenuTask::openTimeManipulate(void)
_isFinishTM = 0x02C71EAC ; MenuTask::isFinishTimeManipulate((void))
0x02B7D640 = bl _openTimeManipulate
0x02B7D658 = bl _openTimeManipulate
0x02B7D608 = bl _isFinishTM
0x02B7D624 = bl _isFinishTM
