<?php
//ini_set('zlib.output_compression', '1');
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
	public function match($method, $uri, &$matches) {
		$cnt = 1;
		if (!empty($this->method)) {
			if ($this->method != $method) return 0;
			++$cnt;
		}
		if (empty($this->re_uri)) return $cnt;

		$patt="/^".$this->esc_re($this->re_uri,"/")."$/i";
		if (!preg_match($patt, $uri, $matches)) {
			return 0;
		}
		if (is_array($matches) && sizeof($matches) > 0) {
			for ($i = 1; $i < sizeof($matches); ++$i)
				$cnt += strlen($matches[$i]);
		}
		return $cnt;
	}
}
class Router {
	private $routes = array();

	public function addRoute($method, $uri, $handler) {
		$this->routes[] = new Route($method, $uri, $handler);
	}
	public function route($method, $uri) {
		$dbg=0;
		$best_match=0;
		$best_route=null;
		$best_matches=null;
		if ($dbg) logstr("matching '".$uri."'");
		foreach ($this->routes as $r) {
			$m = $r->match($method, $uri, $matches);
			$patt="%^".$r->esc_re($r->re_uri,"%")."$%i";
			if ($dbg) logstr("match on ".$patt." is ".$m);
			if ($m > $best_match) {
				$best_match = $m;
				$best_route = $r;
				$best_matches = $matches;
			}
		}
		if ($best_route != null) {
			$r=$best_route;
			//echo "REQ '[".$method."]:".$uri."' ROUTE TO '[".$r->method."]:".$r->re_uri."'\n";
			call_user_func($r->handler);
		}
		else {
			logstr("no route for '".$uri."'");
			header("HTTP/1.1 403 Forbidden"); //Forbiden
			flush();
			die();
		}
	}
}
?>
