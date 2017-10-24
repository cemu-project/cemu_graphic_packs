<?php
function always_decimal_format($x) { return (intval($x) == $x ? number_format($x, 1, '.', '') : $x ); } 
function gcd($a,$b) {
    $a = abs($a); $b = abs($b);
    if( $a < $b) list($b,$a) = Array($a,$b);
    if( $b == 0) return $a;
    $r = $a % $b;
    while($r > 0) {
        $a = $b;
        $b = $r;
        $r = $a % $b;
    }
    return $b;
}
function simplify($num,$den) {
    $g = gcd($num,$den);
    return Array($num/$g,$den/$g);
}
function get_title($width, $height) {
	$title = $width . "x" . $height;
	$ratio = simplify($width, $height);
	if (!($ratio[0] == 16 && $ratio[1] == 9)) {
		if ($ratio[0] == 64 && $ratio[1] == 27) {
			// 64:27 is the true ratio, but 21:9 is the common approximation
			$title = $title . " (21:9)";
		} else if ($ratio[0] == 43 && $ratio[1] == 18) {
			// 43:18 is the true ratio for 3440x1440, but 21:9 is the common approximation
			$title = $title . " (21:9)";
		} else if ($ratio[0] == 8 && $ratio[1] == 5) {
			// common sense
			$title = $title . " (16:10)";
		} else if ($ratio[0] == 427 && $ratio[1] == 240) {
			// common sense
			return $title;
		} else if ($ratio[0] == 683 && $ratio[1] == 384) {
			// common sense
			return $title;
		} else {
			$title = $title . " (" . $ratio[0] .":". $ratio[1] . ")";
		}
	}
	return $title;
}
?>