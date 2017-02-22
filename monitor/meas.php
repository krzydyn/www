<?php
require_once("log.php");
require_once("tcp.php");
require_once("stream.php");

class PntConfig {
	var $id,$name,$unit,$descr;
	function read(&$s) {
		$this->id=$s->readInt();
		if ($this->id===false) return false;
		$this->name=$s->readUTF();
		$this->unit=$s->readUTF();
		$this->descr=$s->readUTF();
	}
	function toString() {
		return json_encode($this);
	}
}

class PntData {
	var $id,$tm,$value;
	function read(&$s) {
		if ($this->readId($s)!==false) $this->readData($s);
		return $this->id;
	}
	function readId(&$s) {
		$this->id=$s->readInt();
		return $this->id;
	}
	function readData(&$s) {
		$this->tm=$s->readLong();
		$this->value=$s->readFloat();
		return $this->tm;
	}
	function toString() {
		return json_encode($this);
	}
}

define('CMD_CONFIG',0);
define('CMD_LAST',1);
define('CMD_HISTORY',3);
function getConfig(&$s) {
	$msg=new StringStream();
	$d=new DataStream($msg);
	$d->writeShort(CMD_CONFIG);
	tcp_send($s,$msg->getBytes());
	return tcp_recv($s);
}
function getLast(&$s,$id=0) {
	$msg=new StringStream();
	$d=new DataStream($msg);
	$d->writeShort(CMD_LAST);
	if ($id) $d->writeInt($id);
	tcp_send($s,$msg->getBytes());
	return tcp_recv($s);
}
function getHistory(&$s,$id,$fr,$to) {
	logstr("getHist(".$id.",".$fr.",".$to.")");
	$step=(int)(($to-$fr)/100);
	$msg=new StringStream();
	$d=new DataStream($msg);
	$d->writeShort(CMD_HISTORY);
	$d->writeInt($id);
	$d->writeUTF("?");
	$d->writeLong($fr);
	$d->writeLong($to);
	$d->writeLong($step);
	tcp_send($s,$msg->getBytes());
	//TODO recv several packages
	return tcp_recv($s);
}

logstr("connection from: ".$_SERVER["REMOTE_ADDR"]." q=".$_SERVER["QUERY_STRING"]);

class Error {
	var $msg;
	function Error($msg) {
		$this->msg=$msg;
	}
}

//header('Content-Type: application/json');
//header('Content-Type: text/plain');
if (!array_key_exists("c",$_GET)) {
	http_response_code(400);
	exit(0);
}
$s=false;
$cmd=$_GET["c"];
if ($cmd == "cfg") {
	$s=tcp_connect("localhost",54331);
	$msg=getConfig($s);
	tcp_close($s);
	//echo "cfg:[".strlen($msg)."]:".strhex($msg);

	$stream=new DataStream(new StringStream($msg));
	$stream->readShort();//cmd
	$p=new PntConfig();
	$a=array();
	while ($p->read($stream)!==false) {
		$a[]=$p;
		$p=new PntConfig();
	}
	echo json_encode($a);
}
else if ($cmd == "hist") {
	if (!array_key_exists("id",$_GET) || !array_key_exists("fr",$_GET)) {
		http_response_code(400);
		exit(0);
	}
	$id=$_GET["id"];
	$fr=$_GET["fr"];
	if (array_key_exists("to",$_GET)) $to=$_GET["to"];
	else $to=time();
	$s=tcp_connect("localhost",54331);
	$msg=getHistory($s,$id,$fr,$to);
	tcp_close($s);
	//echo "hist[".strlen($msg)."]:".strhex($msg);
	$stream=new DataStream(new StringStream($msg));
	$stream->readShort();//cmd
	$p=new PntData();
	$p->readId($stream);
	$stream->readUTF(); //key
	$a=array();
	while ($p->readData($stream)!==false) {
		$obj=new stdClass();
		$obj->tm=$p->tm;
		$obj->value=$p->value;
		$a[]=$obj;
	}
	echo json_encode($a);
}
else if ($cmd == "last") {
	if (!array_key_exists("id",$_GET)) {
		http_response_code(400);
		exit(0);
	}
	$id=$_GET["id"];
	$s=tcp_connect("localhost",54331);
	$msg=getLast($s,$id);
	tcp_close($s);

	$stream=new DataStream(new StringStream($msg));
	$stream->readShort();//cmd
	$p=new PntData();
	while ($p->read($stream)!==false) {
		echo $p->toString();
	}
}
else {
	http_response_code(400);
	exit(0);
}

?>
