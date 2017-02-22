<h2>Validating e-mail syntax</h2>
<br>
Email address validation is quite more complex than it might look at first<br>
since RFC 5322 defines quite large set of characters to be used in email address.<br>
See also Cal's <a target="_blank" href="http://www.iamcal.com/publish/articles/php/parsing_email/">article</a> on parsing mail<br>
<br>
Part of RFC 5322 (sec.3) in BNF-like syntax:<br>
<%code_start("bdf")%>
addr-spec       =   local-part "@" domain
local-part      =   dot-atom / quoted-string / obs-local-part
domain          =   dot-atom / domain-literal / obs-domain
domain-literal  =   [CFWS] "[" *([FWS] dtext) [FWS] "]" [CFWS]
dtext           =   %d 33-90 /         ;  Printable US-ASCII
                    %d 94-126 /        ;  characters not including
                    obs-dtext          ;  "[", "]", or "\"
quoted-string   =   [CFWS]
                    DQUOTE *([FWS] qcontent) [FWS] DQUOTE
                    [CFWS]
<%code_stop()%>
where:
<%code_start("bdf")%>
quoted-pair     =   ("\" (VCHAR / WSP)) / obs-qp
FWS             =   ([*WSP CRLF] 1*WSP) /  obs-FWS
<%code_stop()%>

<br>
basic solution<br>
<%code_start("php")%>
function is_email($str){
	$re="\w+([.+-]\w+){0,4}@\w+([.-]\w+){1,3}";
	if (preg_match("/^".$re."$/i",$str)) return 1;
	return 0;
}
<%code_stop()%>
function test:<br>
<%
$good=array(
"name.surname@blah.com","\"b. blah\"@blah.co.nz",
"a@a.com","a@a.com.au","a@a.au",
"example@example.com","foo@bar.info","blah@127.0.0.1",
"e@eee.com","eee@e-e.com",
"abc@def.gh","a+b_c@d-e_f.gh","abc@def.ghijkl",
"foo+bar!@example.com"
);
$bad=array(
"name surname@blah.com","name.\"surname\"@blah.com","name@bla-.com",
".@eee.com","eee@e-.com",
);
$list=array();
for ($i=0; $i<sizeof($good); ++$i){
	if ($r=is_email_v1($good[$i])) $list[]="<span style=\"color:green\">$good[$i]</span>=$r";
	else $list[]="<span style=\"color:red\">$good[$i]</span>";
}
echo "<b>Matches:</b> ".implode(" | ",$list);
echo "<br>";
$list=array();
for ($i=0; $i<sizeof($bad); ++$i){
	if ($r=is_email_v1($bad[$i])) $list[]="<span style=\"color:green\">$bad[$i]</span>=$r";
	else $list[]="<span style=\"color:red\">$bad[$i]</span>";
}
echo "<b>Not matches:</b> ".implode(" | ",$list);
%>
<br><br>
much better solution<br>
<%code_start("php")%>
function is_email($str){
	$re="\w+([.+-]\w+){0,4}@\w+([.-]\w+){1,3}";       //simple match
	$quoted="\"[\w+-. ]+\"@\w+([.-]\w+){1,3}";        //match quoted
	$lc="\w,!#$%&'*+\-\/=?^_`{|}~";                   //local-part (before @) chars
	$other="[$lc]+(\.[$lc]+){0,4}@\w+([.-]\w+){1,9}"; //other syntactically valid
	if (preg_match("/^".$re."$/i",$str)) return 1;
	if (preg_match("/^".$quoted."$/i",$str)) return 2;
	if (preg_match("/^".$other."$/i",$str)) return 3;
	return 0;
}
<%code_stop()%>
function test:<br>
<%
$list=array();
for ($i=0; $i<sizeof($good); ++$i){
	if ($r=is_email($good[$i])) $list[]="<span style=\"color:green\">$good[$i]</span>=$r";
	else $list[]="<span style=\"color:red\">$good[$i]</span>";
}
echo "<b>Matches:</b> ".implode(" | ",$list);
echo "<br>";
$list=array();
for ($i=0; $i<sizeof($bad); ++$i){
	if ($r=is_email($bad[$i])) $list[]="<span style=\"color:green\">$bad[$i]</span>=$r";
	else $list[]="<span style=\"color:red\">$bad[$i]</span>";
}
echo "<b>Not matches:</b> ".implode(" | ",$list);
%>
