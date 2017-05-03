<?php
//\n[ \t]*{
function array_setval(&$t,$n,&$v=null){
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
	$n=explode(".",$n);
	for ($i=0; $i<sizeof($n); $i++){
		$k=$n[$i];
		if ((!is_array($t)&&!is_object($t))||!array_key_exists($k,$t)) return false;
		if (is_object($t)) $t=&$t->{$k}; else $t=&$t[$k];
	}
	return true;
}
function &array_getval(&$t,$n,$def=null){
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
		if (isset($_GET)){
			while (list($fld,$a)=each($_GET))
				$this->setval("req.".$fld,$a);
		}

		array_unslash($this->vals["req"]);
		unset($_COOKIE);unset($_REQUEST);unset($_GET);unset($_POST);
		//$this->addval("debug",$this->getval("req.lang"));
		//$this->addval("debug",$this->getval("req.tab"));

		$this->setval("srv",$_SERVER);
		unset($_SERVER);
		if (strpos($qstr=$this->getval("srv.QUERY_STRING"),"act=")!=null){
			$this->setval("srv.QUERY_STRING",str_replace("act=","_=",$qstr));
		}
		//echo "qs=".$this->getval("srv.QUERY_STRING");

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

	function setval($n,$v=null) {
		if (is_array($n)) {
			while (list($nn,$v)=each($n)) $this->setval($nn,$v);
			return true;
		}
		return array_setval($this->vals,$n,$v);
	}
	function hasval($n) {
		return array_hasval($this->vals,$n);
	}
	function &getval($n,$v=null) {
		return array_getval($this->vals,$n,$v);
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
