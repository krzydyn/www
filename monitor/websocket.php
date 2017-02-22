<?php
require_once("log.php");

function calcWsAccept($data) {
	static $ws_magic = '258EAFA5-E914-47DA-95CA-C5AB0DC85B11';
	return base64_encode(sha1($data.$ws_magic,true));
}

logstr("connection from: ".$_SERVER["REMOTE_ADDR"]." q=".$_SERVER["QUERY_STRING"]);

$headers = apache_request_headers();
//logstr("hdr:".a2str($headers));
$swk=$headers["Sec-WebSocket-Key"];

//output headers
header("HTTP/1.1 101 Switching Protocols");
header("Upgrade: WebSocket");
header("Connection: Upgrade");
header("Sec-WebSocket-Accept: ".calcWsAccept($swk));
//header("Sec-WebSocket-Protocol: chat");
//$s=socket("localhost",54331);
//close($s);

//phpinfo();
//send resp 
/*
byte[] send = new byte[3 + 2];
send[0] = 0x81; // last frame, text
send[1] = 3; // not masked, length 3
send[2] = 0x41;
send[3] = 0x42;
send[4] = 0x43;
nwStream.Write(send, 0, send.Length); 
*/
?>
