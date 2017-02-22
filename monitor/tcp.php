<?php
require_once("log.php");

function tcp_connect($host,$port) {
	$sock=socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
	if (@socket_connect($sock, $host, $port) === false) {
		$err = socket_last_error($sock);
		//$err == EINPROGRESS ?
		logstr("connect ".$host." ".socket_strerror($err)." (".$err.")");
		socket_close($sock);
		return false;
	}
	logstr("connected ".$host.":".$port);
	return $sock;
}

function tcp_close(&$sock) {
	if ($sock !== false)
		socket_close($sock);
	$sock = false;
}

function tcpread(&$sock,$len) {
	$m="";
	for ($i=0; $i<$len; ) {
		$r=socket_read($sock,$len-$i);
		if ($r===false) {
			logstr("read ".socket_strerror($err)." (".$err.")");
			$err=socket_last_error($sock);
			if ($err==10035) {usleep(100000);continue;}
			return false;
		}
		if ($r==="") continue;
		$m.=$r; $i+=strlen($r);
	}
	return $m;
}

function tcp_send(&$sock, $msg) {
	$l=strlen($msg);
	$r=socket_write($sock,pack("n",$l).$msg,$l+2);
	if ($r === false) {
		$err = socket_last_error($sock);
		logstr("write ".socket_strerror($err)." (".$err.")");
		return false;
	}
	//logstr("requ[".$l."]:".strhex($msg));
	return $r;
}

function tcp_recv(&$sock) {
	//$msg=tcpread($sock,2);
	$msg=socket_read($sock,2);
	$l=unpack("n",$msg); $l=$l[1];
	//$msg=tcpread($sock,$l);
	$msg=socket_read($sock,$l);
	//logstr("resp[".$l."]:".strhex($msg));
	return $msg;
}
?>
