<?php
date_default_timezone_set("Europe/Warsaw");
$config=array();
$config["appname"]="przepisy";

ini_set('display_errors','On');
//ini_set('error_log','cache/error.log');
//
// paths setup
$config["cmslib"]=strtr(dirname(__FILE__),"\\","/")."/../cms/lib/";
$config["cmsurl"]="/cms/";

$config["rootdir"]=strtr(dirname(__FILE__),"\\","/")."/"; //path to the site files
$config["rooturl"]=dirname($_SERVER["PHP_SELF"])."/"; //url to the site
$config["cachedir"]="cache/"; //relative to rootdir
$config["templatedir"]=array($config["rootdir"]."templates/");
$config["templateexpired"]="force"; //modtime

$config["fck"]="/cms/ckeditor/";//FCK install dir
$config["fckfiledir"]="upload"; //relative to rootdir
$config["fckconfig"]="FCKconfig.js"; //relative to rooturl

// db setup
//$config["debug"]["query"]="y";
//$config["dbtype"]="sqlite";
//$config["dbname"]="db/recipe.sqlite";
$config["dbtype"]="pdo";
$config["dbname"]="sqlite:db/recipe.db";

$config["sitetitle"]="Sprawdzone przepisy";
$config["lang"]="pl";

$config["uploaddir"]=$config["rootdir"]."uploads/";

?>
