<?php
function always_decimal_format($x) { return (intval($x) == $x ? number_format($x, 1, '.', '') : $x ); } 
?>