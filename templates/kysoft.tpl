<!DOCTYPE html>
<%
//<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
//<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
//<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
//<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
//<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<%val("req.lang")%>" lang="<%val("req.lang")%>">
<head>
  <meta http-equiv="Content-type" content="text/html;charset=<%val("charset")%>" />
  <title><%val("sitetitle")%></title>
<%
//ketwords is currnetly not supported in SEO (serach engine optimizations)
%>
  <meta name="keywords" content="<%val("txt.keywords")%>" />
  <meta name="description" content="<%val("txt.keywords")%>" />
  <link rel="shortcat icon" href="" type="image/x-icon" />
  <link rel="stylesheet" href="style_new.css" type="text/css" />
  <!--[if IE]>
  <link rel="stylesheet" href="style_ie.css" type="text/css" />
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
  <![endif]-->
  <link rel="alternate" type="application/rss+xml" title="KySoft RSS" href="rss.php" />
  <script type="text/javascript" src="<%val("cfg.cmsurl")%>js/prototype.js"></script>
  <script type="text/javascript" src="<%val("cfg.cmsurl")%>js/cms.js"></script>
  <script type="text/javascript" src="<%val("cfg.cmsurl")%>js/md5.js"></script>
  <script type="text/javascript" src="<%val("cfg.cmsurl")%>js/misc.js"></script>
  <script type="text/javascript" src="shjs/sh_main.js"></script>
  <link type="text/css" rel="stylesheet" href="shjs/sh_typical.css">
  
  <meta name="alexaVerifyID" content="7XnaryZ9qWSAEJJ_0vJCpBqFaLc" />
  <meta name="msvalidate.01" content="4F75189BFBDDA48F2494B0C2F9358707" />
<%if(val("srv.HTTP_HOST")!="localhost"){%>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-34765457-1']);
  _gaq.push(['_setDomainName', 'kysoft.pl']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<%}%>
</head>
<body onload="page_init();sh_highlightDocument('shjs/lang/','.js');/*getGeoLocation();*/">
<div class="body">

<img class="logo" src="icony/kysoft.png" alt="logo" align="left" />
<div class="abs" style="left:150px">
[Your IP: <%val("ip")%>]
</div>
<div style="float:right;text-align:right;" >
<%if($u=val("user")){%>
<a href="?tab=profile"><%$u->name%></a>(<%val("txt.rolename.".$u->role)%>)<br>
<a href="?act=logout"><%val("txt.logout")%></a><br>
<%}else{%>
<a href="#" onclick="$('regibox').toggle();$('loginbox').toggle();"><%val("txt.Loging")%></a><br>
<div id="loginbox" style="display:none;"><form name="login" method="post" action="?" onsubmit="formcheck('login','user');">
<input class="none" type="text" name="test"/>
<input type="hidden" name="act" value="login"/>
<table class="login" align="center">
  <tr><td><input size="5" name="user" type="text" value="<%val("req.user")%>"/>
  <input size="5" name="passwd" type="password"/>
  <input type="submit" value="Zaloguj"/>
  </td></tr>
</table>
</form></div>
<div id="regibox">
<!-- a href="#" onclick="">Rejestracja</a --><br>
</div>
<%}%>
<%val("txt.language")%>: 
<a href="?lang=pl"><img src="icony/flag-pl.gif" alt="PL" /></a>
<a href="?lang=en"><img src="icony/flag-en.gif" alt="EN" /></a>
<br>
<%include("suggest.tpl")%>
</div>
<h1><%val("txt.title")%></h1><br>

<a class="sitemap" href="?tab=sitemap">sitemap</a>
<div class="MainTabs">
<%include("tabs.tpl")%>
</div>

<%include("sysmsg.tpl")%>

<div class="content">
<div class="<%val2class("content")%>">
<%include(val("content").".tpl")%>
</div>
<%if (!val("robot")) include("comment.tpl")%>
</div>
<br>
<t:list property="debug" value="li" enclose="div" class="debug"><li><%$li%></li></t:list>
</div></body></html>
