<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<%val("req.lang")%>" lang="<%val("req.lang")%>">
<head>
<%if (val("refresh")>0){%>
  <meta http-equiv="refresh" content="<%val("refresh")%>;url=<%val("rooturl")%>/ankieta.php">
<%}%>
  <meta http-equiv="Content-type" content="text/html;charset=<%val("charset")%>" />
  <title><%val("sitetitle")%></title>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script type="text/javascript" src="<%val("cfg.cmsurl")%>js/prototype.js"></script>
</head>
<body><center>
<%include("sysmsg.tpl")%>
<%include(val("view").".tpl")%>
</center>
</body></html>
