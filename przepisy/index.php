<?
require_once("recipe.php");
try{
	$a=&new RecipeApp();
	$a->initialize();
	$a->process();
	unset($a);
}
catch(Exception $e)
{
	//$req->setval("error",$e->getMessage());
}
$t=&new TemplateEngine();
$t->load("recipe.tpl");
?>
