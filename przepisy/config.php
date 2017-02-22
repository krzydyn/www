<?php
$config=array();
// paths setup
if (strstr(__FILE__,"htdocs")) //local apache
{
$config["cmslib"]=strtr(dirname(__FILE__),"\\","/")."/../../cms/kdcms/lib/";
$config["cmsurl"]="/cms/kdcms/";
}
else
{
$config["cmslib"]=strtr(dirname(__FILE__),"\\","/")."/../cms/lib/";
$config["cmsurl"]="/cms/";
}
$config["rootdir"]=strtr(dirname(__FILE__),"\\","/")."/"; //path to the site files
$config["rooturl"]=dirname($_SERVER["PHP_SELF"])."/"; //url to the site
$config["cachedir"]="cache/"; //relative to rootdir
$config["templatedir"]=array($config["rootdir"]."templates/");
$config["templateexpired"]="force"; //modtime

$config["fck"]="/cms/ckeditor/";//FCK install dir
$config["fckfiledir"]="upload"; //relative to rootdir
if (strstr(__FILE__,"htdocs")) //local apache
$config["fckconfig"]="FCKconfig_loc.js"; //relative to rooturl
else
$config["fckconfig"]="FCKconfig.js"; //relative to rooturl

// db setup
//$config["debug"]["query"]="y";
$config["dbtype"]="sqlite";
$config["dbname"]="db/recipe.sqlite";

$config["sitetitle"]="Sprawdzone przepisy";
$config["lang"]="pl";

$config["uploaddir"]=$config["rootdir"]."uploads/";

?>
