<?
require_once("kysoft.php");
try{
	$a=new KySoft();
	$a->initialize();
	$a->process();
	$req=$a->req;
	unset($a);
}
catch(Exception $e)
{
	$req->setval("error",$e->getMessage());
}
$t=new TemplateEngine($req);
$t->load("kysoft.tpl");
?>
