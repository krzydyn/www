<?
header("Content-type: application/rss+xml");
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";

require_once("config.php");
require_once($config["cmslib"]."modules.php");
require_once($config["cmslib"]."application.php");

class App extends Application{
	var $db;
	function process(){
		$this->setval("description","Aktualności");
		$r=filemtime("kysoft.php");
		$this->setval("buildtm",$r);

		$items=array();
		$this->db=DB::connectDefault();
		$this->listMoto($items);
		$this->listJokes($items);
		$this->setval("items",$items);
	}
	function listJokes(&$items){
		$r=$this->db->tabfind("joke","updatetm,category,contents","order by updatetm desc limit 5");
		if ($r===false) ;
		else {
			for ($i=0; $i<sizeof($r); ++$i){
				$c=$r[$i]["contents"];
				if (strlen($c)>80) $c=substr($c,0,50)." (więcej...)";
				$item=array();
				$item["title"]=$r[$i]["category"];
				$item["author"]="kysoft";
				$item["link"]="http://kysoft.pl?tab=jokes";
				$item["updatetm"]=$r[$i]["updatetm"];
				$item["contents"]=html_escape(nl2br($c));
				$items[]=$item;
				unset($r[$i]);unset($c);
			}
		}
	}
	function listMoto(&$items){
		$a=array();
		$a=array_merge($a,readfiles("templates/moto","20.*tpl"));
		$a=array_splice($a,-5);
		$a=array_merge(readfiles("templates/moto","dyno.*tpl"),$a);
		for ($i=0; $i<sizeof($a); ++$i){
			$f=$a[sizeof($a)-$i-1];
			$item=array();
			//$item["title"]=strtr($f,array(".tpl"=>""));
			$item["author"]="kysoft";
			$item["link"]="http://kysoft.pl?tab=moto/".strtr($f,array(".tpl"=>""));
			$f="templates/moto/".$f;
			$item["updatetm"]=filemtime($f);
			$c=file_get_contents($f);
			preg_match_all("/<h2>(.*?)<\/h2>/",$c,$tit);
			$tit=$tit[1];
			//$c="";
			//for ($j=0; $j<sizeof($tit); ++$j) $c.="/".$tit[$j];
			//$c=substr($c,1);
			$c=implode("/",$tit);
			//$item["contents"]=html_escape(nl2br($c));
			$item["title"]=html_escape(nl2br($c));
			$items[]=$item;
		}
	}
}
$a=new App();
$a->initialize();
$a->process();
//$req=$a->req;
unset($a);
$t=new TemplateEngine();
$t->load("rss.tpl");
//print_r($req);
?>
