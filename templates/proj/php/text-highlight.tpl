<h2>Highlight text on given keywords</h2>
<br>
Simple method with str_replace.<br>
Replaces source keywords, not extendable
<%code_start("php")%>
function str_highlight($txt,$words){
	if (!is_array($words)){
		$words=preg_split("/[^[:alpha:]]+/",$words);
		$words=array_unique($words);
	}
	$repl=array();
	for ($i=0; $i<sizeof($words); ++$i)
		$repl[$i]="<span class=\"hi\">".$words[$i]."</span>";
	return str_ireplace($words,$repl,$txt);
}
<%code_stop()%><br>

More generic method with preg_replace.<br>
Keeps source keywords as is though match is case insensitive.<br>
Easly extendable to support any regex matching
<%code_start("php")%>
function highlight($txt,$words){
	if (!is_array($words)){
		$words=preg_split("/[^[:alpha:]]+/",$words);
		$words=array_unique($words);
	}
	$regex="";
	for ($i=0; $i<sizeof($words); ++$i)
		$regex.="|(".$words[$i].")";
	$regex=substr($regex,1);
	return preg_replace("#(".$regex.")#si","<span class=\"hi\">\$1</span>",$txt);
}
<%code_stop()%><br>
