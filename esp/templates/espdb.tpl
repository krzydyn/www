<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
<head>
  <meta http-equiv="Content-type" content="text/html;charset=<%val("charset")%>" />
  <title>KrzychoTeka</title>
</head>
<body>
<h1>KrzychoTeka</h1>

<div class="content">
<%if(valExist("content")){%>
<div class="<%val2class("content")%>">
<%include(val("content").".tpl")%>
</div>
<%}%>
</div>
<br>
<t:list property="debug" value="li" enclose="div" class="debug"><li><%$li%></li></t:list>
<t:list property="error" value="li" enclose="div" class="error"><li><%$li%></li></t:list>

</body></html>

