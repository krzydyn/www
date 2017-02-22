<%if(!val("rec")){%>
click <a href="?tab=jokes">here</a>
<%}else{%>
<form action="?category=<%val("req.category")%>" method="post">
<input type="hidden" name="act" value="saveJoke"/>
<t:list property="rec" id="f" value="v">
<%if(array_key_exists($f,$rec->getPK())||$f=="userid"||$f=="updatetm"){%>
<input type="hidden" name="rec[<%$f%>]" value="<%$v%>"/>
<%}%>
</t:list>

<fieldset><legend>
<% $rec=val("rec");if ($rec->getID()!=""){%>
Edytuj dowcip
<%}else{%>
Dodaj dowcip
<%}%>
</legend>

<table class="item">
<t:list property="rec" id="f" value="v">
<%if(!array_key_exists($f,$rec->getPK())&&substr($f,0,1)!="_"&&$f!="userid"&&$f!="updatetm"){%>
<tr><th><%val("txt.db.joke.".$f,$f)%></th><td>
<%if($user=val("user")){%>
<%if($f=="contents"){%>
<textarea name="rec[<%$f%>]" cols="100" rows="15"><%echo html_escape($v)%></textarea>
<%}else if($f=="category" && $user->role>1){%>
<html:select property="categorylist" value="cat" name="rec[category]">
<option <%$cat["category"]==$rec->category?"selected ":""%>value="<%$cat["category"]%>"><%$cat["name"]%></option>
</html:select>
<%}else if($f=="rank" && $user->role>1){%>
<%$v%>
<%}else if($f=="votecnt" && $user->role>1){%>
<%$v%>
<%}else{%>
<input type="text" name="rec[<%$f%>]" value="<%echo quote_escape($v)%>"/>
<%}}else{echo html_escape($v);}%>
</td></tr>
<%}%>
</t:list>
<tr><td colspan=2 align="right">
<input type="submit" value="<%val("txt.save","save")%>"/>
<input type="button" value="<%val("txt.cancel","cancel")%>" onclick="history.back();"/>
</td></tr>
</table>
</fieldset>
</form>

index:
<t:list property="jokeindex" value="v">
 <%$v->word%>,
</t:list>
<%}%>
