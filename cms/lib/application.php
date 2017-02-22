<?
class Application{
	var $req=null;
	function Application(){
		$this->req=Request::getInstance();
		//$charset="iso-8859-2";
		$charset="utf-8";
		$this->setval("charset",$charset);
		$this->addval("hdr","Content-Type: text/html;charset=\"".$charset."\"");
	}
	function initialize() { return true; }

	function getval($n,$v=null){return $this->req->getval($n,$v);}
	function setval($n,$v=null){return $this->req->setval($n,$v);}
	function addval($n,$v) { return $this->req->addval($n,$v); }
	function process() {
		$action=$this->getval("req.act","default");
		$this->setval("req.act");
		if ($action && !preg_match("#^[_A-Za-z0-9]+$#",$action)) $action="";

		if (empty($action)) $action="default";
		$method=$action."Action";
		if (method_exists($this,$method)){
			//printobj("processing",$method);
			$this->$method();
		}
		else{
			$this->addval("error","action '".$action."' not supported");
			$this->defaultAction();
		}
	}
	function defaultAction() {}
}
//TODO move to request.php as static func
function uploadfile($src,$dst){
	if (!$src) return true;
	if (!file_exists($src)) return false;
	@unlink($dst);
	//echo "uploading file $src to $dst<br>";
	if (rename($src,$dst)===false){
		//try to copy
		$c=file_get_contents($src);
		if (file_put_contents($c,$dst)===false) return false;
		@unlink($src);
	}
	chmod($dst,0644);
	return true;
}
?>
