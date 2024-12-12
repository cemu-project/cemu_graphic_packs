[HyruleWarriors_ShadowRemoval_v208]
moduleMatches = 0xE159AE91 ; v208(EU/NA/JP)
; disable calls to CDisplayListMgr::RenderScene inside CShadowMapManager::Render
; seems to stop character/item shadows being rendered to the shadowmap, while still letting the shadowmap itself get rendered (which seems needed for other effects)
0x021CD54C = nop
0x021CD578 = nop

[HyruleWarriors_ShadowRemoval_EUv0]
moduleMatches = 0xDE6FF9D3 ; v0(EU/NA)
0x021B1F18 = nop
0x021B1F44 = nop

[HyruleWarriors_ShadowRemoval_JPv16]
moduleMatches = 0xF290AEA8 ; v16(JP)
0x021B1DD8 = nop
0x021B1E04 = nop
