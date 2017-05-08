<?
class sqlite3_RecordSet extends RecordSet{
	function setresult($r){
		$this->res=$r;
		$this->rowidx=0;
		$this->numrows=0;
		$this->numfields=$this->res->numColumns();
		if ($this->numfields>0) $this->numrows=1;
	}
	function fetch($mode=0){
		if ($this->rowidx>=$this->numrows) return null;
		if ($mode==FETCH_ASSOC) $mode=SQLITE3_ASSOC;
		else $mode=SQLITE3_NUM;
		$this->row=$this->res->fetchArray($mode);
		if ($this->row) {++$this->rowidx;++$this->numrows;return $this->row;}
		return null;
	}
	function seek($i){
		if ($this->numrows==0) return false;
		if ($i==0) $r=$this->res->reset();
		else $r=$this->res->seek($i); // ?? not in sqlite3
		if ($r===true) $this->rowidx=$i;
		return $r;
	}
}
class sqlite3_DB extends DB{
	function sqlite3_DB(){$this->dbtype="sqlite3";}
	function connect($h,$u,$p="",$db=""){
		if ($this->dbhnd) {$this->dbhnd->close();$this->dbhnd=null;}
		$this->dbhnd=new SQLite3($db);
		return true;
	}
	function dbselect($db){
		$this->dbhnd->close();
		$this->dbname=$db;
		$this->dbhnd->open($db);
		return true;
	}
	function dbcreate($db){return $this->dbselect($db);}
	function &query($q){
		global $config;
		if (!$this->dbhnd) {$this->_errmsg="not connected";return false;}
		$q=trim($q);
		if (empty($q)) return true;
		$this->sql=$q;
		//if (array_getval($config,"debug.query")=="y") printobj("query",$this->sql);
		$r=@$this->dbhnd->query($this->sql);
		$this->seterr($r);
		if ($r===false) return $r;
		$rs=new sqlite3_RecordSet();
		if ($r===true) return $rs;
		$rs->setresult($r);
		return $rs;
	}
	function insertid(){
		if (!$this->dbhnd) {$this->_errmsg="not connected";return false;}
		return $this->dbhnd->lastInsertRowID();
	}

	function affected() {
		return $this->dbhnd->changes();
	}
	function tables() {
		$r=$this->query("select tbl_name from sqlite_master where type='table'");
		if ($r===false) return false;
		$tabs=array();
		while ($row=$r->fetch(FETCH_NUM)) $tabs[]=$row[0];
		return $tabs;
	}
	function describe($t) {
	}
	private function seterr($r){
		if ($r===false){
			$r=$this->dbhnd->lastErrorCode();
			$this->_errmsg=$r.":".$this->dbhnd->lastErrorMsg()." '".$this->qstr()."'";
		}
		else $this->_errmsg=null;
	}
}
?>
