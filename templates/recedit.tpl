<form action="?" method="post">
<input type="hidden" name="act" value="saveRobot"/>
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
<tr><th><%val("txt.db.".$rec->getClass().".".$f,$f)%></th><td>
<input type="text" name="rec[<%$f%>]" value="<%echo quote_escape($v)%>"/>
</td></tr>
<%}else{%>
<tr><th><%val("txt.db.".$rec->getClass().".".$f,$f)%></th><td>
<%echo html_escape($v)%>
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
