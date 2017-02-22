<?php
$config=array(); // fresh config

ini_set("magic_quotes_runtime", 0);

// paths setup
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
$config["rootdir"]=strtr(dirname(__FILE__),"\\","/")."/"; //path to the site files
$config["rooturl"]=dirname($_SERVER["PHP_SELF"]."/"); //url to the site
$config["cachedir"]="cache/"; //relative to rootdir(no / at bg)
$config["templatedir"]=array($config["rootdir"]."templates/",$config["cmslib"]."../templates/");
$config["templateexpired"]="modtime"; //force|modtime
//FCK config
//$config["fck"]="/cms/fckeditor/";//FCK install dir
//$config["fckfiledir"]="myfiles"; //relative to rootdir

// db setup
$config["dbtype"]="sqlite";
$config["dbname"]="db/kysoft.db";

$config["appname"]="kysoft";
$config["sitetitle"]="KySoft Site";
$config["lang"]="pl";

$config["uploaddir"]=$config["rootdir"]."uploads/";
?>
