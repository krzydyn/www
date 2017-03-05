<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
<head>
  <title><%val("cfg.sitetitle")%></title>
  <meta charset="UTF-8">
  <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  <meta name="description" content="Przepisy kulinarne na przepyszne potrawy"/>
  <meta name="keywords" content="przepisy, kulinarne, smaczne potrawy, pyszne jedzenie, gotowanie, recipe"/>
  <link rel="shortcat icon" href="favicon.ico" type="image/x-icon"/>
  <link rel="stylesheet" href="style.css" type="text/css"/>  
  <script type="text/javascript" src="<%val("cfg.cmsurl")%>js/prototype.js"></script>
  <script type="text/javascript" src="<%val("cfg.cmsurl")%>js/cms.js"></script>
<%if(val("cfg.fck")){%>
  <script type="text/javascript" src="<%val("cfg.fck");%>ckeditor.js"></script>
<%}%>
</head>
<body><div class="body">

<div style="float:right;text-align:right;" >
<%if($u=val("user")){%>
<a href="?act=showUser&id=<%val("user")->getID()%>"><%$u->name%></a>(<%val("txt.rolename.".$u->role,$u->role)%>)<br>
<a href="?act=logout"><%val("txt.logout","logout")%></a><br>
<%}else{%>
<a href="" onclick="$('loginbox').toggle();return false;">Logowanie</a><br/>
<div class="absr">
<div id="loginbox" style="display:none;" class="abs"><form name="login" method="post" action="?" onsubmit="formcheck('login','user');">
<input type="hidden" name="act" value="login"/>
<table cellspacing="0" cellpadding="0" class="login" align="center">
  <tr><td><input size="7" name="user" type="text" value=""/>
  <input size="7" name="passwd" type="password"/>
  <input type="submit" value="Zaloguj"/>
  </td></tr>
</table>
</form></div></div>
<%}%>
</div>

<h1><%val("cfg.sitetitle")%></h1>
<br>

<%include("sysmsg.tpl")%>

<table width="100%"><tr><td align="center">
<%if(val("req.view")) include(val("req.view").".tpl"); else include("list.tpl");%>
</td><td valign="top">
<%if(val("user")){%>
	<%if(val("user")->role<2){%>
	<div align="right"><a href="?act=users">Użytkownicy</a></div>
	<%}%>
	<div align="right"><a href="?act=recipes"">Przepisy</a></div>
<%}%>
</td></tr></table>
</div></body></html>
