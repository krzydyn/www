<?php
require_once($config["cmslib"]."modules.php");
class Route {
	var $method;
	var $re_uri;
	var $handler;

	function esc_re($re,$esc) {
		$l=strlen($re);
		$r="";
		for ($i=0; $i < $l; ++$i) {
			$c = $re[$i];
			if (strpos($esc,$c)!==false) $r.="\\$c";
			else $r.=$c;
		}
		return $r;
	}

	public function __construct($method, $re_uri, $handler) {
		$this->method = $method;
		$this->re_uri = $re_uri;
		$this->handler = $handler;
	}
	public function match($method, $uri) {
		if (!empty($this->method) && $this->method != $method) return 0;
		if (empty($this->re_uri)) return 1;
		$patt="/^".$this->esc_re($this->re_uri,"/")."$/i";
		if (!preg_match($patt, $uri, $matches)) {
			return 0;
		}
		//count alnum
		$cnt=0;
		for ($i=strlen($this->re_uri); --$i>=0; ) {
			if (ctype_alnum($this->re_uri[$i])) ++$cnt;
		}
		$cnt=$cnt*10+2;
		if (empty($this->method)) return $cnt-1;
		return $cnt;
	}
}
class Router {
	private $routes = array();

	public function addRoute($method, $uri, $handler) {
		$this->routes[] = new Route($method, $uri, $handler);
	}
	public function route($method, $uri) {
		$dbg=1;
		$best_match=0;
		$best_route=null;
		if ($dbg) logstr("matching '".$uri."'");
		foreach ($this->routes as $r) {
			$m = $r->match($method, $uri);
			$patt="/^".$r->esc_re($r->re_uri,"/")."$/i";
			if ($dbg) logstr("match on ".$patt." is ".$m);
			if ($m > $best_match) {
				$best_match = $m;
				$best_route = $r;
			}
		}
		if ($best_route) {
			$r=$best_route;
			//echo "REQ '[".$method."]:".$uri."' ROUTE TO '[".$r->method."]:".$r->re_uri."'\n";
			$args=array();
			call_user_func_array($r->handler,$args);
		}
	}
}
?>
