<%if(!val("rec")){%>
<br>
<a href="?tab=conf/user">show users</a>

<%}else{%>
<form action="?" method="post">
<input type="hidden" name="act" value="saveUser"/>
<t:list property="rec" id="f" value="v">
<%if(array_key_exists($f,$rec->getPK())){%>
<input type="hidden" name="rec[<%$f%>]" value="<%$v%>"/>
<%}%>
</t:list>

<fieldset><legend>
<% $rec=val("rec");if ($rec->getID()!=""){%>
Edit <%$rec->getClass()%>
<%}else{%>
New <%$rec->getClass()%>
<%}%>
</legend>

<table class="item">
<t:list property="rec" id="f" value="v">
<%if(!array_key_exists($f,$rec->getPK())&&substr($f,0,1)!="_"){%>
<tr><th><%val("txt.db.user.".$f,$f)%></th><td>
<%if ($f=="passwd"){%>
<input type="password" name="rec[<%$f%>1]" value=""/>
<%}else{%>
<input type="text" name="rec[<%$f%>]" value="<%echo quote_escape($v)%>"/>
<%}%>
</td></tr>
<%}%>
</t:list>
<tr><td colspan="2" align="right">
<input type="submit" value="<%val("txt.save","save")%>"/>
<input type="button" value="<%val("txt.cancel","cancel")%>" onclick="history.back();"/>
</td></tr>
</table>
</fieldset>

</form>
<%}%>
