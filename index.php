<?php
require_once("kysoft.php");
$req = Request::getInstance();
try{
	$a=new KySoft();
	$a->initialize();
	$a->process();
	unset($a);
}
catch(Exception $e)
{
	$req->setval("error",$e->getMessage());
}
$t=new TemplateEngine($req);
$t->load("kysoft.tpl");
?>
