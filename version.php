<?
header("Server: www.kysof.pl");
header("X-Powered-By: www.kysof.pl");
header("Cache-Control: no-cache, must-revalidate");

if (!array_key_exists("f",$_REQUEST)) {
	header("HTTP/1.0 400 Bad Request");
	exit;
}

$f="updates/".$_REQUEST["f"];
if (!file_exists($f)) {
	header("HTTP/1.0 404 Not Found");
	exit;
}
$ver="0";
$zip=zip_open($f);
while ($ze = zip_read($zip)){
	$n=zip_entry_name($ze);
	//echo $n."<br>\n";
	if (strpos($n,"MANIFEST")!==false){
		if (zip_entry_open($zip, $ze, "r")) {
			$buf = zip_entry_read($ze, zip_entry_filesize($ze));
			zip_entry_close($ze);
			//echo "BUF=".$buf."<br>\n";
			$ln=explode("\n",$buf);
			for ($i=0; $i<sizeof($ln); ++$i){
				$n=$ln[$i];
				//echo "ln".($i+1).":".$n."<br>";
				if (strpos($n,"Implementation-Version")!==false){
					$ver=explode(":",$n);
					$ver=explode("-",$ver[1]);
					$ver=$ver[0];
					break;
				}
			}
		}
		break;
	}
}
zip_close($zip);
echo $ver."\n";
?>
