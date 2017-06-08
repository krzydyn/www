<?php
require_once("../config.php");
require_once($config["cmslib"]."modules.php");
require_once($config["cmslib"]."application.php");

$resp=Response::getInstance();
if ($resp->getval("req.res")===null)
	$resp->setval("req.res","user");
if ($resp->getval("req.type")===null)
	$resp->setval("req.type","txt");
if ($resp->getval("req.file")===null)
	$resp->setval("req.file",$resp->getval("req.res").".".$resp->getval("req.type"));

$resp->setval("hdr"); //clear hdr
$type=$resp->getval("req.type");
$resp->setval("tpl","html");
if ($type=="csv") {$resp->addval("hdr","Content-type: text/plain");$resp->setval("tpl","txt");}
else if ($type=="xls") $resp->addval("hdr","Content-type: application/vnd.ms-excel");
else if ($type=="html") $resp->addval("hdr","Content-type: text/html");
else $resp->addval("hdr","Content-type: text/plain");

if ($resp->getval("req.inline")===0)
	$resp->addval("hdr","Content-disposition: attachment; filename=".$resp->getval("req.file"));
else
	$resp->addval("hdr","Content-disposition: filename=".$resp->getval("req.file"));

$resp->addval("hdr","Expires: Mon, 26 Jul 1997 05:00:00 GMT");
$resp->addval("hdr","Pragma: no-store");

db_connect();
$resp->setval("result",db_find($resp->getval("req.res"),"*"));

$t=new TemplateEngine($resp);
$t->load("export.tpl");
?>
