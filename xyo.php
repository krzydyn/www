<?php

if ($_SERVER["HTTP_HOST"]!="localhost"){
error_reporting(E_ALL&~E_NOTICE);
ini_set('display_errors','Off');
ini_set('error_log','cache/error.log');
$config["cmslib"]=strtr(dirname(__FILE__),"\\","/")."/cms/lib/";
$config["cmsurl"]="/cms/";
}
else{
error_reporting(E_ALL);
$config["cmslib"]=strtr(dirname(__FILE__),"\\","/")."/../cms/kdcms/lib/";
$config["cmsurl"]="/cms/kdcms/"; //url to the cms web files
}
$config["appname"]="xyo";
require_once($config["cmslib"]."modules.php");

logstr("URI=".$_SERVER["REQUEST_URI"]);
header('Content-type: application/json');

//$data=array("name1"=>"val1","name2"=>"val2");
//echo json_encode($data);
echo json_encode($_GET);
?>
