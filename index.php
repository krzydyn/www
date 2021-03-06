<?php
require_once("config.php");
require_once($config["cmslib"]."router.php");
require_once($config["cmslib"]."request.php");

$r = new Router();

//static files
$r->addRoute("GET","/.*(js|css|jpg|png|gif)",function() {
	logstr("");
	global $config;
	require_once($config["cmslib"]."modules.php");
	$f = ".".Request::getInstance()->getval("uri");
	logstr("reading file $f type ".make_content_type($f));
	if (file_exists($f)) {
		$s=filesize($f);
		header("Pragma: public"); // required
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Cache-Control: private",false); // required for certain browsers
		header("Content-Type: ".make_content_type($f));
		//Content-Disposition: inline/attachment
		header("Content-Disposition: inline; filename=\"".basename($f)."\"");
		header("Content-Transfer-Encoding: binary");
		header("Content-Length: ".$s);
		header("Accept-Ranges: bytes"); //to show progress bar
		readfile($f);
	}
	else {
		header("HTTP/1.1 404 Not Found");
		logstr("not found $f");
		exit;
	}
});

$r->addRoute("GET","/.*(html|php)",function() {
	logstr("uri = ".Request::getInstance()->getval("uri"));
	global $config;
	$f = ".".Request::getInstance()->getval("uri");
	if (file_exists($f)) {
		require_once($f);
	}
	else {
		header("HTTP/1.1 404 Not Found");
		logstr("not found $f");
		exit;
	}
});

//default
$r->addRoute("","(|index.php)",function() {
logstr("processing default route '".Request::getInstance()->getval("uri")."'");
global $config;
require_once("kysoft.php");
$req = Request::getInstance();
try {
	$a=new KySoft();
	$a->initialize();
	$a->process();
	unset($a);
}
catch(Exception $e) {
	logstr($e);
	$req->setval("error",get_class($e).": ".$e->getMessage());
}
$t=new TemplateEngine($req);
$t->load("kysoft.tpl");
});

$r->route(Request::getInstance()->getval("method"), Request::getInstance()->getval("uri"));
?>
