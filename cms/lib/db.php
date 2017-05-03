<?php
define('FETCH_ASSOC',0);
define('FETCH_NUM',1);

function sql_escape($s){
	$tr=array("'"=>"''");
	return strtr($s,$tr);
}

abstract class RecordSet{
	var $res=null;
	var $numrows=0;
	var $rowidx=0;
	var $numfields=0;
	abstract function setresult($r);
	abstract function fetch($mode=FETCH_ASSOC);
	function nextrow() { return $this->fetch(); }
}
abstract class DB{
	var $dbtype=null;
	var $dbname=null;
	var $dbhnd=null;
	var $sql=null;//last query
	var $_errmsg;

	abstract function connect($h,$u,$p="",$db="");
	abstract function dbselect($db);
	abstract function dbcreate($db);
	abstract function &query($q);
	abstract function insertid();
	abstract function affected();
	abstract function tables();
	abstract function describe($t);

	function errmsg(){return $this->_errmsg;}
	function qstr(){return $this->sql;}
	function tabcreate($tab,$def){
		return $this->query("create table ".$tab."(".$def.")");
	}
	function tabdrop($tab){
		return $this->query("drop table ".$tab);
	}
	function tabinsert($tab,$row){
		$fields=array();
		$values=array();
		while (list($f,$v)=each($row)){
			if ($v===null) continue;
			if ($v==="") $v="''";
			else if (is_numeric($v)) ;
			else $v="'".sql_escape($v)."'";
			$fields[]=$f; $values[]=$v;
		}
		$r=$this->query("insert into ".$tab." (".implode(",",$fields).")values(".implode(",",$values).")");
		if ($r===false) return false;
		return $this->insertid();
	}
	function tabupdate($tab,$row,$fmt,$a=null){
		$set="";
		while (list($f,$v)=each($row)){
			if ($v===null) continue;
			if ($v==="") $v="''";
			else if (is_numeric($v)) ;
			else $v="'".sql_escape($v)."'";
			$set.=$f."=".$v.",";
		}
		if ($set=="") {echo "set list empyty<br>";return false;}
		$set=substr($set,0,-1);
		if ($this->query("update ".$tab." set ".$set.DB::buildfmt($fmt,$a))===false) return false;
		return $this->affected();
	}
	function tabdelete($tab,$fmt,$a=null){
		if ($this->query("delete from ".$tab.DB::buildfmt($fmt,$a))===false) return false;
		return $this->affected();
	}
	function tabcount($tab,$fmt=null,$a=null){
		$r=$this->query("select count(*) from ".$tab.DB::buildfmt($fmt,$a));
		if ($r==null) return false;
		$row=$r->fetch(FETCH_NUM);
		return $row[0];
	}
	function &tabfind($tab,$fld="*",$fmt=null,$a=null){
		if (!$fld) $fld="*";
		$r=$this->query("select $fld from ".$tab.DB::buildfmt($fmt,$a));
		if ($r==null) {$r=false;return $r;}
		$a=array();
		while ($row=$r->fetch()) $a[]=$row;
		return $a;
	}
	function tabalter($tab,$c){
		return $this->query("alter table ".$tab." ".$c);
	}
	function addcolumn($tab,$cdef,$before=""){
		$desc=$this->describe($tab);
		if ($desc===false) return false;
		$row=explode(",",$cdef);
		$cdef=array();
		while (list($f,$v)=each($desc)){
			if ($f==$before){
				for ($i=0; $i<sizeof($row); ++$i)
					$cdef[]=$row[$i];
				$row=null;
			}
			$cdef[]=$f." ".$v;
		}
		if ($row!=null){
			for ($i=0; $i<sizeof($row); ++$i)
				$cdef[]=$row[$i];
		}

		$r=$this->query("select * from ".$tab);
		$a=array();
		while ($row=$r->fetch()) $a[]=$row;
		$this->tabdrop($tab);
		$this->tabcreate($tab,implode(",",$cdef));
		for ($i=0; $i<sizeof($a); ++$i) $this->tabinsert($tab,$a[$i]);
	}
	/*
	 '#fld' in fmt will be replaced with $a[fld]
	*/
	static function buildfmt($fmt,$a){
		if ($fmt==null) return "";
		if ($a==null) return " ".$fmt;
		$tr=array("\\#"=>"#");
		while (list($f,$v)=each($a)){
			if ($v=="") $v="''";
			else if (is_numeric($v)) ;
			else $v="'".sql_escape($v)."'";
			$tr["#".$f]=$v;
		}
		return " ".	strtr($fmt,$tr);
	}

	static function &getDriver($driver=null){
		global $config;
		if (empty($driver)) $driver=$config["dbtype"];
		include_once($config["cmslib"]."db/".$driver.".php");
		$c=$driver."_DB";
		$c=new $c();
		return $c;
	}
	static function &connectDefault(){
		global $config;
		$dbh=DB::getDriver();
		if ($dbh){
			@$host=$config["dbhost"];
			@$user=$config["dbuser"];
			@$pass=$config["dbpasswd"];
			$dbname=$config["dbname"];
			$dbh->connect($host,$user,$pass,$dbname);
		}
		return $dbh;
	}
}
?>
