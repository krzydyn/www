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
	function __construct() {$this->dbtype="pdo";}
	function connect($h,$u,$p="",$db=""){
		$this->close();
		$this->dbhnd=new PDO($db);
		return true;
	}
	function close() {if ($this->dbhnd) {$this->dbhnd->close();$this->dbhnd=null;}}
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
		
		$this->sql=$q;
		//if (array_getval($config,"debug.query")=="y") logstr("query: ".$this->sql);
		if (sizeof($params) > 0) {
			$stmt = $this->dbhnd->prepare($q);
			reset($params);
			foreach ($params as $k => $v)
				$stmt->bindValue($k, $v);
			unset($k);unset($v);
			$r=$stmt->execute();
		}
		else {
			$r=@$this->dbhnd->query($this->sql);
		}
		$this->seterr($r);
		if ($r===false) return $r;
		$rs=new pdo_RecordSet();
		//if ($r===true) return $rs;
		$rs->setresult($stmt);
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
		$r=$this->query("SHOW TABLES");
		if ($r===false) return false;
		$tabs=array();
		while ($row=$r->fetch(FETCH_NUM)) $tabs[]=$row[0];
		return $tabs;
	}
	function describe($t) {
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
		}
		else $this->_errmsg=null;
	}
}
?>
