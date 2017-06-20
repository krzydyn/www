<?php
date_default_timezone_set("Europe/Warsaw");

function array_setval(&$t,$n,&$v=null){
	if (empty($n)) return false;
	$n=explode(".",$n);
	for ($i=0; $i<sizeof($n)-1; $i++){
		$k=$n[$i];
		if ((!is_array($t)&&!is_object($t))||!array_key_exists($k,$t)){
			if (!isset($v)) return true;
			$t[$k]=array();
			//echo "$t[$k]=array()<br>";
		}
		if (is_object($t)) $t=&$t->{$k}; else $t=&$t[$k];
	}
	$k=$n[$i];
	if (isset($v)) {if (is_object($t)) $t->{$k}=$v; else $t[$k]=$v;}
	else {if (is_object($t)) unset($t->{$k}); else unset($t[$k]);}
	//echo "$t[$k]=$v<br>";
	return true;
}
function array_hasval(&$t,$n){
	if (empty($n)) return true;
	$n=explode(".",$n);
	for ($i=0; $i<sizeof($n); $i++){
		$k=$n[$i];
		if ((!is_array($t)&&!is_object($t))||!array_key_exists($k,$t)) return false;
		if (is_object($t)) $t=&$t->{$k}; else $t=&$t[$k];
	}
	return true;
}
function &array_getval(&$t,$n,$def=null){
	if (empty($n)) return $t;
	$n=explode(".",$n);
	for ($i=0; $i<sizeof($n); $i++){
		$k=$n[$i];
		if ((!is_array($t)&&!is_object($t))||!array_key_exists($k,$t)) return $def;
		if (is_object($t)) $t=&$t->{$k}; else $t=&$t[$k];
	}
	return $t;
}
function array_unslash(&$t){
	if (!is_array($t)) return ;
	while (list($f,$v)=each($t)){
		if (is_array($v)) array_unslash($t[$f]);
		else $t[$f]=stripslashes($v);
	}
}

class Request{
	private static $instance=null;
	private $vals=array();
	private function __construct() {
		self::Request();
	}
	private function Request(){
		/*
		note: form method GET does not send action paramters
		*/
		global $_REQUEST,$_FILES,$_SERVER,$_GET,$_POST,$_COOKIE;
		global $config,$text;
		$this->setval("cfg",$config);
		$this->setval("txt",$text);
		$this->setval("req",$_REQUEST);
		//POST is propagated into REQUEST
		//COOKIE is propagated into REQUEST
		//GET overwrite POST
		//TODO SESSION propagate into REQUEST

		if (isset($_GET)){
			while (list($fld,$a)=each($_GET)) {
				$this->setval("req.".$fld,$a);
			}
		}
		array_unslash($this->vals["req"]);

		unset($_COOKIE);unset($_REQUEST);unset($_GET);unset($_POST);

		$this->setval("srv",$_SERVER);
		unset($_SERVER);
		$this->setval("method",$this->getval("srv.REQUEST_METHOD"));
		$this->setval("abs-uri",$this->getval("srv.REQUEST_URI"));
		$this->setval("remote-addr",$this->getval("srv.REMOTE_ADDR"));
		$this->setval("remote-port",$this->getval("srv.REMOTE_PORT"));

		$appuri=$this->getval("cfg.rooturl");
		$appuri=strtr($appuri,array("//"=>"/"));
		$this->setval("cfg.rooturl",$appuri);
		$uri = $this->getval("abs-uri");
		if (strpos($uri,"?")!==false) {
			$uri=substr($uri,0,strpos($uri,"?"));
		}
		if ($appuri!==false && strpos($uri,$appuri)===0)
			$this->setval("uri","/".substr($uri,strlen($appuri)));
		else
			$this->setval("uri","/");

		if (isset($_FILES)){
			while (list($fld,$a)=each($_FILES)){
				//TODO (maybe) copy files from tmp to site location
				while (list($fld1,$a1)=each($a)){
					while (list($fld2,$a2)=each($a1)){
						if ($a2=="") $a2=null;
						if ($fld1=="name") $this->setval("req.".$fld.".".$fld2,$a2);
						$this->setval("req.".$fld.".".$fld2."_file.".$fld1,$a2);
					}
				}
			}
			unset($_FILES);
		}
	}
	static function &getInstance() {
		if (self::$instance==null) self::$instance=new Request();
		return self::$instance;
	}

	function hasval($n) {
		return array_hasval($this->vals,$n);
	}
	function &getval($n=null,$v=null) {
		return array_getval($this->vals,$n,$v);
	}
	function setval($n,$v=null) {
		if (is_array($n)) {
			while (list($nn,$v)=each($n)) $this->setval($nn,$v);
			return true;
		}
		return array_setval($this->vals,$n,$v);
	}
	function addval($n,$v) {
		$a=$this->getval($n);
		if (!$a) $a=array($v);
		else if (!is_array($a)) $a=array($a,$v);
		else $a[]=$v;
		$this->setval($n,$a);
	}
}
?>
