<?php
require_once("config.php");
require_once($config["cmslib"]."modules.php");
require_once($config["cmslib"]."application.php");

class App extends Application{
	var $db;
	function initialize() {
		$db=DB::connectDefault();
		$this->db=$db;
		$tabs=$db->tables();
		$reqtabs=array(
			"santa2012"=>"name char(20) primary key,updatetm int,value text"
		);
		if ($tabs===false){
			$this->addval("error","DB:".$db->errmsg());
			return false;
		}
		while (list($t,$v)=each($reqtabs)){
			if (in_array($t,$tabs)) continue;
			$r=$db->tabcreate($t,$v);
			if ($r===false) {$this->addval("error","DB:".$db->errmsg());return false;}
		}
		$r=$db->describe("santa2012");
		if ($r===false) {$this->addval("error","DB:".$db->errmsg());return false;}
		if (!array_key_exists("updatetm",$r)){
			$db->addcolumn("santa2012","updatetm int","value");
			$db->tabupdate("santa2012",array("updatetm"=>time()),"");
		}
	}
	function process(){
		$this->setval("sitetitle","Do św Mikołaja");
		parent::process();
	}
	function defaultAction(){
		$this->setval("refresh",3600);
		$this->listAction();
	}
	function editAction(){
		$id=$this->getval("req.id");
		if (!empty($id)){
			$r=$this->db->tabfind("santa2012","name,value","where name=#name",array("name"=>$id));
			if ($r===false) {
				$this->addval("error","DB:".$this->db->errmsg());
				$this->listAction();
				return ;
			}
			if (sizeof($r)==0) {
				$this->listAction();
				return ;
			}
			$item=$r[0];
		}
		else $item=array("name"=>"","value"=>"");
		$this->setval("item",$item);
		$this->setval("view","ankietaitem");
	}
	function delAction(){
		$id=$this->getval("req.id");
		$r=$this->db->tabdelete("santa2012","where name=#name",array("name"=>$id));
		if ($r===false) $this->addval("error","DB:".$this->db->errmsg());
		$this->listAction();
	}
	function saveAction(){
		$id=$this->getval("req.id");
		$item=$this->getval("req.item");
		while (list($f,$v)=each($item))
			$item[$f]=trim($item[$f]);
		reset($item);
		if (empty($item["name"])) {
			$this->addval("error","Nazwa nie mo¿e byæ pusta");
			$this->listAction();
			return ;
		}
		$item["updatetm"]=time();
		if (empty($id)){
			$r=$this->db->tabinsert("santa2012",$item);
			if ($r===false) $this->addval("error","DB:".$this->db->errmsg());
			else $this->addval("info","dodano");
		}
		else {
			$r=$this->db->tabupdate("santa2012",$item,"where name=#name",array("name"=>$id));
			if ($r===false) $this->addval("error","DB:".$this->db->errmsg());
			else $this->addval("info","zaktualizowano");
		}
		$this->listAction();
	}
	function listAction(){
		$items=array();
		$this->listItems($items);
		$tm=0;
		for ($i=0; $i<sizeof($items); ++$i)
			if ($tm<$items[$i]["updatetm"])$tm=$items[$i]["updatetm"];
		$this->setval("lastupdate",$tm);
		$this->setval("items",$items);
		$this->setval("view","ankietalist");
		if (($r=$this->getval("refresh"))==null)
			$this->setval("refresh",60);
	}
	function listItems(&$items){
		$r=$this->db->tabfind("santa2012","name,updatetm,value","order by updatetm desc");
		if ($r===false) $this->addval("error","DB:".$this->db->errmsg());
		else {
			for ($i=0; $i<sizeof($r); ++$i){
				$item=$r[$i];
				$item["value"]=nl2br(html_fromBB($item["value"]));
				$items[]=$item;
			}
		}
		$item=array();
		$item["name"]="";
		$item["updatetm"]="";
		$item["value"]="";
		$items[]=$item;
	}
}
$a=new App();
$a->initialize();
$a->process();
unset($a);
$t=new TemplateEngine();
$t->load("ankieta.tpl");
?>
