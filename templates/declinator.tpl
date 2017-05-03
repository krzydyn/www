<html>
<head>
<title>Declinator</title>
<meta http-equiv="Content-type" content="text/html;charset=iso-8859-2" />
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>
<form action="" method="GET">
<table width="500"><tr>
  <td>Enter&nbsp;singular&nbsp;noun&nbsp;here:</span></td></tr><tr><td><input name="noun" type="text" value="<%val("req.noun")%>"></td>
  <td>person <input type="checkbox" name="pers" <%if(val("req.pers"))echo "checked"%>/></td>
  <td>female <input type="checkbox" name="fem" <%if(val("req.fem"))echo "checked"%>/></td>
  <td><input type="submit" value="Declination"></td>
</tr></table>
<table class="db" width="500">
<t:list property="res" id="i" value="v"><tr>
  <td><%$v["label"]%></td><td><%$v["singular"]%></td><td><%$v["plural"]%></td>
</tr></t:list>
</table></form>
</body></html>
