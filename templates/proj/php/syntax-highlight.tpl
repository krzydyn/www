Syntax highlight (javascript) <a href="http://shjs.sourceforge.net/">SHJS</a><br>
Supports many languages, extendable, client-side javascript (does not overload the server).<br>
<br>
1. in HEAD section of HTML place sh_main.js and preffered css file<br>
<%code_start("html")%>
  <script type="text/javascript" src="shjs/sh_main.js"></script>
  <link type="text/css" rel="stylesheet" href="shjs/sh_typical.css">
<%code_stop()%>
<br>
2. in BODY tag add onload property<br>
<%code_start("html")%>
<body onload="sh_highlightDocument('shjs/lang/','.js');">
<%code_stop()%>
<br>
3. then to highlight syntax place code in PRE tags
<%code_start("html")%>
<pre class="sh_php">
function toString($arg){
	if (is_array($arg)) return implode(":",$a);
	return $arg;	
}
</pre>
<%code_stop()%>
and it will be seen as
<%code_start("php")%>
function toString($arg){
	if (is_array($arg)) return implode(":",$a);
	return $arg;
}
<%code_stop()%>
<b>Note:</b> you have to remeber to change all <b>&lt &gt</b> to <b>'&amp;lt;' '&amp;gt;'</b> inside PRE tags
