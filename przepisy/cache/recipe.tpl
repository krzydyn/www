<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
<head>
  <title><?echo $this->getval("cfg.sitetitle")?></title>
  <meta name="description" content="Przepisy kulinarne na przepyszne potrawy"/>
  <meta name="keywords" content="przepisy, kulinarne, smaczne potrawy, pyszne jedzenie, gotowanie, recipe"/>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-2"/>
  <link rel="shortcat icon" href="favicon.ico" type="image/x-icon"/>
  <link rel="stylesheet" href="style.css" type="text/css"/>  
  <script type="text/javascript" src="<?echo $this->getval("cfg.cmsurl")?>js/prototype.js"></script>
  <script type="text/javascript" src="<?echo $this->getval("cfg.cmsurl")?>js/cms.js"></script>
<?if($this->getval("cfg.fck")){?>
  <script type="text/javascript" src="<?echo $this->getval("cfg.fck");?>ckeditor.js"></script>
<?}?>
</head>
<body><div class="body">

<div style="float:right;text-align:right;" >
<?if($u=$this->getval("user")){?>
<a href="?act=showUser&id=<?echo $this->getval("user")->getID()?>"><?echo$u->name?></a>(<?echo $this->getval("txt.rolename.".$u->role,$u->role)?>)<br/>
<a href="?act=logout"><?echo $this->getval("txt.logout","logout")?></a><br/>
<?}else{?>
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
<?}?>
</div>

<h1><?echo $this->getval("cfg.sitetitle")?></h1>
<br/>

<?$this->inc("sysmsg.tpl")?>

<table cellspacing="0" cellpadding="0" width="100%"><tr><td align="center">
<?if($this->getval("req.view")) $this->inc($this->getval("req.view").".tpl"); else $this->inc("list.tpl");?>
</td><td valign="top">
<?if($this->getval("user")){?>
	<?if($this->getval("user")->role<2){?>
	<div align="right"><a href="?act=users">Użytkownicy</a></div>
	<?}?>
	<div align="right"><a href="?act=recipes"">Przepisy</a></div>
<?}?>
</td></tr></table>
</div></body></html>
