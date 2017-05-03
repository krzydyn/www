<?
class sqlite3_RecordSet extends RecordSet{
}
class sqlite3_DB extends DB{
	function sqlite3_DB(){$this->dbtype="sqlite3";}
	function connect($h,$u,$p="",$db=""){
		if (!empty($db)) $this->dbselect($db);
		return true;
	}
	function dbselect($db){
		$this->dbname=$db;
		if ($this->dbhnd) {$this->dbhnd->close();$this->dbhnd=null;}
		$this->dbhnd=new SQLite3();
		$this->dbhnd->open($db);
		return true;
	}
	function dbcreate($db){return $this->dbselect($db);}
	function &query($q){
		$this->sql=$q;
		$this->dbhnd->query($q);
	}
}
?>
