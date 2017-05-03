<form action="?" method="post">
<input type="hidden" name="act" value="saveUser"/>
<t:list property="user" id="f" value="v">
<%if(array_key_exists($f,$user->getPK())){%>
<input type="hidden" name="rec[<%$f%>]" value="<%$v%>"/>
<%}%>
</t:list>

<fieldset><legend>
<%if(val("req.lang")=="en"){%>
User profile
<%}else{%>
Profil u¿ytkownika
<%}%>
</legend>

<table class="item">
<t:list property="user" id="f" value="v">
<%if($user->role>1&&$f=="role")continue;%>
<%if(array_key_exists($f,$user->getPK())||substr($f,0,1)=="_")continue;%>
<tr><th><%val("txt.db.user.".$f,$f)%></th><td>
<%if($f=="name"){%>
<b><%$v%></b>
<%}else if($f=="passwd"){%>
<%if($user->role<2){%>
<input type="text" name="rec[<%$f%>1]"/>
<%}else{%>
<a href="#" onClick="this.toggle();$('passwdbox').toggle();">zmieñ</a>
<table id="passwdbox" style="display:none">
<tr><td>cur passwd:</td><td><input name="rec[<%$f%>0]" type="password" size="7"/></td></tr>
<tr><td>new passwd:</td><td><input name="rec[<%$f%>1]" type="password" size="7"/></td></tr>
<tr><td>repeat new:</td><td><input name="rec[<%$f%>2]" type="password" size="7"/></td></tr>
</table>
<%}}else{%>
<input type="text" name="rec[<%$f%>]" value="<%$v%>">
<%}%>
</td></tr>
</t:list>
<tr><td colspan="2" align="right">
<input type="submit" value="<%val("txt.save")%>">
</td></tr>
</table>
</fieldset>

</form>
