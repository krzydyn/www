<?
header("Server: www.kysof.pl");
header("X-Powered-By: www.kysof.pl");
header("Cache-Control: no-cache, must-revalidate");
if (!array_key_exists("f",$_REQUEST)) {
	header("HTTP/1.0 400 Bad Request");
	exit;
}
$rf=$_REQUEST["f"];
$f="updates/".$rf;
if (!file_exists($f)) {
	header("HTTP/1.0 404 Not Found");
	exit;
}
//header("Content-Type: application/octet-stream");
header("Content-Type: application/java-archive");
header("Content-Disposition: attachment; filename=\"".$rf."\";");
header("Content-Transfer-Encoding: binary");
header("Content-Length: ".filesize($f));
echo file_get_contents($f);
?>
