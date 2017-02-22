<?php
//Serach: \n[ \t]*{
function printo($l,$n,&$o){
	echo str_repeat(" ",2*$n);
	if ($l) echo $l." => ";
	if ($o===null) echo "null\n";
	else if ($o===false) echo "false\n";
	else if ($o===true) echo "true\n";
	else if (is_string($o)) echo strtr(strvis($o),array("&"=>"&amp;","<"=>"&lt;",">"=>"&gt;"))."\n";
	//else if (is_string($o)) echo strtr($o,array("&"=>"&amp;","<"=>"&lt;"))."\n";
	else if (is_array($o)){
		echo "Array[".sizeof($o)."](\n";
		while(list($f,$v)=each($o)) printo("[".$f."]",$n+1,$v);
		echo str_repeat(" ",2*$n).")\n";
		reset($o);
	}
	else if (is_object($o)){
		echo "class ".get_class($o)." {\n";
		$vars=get_object_vars($o);
		printo("vars",$n+1,$vars);
		/* $vars=get_class_methods(get_class($o));
		printo("funcs",$n+1,$vars);
		echo str_repeat(" ",2*$n)."}\n"; */
	}
	else echo strtr((string)$o,array("&"=>"&amp;","<"=>"&lt;",">"=>"&gt;"))."\n";
}
function printobj($l,$o){
	static $idx=100;
	echo "<pre style=\"z-index:$idx\"><font color=\"red\">$l</font>: ";
	printo("",0,$o);
	echo "</pre>";
	++$idx;
}
function args($skip,&$a){
	if (sizeof($a)<=$skip) return null;
	for ($i=0; $i<$skip; $i++) array_shift($a);
	return is_array($a[0])?$a[0]:$a;
}
function logstr($str){
	global $config;
	$tm=time();
	if (isset($config["appname"])) $fn="cache/log-".$config["appname"].date("Ymd",$tm).".txt";
	else $fn="cache/log".date("Ymd",$tm).".txt";
	$f=fopen($fn,"ab");
	if ($f!==false){
		if (flock($f,LOCK_EX)){
			fwrite($f,$str."\n");
			flock($f,LOCK_UN);
		}
		fclose($f);
	}
}
function searchdir(&$a,$fn){
	for ($i=0; $i<sizeof($a); $i++){
		$d=$a[$i];
		//echo "searching dir $d<br>";
		if (!is_dir($d)) {/*echo "dir $d not found<br>";*/continue;}
		if (file_exists($d.$fn)) return $d.$fn;
		//echo "file $d$fn not exists<br>";
	}
	//echo "file $fn not found<br>";
	return false;
}
function readfiles($path,$patt=false){
	$a=array();
	if (!is_dir($path)) return $a;
	if (($dh=opendir($path))===false) {echo "can't open dir";return $a;}
	if (!empty($patt)) $patt="/^".$patt."\$/i";
	else $patt=false;
	while (($f = readdir($dh)) !== false){
		if ($f=="."||$f=="..") continue;
		if ($patt!==false && !preg_match($patt,$f)) {
			//echo "notmatch $f to $patt<br>";
			continue;
		}
		$a[]=$f;
	}
	closedir($dh);
	if (sizeof($a)>1) sort($a,SORT_STRING);
	return $a;
}
function a2str(&$a){
	$str="";
	while (list($f,$v)=each($a)) $str.=",'".$f."'=>'".$v."'";
	reset($a);
	return "{".substr($str,1)."}";
}
function a2url(&$a){
	$str="";
	while (list($f,$v)=each($a)) $str.="&".$f."=".$v;
	reset($a);
	return $str;
}
//793007164 Mikolaj Palinski
//published on:
//http://www.php-help.ro/php-tutorials/php-highlight-search-keywords/comment-page-1/
function str_highlight($txt,$words){
	if (!is_array($words)){
		$words=preg_split("/[^[:alpha:]]+/",$words);
		$words=array_unique($words);
	}
	$repl=array();
	for ($i=0; $i<sizeof($words); ++$i)
		$repl[$i]="<span class=\"hi\">".$words[$i]."</span>";
	return str_ireplace($words,$repl,$txt);
}
function highlight($txt,$words){
	if (!is_array($words)){
		$words=preg_split("/[^_A-Za-z?????ʳ??Ӷ?????]+/",$words);
		$words=array_unique($words);
	}
	$regex="";
	for ($i=0; $i<sizeof($words); ++$i){
		if (strlen($words[$i])<2) continue;
		$regex.="|(".$words[$i].")";
	}
	$regex=substr($regex,1);
	return preg_replace("#(".$regex.")#si","<span class=\"hi\">\$1</span>",$txt);
}
function gethost_byip($ip){
    return preg_match('#^(25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d\d|\d)([.](25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d\d|\d)){3}$#',$ip)?gethostbyaddr($ip):$ip;
}
function gethost_byptr($ip){
    if (!preg_match('#^(25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d\d|\d)([.](25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d\d|\d)){3}$#',$ip)) return $ip;
    $ptr = implode(".",array_reverse(explode(".",$ip))).".in-addr.arpa";
    $hosts = dns_get_record($ptr,DNS_PTR);
    $r=array();
    foreach($hosts as $h) $r[]=$h['target'];
    return sizeof($r)>0 ? $r : false;
}
if(!function_exists('http_build_str')){
	function http_build_str($aq){
		$a=array();
		foreach($aq as $k=>$v){
			if (is_array($v)){
				foreach($v as $kt=>$vt)
					$a[]=$k."[".$kt."]=".urlencode($vt);
			}
			else $a[]=$k."=".urlencode($v);
		}
		return implode("&",$a);
	}
}
if(!function_exists('parse_ini_string')){
  function parse_ini_string($ini, $process_sections = false, $scanner_mode = INI_SCANNER_NORMAL){
    # Generate a temporary file.
    $tempname = tempnam('tmpXXX', 'ini');
    $fp = fopen($tempname, 'w');
    fwrite($fp, $ini);
    $ini = parse_ini_file($tempname, $process_sections);
    fclose($fp);
    @unlink($tempname);
    return $ini;
  }
}
function mime_content_type($f){
	$pinfo=pathinfo($f);

	if (!array_key_exists("extension",$pinfo)){
		$fn=strtolower($pinfo["filename"]);
		if ($fn=="makefile") return "text/plain";
		return "application/download";
	}

	$ext=strtolower($pinfo["extension"]);
	if ($ext=="txt"||$ext=="sh"||$ext=="c"||$ext=="h") return "text/plain";
	if ($ext=="xml") return "text/xml";//other: text/rss+xml, text/atom+xml

	if ($ext=="jar") return "application/java-archive";
	if ($ext=="exe") return "application/octet-stream";
	if ($ext=="doc") return "application/msword";
	if ($ext=="xls") return "application/vnd.ms-excel";
	if ($ext=="ppt") return "application/vnd.ms-powerpoint";
	if ($ext=="zip"||$ext=="pdf") return "application/".$ext;

	if ($ext=="jpeg") return "image/jpg";
	if ($ext=="gif"||$ext=="png"||$ext=="jpg") return "image/".$ext;
	//return "application/force-download";
	return "application/download";
}
$config["cmslib"]=strtr(dirname(__FILE__),"\\","/")."/";

//Application includes
include_once($config["cmslib"]."text.php");
include_once($config["cmslib"]."db.php");

$config["templatedir"][]=$config["cmslib"]."templates/";

//set default lang
if (!array_key_exists("lang",$config)) $config["lang"]="en";
if (array_key_exists("lang",$_GET)) $lang=$_GET["lang"];
else if (array_key_exists("lang",$_REQUEST)) $lang=$_REQUEST["lang"];
else $lang=$config["lang"];
if (!file_exists("lang/text_".$lang.".php")){
	logstr("no lang file for ".$lang);
	$lang="en";
}

if (file_exists("lang/text_".$lang.".php")) {
	include_once("lang/text_".$lang.".php");
}
unset($lang);

//include_once($config["cmslib"]."iterator.php");

//Template Engine includes
include_once($config["cmslib"]."request.php");
include_once($config["cmslib"]."template.php");
?>
