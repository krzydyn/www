<?php

class pdo_RecordSet extends RecordSet{
	function setresult($r){
		$this->res=$r;
		$this->rowidx=0;
		$this->numrows=0;
		$this->numfields=$this->res->columnCount();
		if ($this->numfields>0) $this->numrows=1;
	}
	function fetch($mode=0){
		if ($this->rowidx>=$this->numrows) return null;
		if ($mode==FETCH_ASSOC) $mode=PDO::FETCH_ASSOC;
		else $mode=PDO::FETCH_NUM;
		$this->row=$this->res->fetch($mode);
		if ($this->row) {++$this->rowidx;++$this->numrows;return $this->row;}
		return null;
	}
	function seek($i){
		if ($this->numrows==0) return false;
		if ($i==0) $r=$this->res->reset();
		else $r=$this->res->seek($i); // ?? not in pdo
		if ($r===true) $this->rowidx=$i;
		return $r;
	}
}
class pdo_DB extends DB{
	var $dbtype;
	function __construct() {$this->dbtype="pdo";}
	function connect($h,$u,$p="",$db=""){
		$this->dbtype=substr($db,0,strpos($db,':'));
		$this->close();
		$this->dbhnd=new PDO($db);
		return true;
	}
	function close() {if ($this->dbhnd) {$this->dbhnd=null;}}
	function dbselect($db){
		$this->dbhnd->close();
		$this->dbname=$db;
		$this->dbhnd->open($db);
		return true;
	}
	function dbcreate($db){return $this->dbselect($db);}
	function &query($q, $params=array()){
		global $config;
		if (!$this->dbhnd) {$this->_errmsg="not connected";return false;}
		$q=trim($q); $r=true;
		if (empty($q)) return $r;
		
		if (sizeof($params) > 0) {
			$this->sql=$q."('".implode("','",$params)."')";
			$stmt = $this->dbhnd->prepare($q);
			$this->seterr($stmt);
			if ($stmt===false) return $stmt;
			reset($params);
			foreach ($params as $k => $v)
				$stmt->bindValue($k, $v);
			unset($k);unset($v);
			$r=$stmt->execute();
		}
		else {
			$this->sql=$q;
			$r=@$this->dbhnd->query($q);
			$stmt=$r;
		}
		$this->seterr($r);
		if ($r===false) return $r;
		$rs=new pdo_RecordSet();
		$rs->setresult($stmt);
		$stmt=null;
		return $rs;
	}
	function insertid(){
		if (!$this->dbhnd) {$this->_errmsg="not connected";return false;}
		//optinal arg = name of a sequence object
		return $this->dbhnd->lastInsertId();
	}
	function affected() {
		return $this->dbhnd->changes();
	}
	function tables() {
		if ($this->dbtype=="sqlite")
			$r=$this->query("select tbl_name from sqlite_master where type='table'");
		else
			$r=$this->query("SHOW TABLES");

		if ($r===false) return false;
		$tabs=array();
		while ($row=$r->fetch(FETCH_NUM)) $tabs[]=$row[0];
		return $tabs;
	}
	function describe($t) {
		if ($this->dbtype=="sqlite")
			$r=$this->query("select tbl_name,sql from sqlite_master where type='table' and tbl_name='".$t."'");
		else
			$r=$this->query("SHOW COLUMNS FROM `$t`");
		if ($r===false) return false;
		$f=array();
		while ($row = $r->fetch(FETCH_NUM)) {
			print_r($row);
			$f[$row[0]]=$row[1];
		}
		return $f;
	}
	private function seterr($r){
		if ($r===false){
			$r=$this->dbhnd->errorInfo();
			$msg=$r[2];
			$r=$r[0].":".$r[1];
			$this->_errmsg=$r.":".$msg." '".$this->qstr()."'";
			logstr($this->_errmsg);
		}
		else $this->_errmsg=null;
	}
}
?>
