<?php
define('WWW_DATA',33);

function logstr($str){
    $tm=time();
	if (posix_geteuid()==WWW_DATA)
    	$fn="log/".date("Ymd",$tm).".txt";
	else
		$fn="log/user-".date("Ymd",$tm).".txt";
    $f=fopen($fn,"ab");
    if ($f!==false){
        if (flock($f,LOCK_EX)){
            fwrite($f,date("Ymd H:i:s  ",$tm).$str."\n");
            flock($f,LOCK_UN);
        }
        fclose($f);
    }
	else echo "can't open log<br>\n";
}
function strhex($bin) {
	$hex=unpack("H*",$bin);$hex=$hex[1];
	return $hex;
}
function strhexbin($hex) {
	$bin=pack("H*",$hex);
	return $bin;
}
function strvis($s)
{
	$t=""; $l=strlen($s);
	for ($i=0; $i<$l; $i++) {
		$r=unpack("C",substr($s,$i,1)); $r=$r[1];
		if ($r<=0x20||$r>=0x7f) $t.=sprintf("<%02X>",$r);
		else $t.=pack("C",$r);
	}
	return $t;
}
function bcdechex($dec) {
    $hex = '';
    do {    
        $last = bcmod($dec, 16);
        $hex = dechex($last).$hex;
        $dec = bcdiv(bcsub($dec, $last), 16);
    } while($dec>0);
    return $hex;
}
function bchexdec($hex) {
	$dec = "0";
    $len = strlen($hex);
    for ($i = 1; $i <= $len; $i++) {
        $dec = bcadd($dec, bcmul(strval(hexdec($hex[$i - 1])), bcpow('16', strval($len - $i))));
    }
    return $dec;
}
