<?php
require_once("recipe.php");
try{
	$a=new RecipeApp();
	$a->initialize();
	$a->process();
	unset($a);
}
catch(Exception $e)
{
	echo "Exception: ".$e->getMessage().";";
	//$req->setval("error",$e->getMessage());
}
$t=new TemplateEngine();
$t->load("recipe.tpl");
?>
