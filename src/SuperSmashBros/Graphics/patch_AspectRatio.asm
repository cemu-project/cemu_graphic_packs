[cross_f304]
moduleMatches = 0x63FAA900

0x03301E2C = li r3, (($aspectRatioWidth <= 16) * 1920) + (($aspectRatioWidth > 16) * (($width / $height) * $gameHeight))
0x03301E34 = li r3, (($aspectRatioHeight >= 9) * 1080) + (($aspectRatioHeight < 9) * (($height / $width) * $gameWidth))
