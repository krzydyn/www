<?php
require_once("log.php");
require_once("stream.php");
require_once("tcp.php");

$msg=new StringStream();
$d=new DataStream($msg);
$d->writeInt(12);
echo strhex($msg->getBytes())."<br>\n";
$d->writeShort(16);
echo strhex($msg->getBytes())."<br>\n";
$d->writeUTF("ala ma kota");
echo strhex($msg->getBytes())."<br>\n";

echo "reading:<br>\n";
echo $d->readInt()."<br>\n";
echo $d->readShort()."<br>\n";
echo $d->readUTF()."<br>\n";


define('CMD_CONFIG',0);
define('CMD_LAST',1);
define('CMD_HISTORY',3);
function getConfig(&$s,$id=0) {
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
	if ($id!=0) $d->writeInt($id);
	tcp_send($s,$msg->getBytes());
	return tcp_recv($s);
}
function getHistory(&$s,$id,$fr,$to) {
	$step = (int)(($to-$fr)/1000);
	if ($step < 60) $step=60;
	$msg=new StringStream();
	$d=new DataStream($msg);
	$d->writeShort(CMD_HISTORY);
	$d->writeInt($id);
	$d->writeUTF("?");
	$d->writeLong($fr);
	$d->writeLong($to);
	$d->writeLong($step);
	echo "sendHist: ".strhex($msg->getBytes())."<br>\n";
	tcp_send($s,$msg->getBytes());
	return tcp_recv($s);
}

//header('Content-Type: text/plain');

logstr("user:".get_current_user()." uid=".getmyuid().", euid=".posix_geteuid());

$s=tcp_connect("localhost",54331);
//$msg=getConfig($s);
//echo "recv[".strlen($msg)."]:".strhex($msg)."<br>\n";
$msg=getLast($s,5);
echo "recvLast[".strlen($msg)."]:".strhex($msg)."<br>\n";
//$msg=getHistory($s,5,1440940000,'11440948600');
//echo "recvHist[".strlen($msg)."]:".strhex($msg)."<br>\n";

?>
