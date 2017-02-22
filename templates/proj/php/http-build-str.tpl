<h2>Implementation of http_build_str</h2>
Supports arrayed arguments
<br>
<%code_start("php")%>
if(!function_exists('http_build_str')){
	function http_build_str($aq){
		$a=array();
		foreach($aq as $k=>$v){
			if (is_array($v)){
				foreach($v as $kt=>$vt)
					$a[]=$k."[".$kt."]=".urlencode($vt);
			}
			else $a[]=$k."=".urlencode($v);
		}
		return implode("&",$a);
	}
}
<%code_stop()%>
