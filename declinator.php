<?
require_once("config.php");
require_once($config["cmslib"]."modules.php");
require_once($config["cmslib"]."application.php");
require_once($config["cmslib"]."../lang/langpl.php");

class Declinator extends Application{
	function defaultAction() {
		$v=$this->getval("req.noun","");
		if (!$v) {
			$this->setval("req.noun","");
			return ;
		}
		$labels=array("M(kto,co)","D(kogo,czego)","C(komu,czemu)","B(kogo,co)",
			"N(z kim,z czym)","Mc(o kim,o czym)","W(O ...!)");
		$r=array();
		for ($d=0; $d<7; ++$d) {
			$r[]=array("label"=>$labels[$d],
				"singular"=>decline($v,$d,SINGULAR),
				"plural"=>decline($v,$d,PLURAL));
		}
		$this->setval("res",$r);
	}
}

try{
	$a=&new Declinator();
	$a->initialize();
	$a->process();
	unset($a);
}
catch(Exception $e)
{
	//$req->setval("error",$e->getMessage());
}
$t=&new TemplateEngine();
$t->load("declinator.tpl");
?>
