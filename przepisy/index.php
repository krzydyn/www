<?php
/*require_once("config.php");
require_once($config["cmslib"]."router.php");
require_once($config["cmslib"]."request.php");

$r = new Router();
 */
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
