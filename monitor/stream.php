<?php
require_once("log.php");
abstract class Stream {
	abstract function _read();
	abstract function _write($c);

	function close() {}

	function read($l=1) {
		$m=$this->_read();
		if ($m!==false) {
			--$l;
			while ($l>0 && ($r=$this->_read())!==false) {$m.=$r; --$l;}
		}
		return $m;
	}

	function write() {
		if (func_num_args() == 0) throw new Exception("arg required");
		if (func_num_args() == 1) {
			return $this->_write(func_get_arg(0));
		}
		else if (func_num_args() == 2) {
			$s=func_get_arg(0);
			$l=func_get_arg(1);
			return $this->_write(substr($s,$o,$l));
		}
		else {
			$s=func_get_arg(0);
			$o=func_get_arg(1);
			$l=func_get_arg(2);
			return $this->_write(substr($s,$o,$l));
		}
	}

	function readFully($l) {
		$m="";
		for ($i=0; $i<$len; ) {
			$r=$this->read($len-$i);
			if ($r===false) {
				logstr("readFully error");
				return false;
			}
			$l=strlen($r);
			if ($l==0) continue;
			$m.=$r; $i+=$l;
		}
		return $m;
	}
}

class StringStream extends Stream {
	var $buf, $offs, $len;

	function StringStream($b="") {
		$this->buf=$b;
		$this->offs=0;
		$this->len=strlen($b);
	}
	function getBytes() { return $this->buf; }
	function _read() {
		if ($this->offs>=$this->len) return false;
		return $this->buf[$this->offs++];
	}
	function _write($c) {
		$l=strlen($c);
		$this->buf.=$c;
		$this->len+=$l;
		//logstr( "StringStream::_write:".strhex($c).", len=".$this->len);
		return $l;
	}
	function read($l) {
		if ($this->offs+$l > $this->len) return false;
		$m=substr($this->buf,$this->offs,$l);
		$this->offs+=$l;
		return $m;
	}
}

class SocketStream extends Stream {
	var $sock;
	function SocketStream() {
		if (func_num_args() == 0) throw new Exception("arg required");
		if (func_num_args() == 1) {
			$this->sock = func_get_arg(0);
		}
		else if (func_num_args() == 2) {
			$host = func_get_arg(0);
			$port = func_get_arg(1);
			$this->sock = socket_connect($host,$port);
		}
	}
	function close() {
		socket_close($this->sock);
		$this->sock=false;
	}
	function _read() {
		return socket_read($sock,1);
	}
	function _write($c) {
		return socket_write($sock,$c);
	}
	function read($l) {
		return socket_read($sock,$l);
	}
}

class DataStream extends Stream {
	var $stream;
	function DataStream(&$s) {
		$this->stream = &$s;
	}
	function _read() { return $this->stream->_read(); }
	function _write($c) { return $this->stream->_write($c); }
	function read($l) { return $this->stream->read($l); }

	function writeShort($v) {
		return $this->write(pack("n",$v));
	}
	function writeInt($v) {
		return $this->write(pack("N",$v));
	}
	function writeLong($v) {
		if ($v < 0xffffffff) {
			return $this->writeInt(0)+$this->writeInt($v);
		}
		else if (PHP_INT_SIZE > 4) {
			return $this->writeInt($v>>32)+$this->writeInt($v&0xffffffff);
		}
		else {
			$v=str_pad(bcdechex($v.""),16,"0",STR_PAD_LEFT);
			return $this->write(pack("H*",$v));
		}
	}
	function writeFloat($v) {
		return $this->write(strrev(pack("f",$v)));
	}
	function writeUTF($v) {
		$l=strlen($v);
		if ($l>0x7fff) $l=0x7fff;
		$r=$this->writeShort($l);
		$r+=$this->write($v,0,$l);
		return $r;
	}

	function readShort() {
		$m=$this->read(2);
		if ($m!==false) {$m=unpack("n",$m); $m=$m[1];}
		return $m;
	}
	function readInt() {
		$m=$this->read(4);
		if ($m!==false) {$m=unpack("N",$m); $m=$m[1];}
		return $m;
	}
// NOTE time(secs from epoch) save on signed int4 is correct until '2038-01-19 04:14:07'
// NOTE time(secs from epoch) save on unsigend int4 is correct until '2106-02-07 07:28:15'
	function readLong() {
		$m=$this->read(8);
		if ($m!==false) {
			$m=bchexdec(strhex($m));
			if ($m < 0xffffffff) return (int)$m;
		 }
		return $m;
	}
	function readFloat() {
		$m=$this->read(4);
		if ($m!==false) {$m=unpack("f",strrev($m)); $m=$m[1];}
		return $m;
	}
	function readUTF() {
		$l=$this->readShort();
		return $this->read($l);
	}
}
?>
