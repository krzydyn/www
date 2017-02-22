<?php
require_once("config.php");
require_once($config["cmslib"]."modules.php");
/*
require_once($config["cmslib"]."application.php");
require_once("kysoft.php");
 */

$prot=$_SERVER["SERVER_PROTOCOL"];
$ua=$_SERVER["HTTP_USER_AGENT"];
@$f=$_GET["f"];@$t=$_GET["t"];
if(!isset($f)){
	header($prot." 403 Forbidden");
	echo "Forbidden";
	logstr("filename not given");
	exit;
}
/*
$a=&new KySoft();
$a->initialize();
$a->checkRobot();
$a->logreq();
unset($a);
 */
if (!file_exists($f)) {
	//header("HTTP/1.0 404 Not Found");
	header("Status: 404 Not Found");
	header($prot." 404 Not Found");
	echo "File not found";
	logstr("file ".$f." not found");
	exit;
}
if(!is_readable($f)) {
	header($prot." 403 Forbidden");
	echo "Forbidden";
	logstr("file ".$f." not readable");
	exit;
}
if(!isset($t)){
	$t="attachment";
}

if (strpos($ua,"kysoft")===false) {
	//logstr("DOWNLOAD=".$f."  MIME=".mime_content_type($f));
}
$s=filesize($f);
header("Pragma: public"); // required
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: private",false); // required for certain browsers
header("Content-Type: ".mime_content_type($f));
header("Content-Disposition: ".$t."; filename=\"".basename($f)."\"");
header("Content-Transfer-Encoding: binary");
header("Content-Length: ".$s);
header("Accept-Ranges: bytes"); //to show progress bar

$fp = fopen($f, "rb");
while (!feof($fp)){
		echo fread($fp, 65536);
		flush(); // this is essential for large downloads
}
fclose($fp);
?>
