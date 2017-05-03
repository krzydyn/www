<a href="#" onclick="$('newjoke').toggle();">Dodaj dowcip</a>
<div class="relabs">
<div id="newjoke" style="display:none;left:100px;top:-100px;">

<% $this->req->setval("rec",$rec=new Joke());%>
<form name="propose" action="?act=proposeJoke" method="post">
<input class="none" type="text" name="test"/>
<t:list property="rec" id="f" value="v">
<%if(array_key_exists($f,$rec->getPK())){%>
<input type="hidden" name="rec[<%$f%>]" value="<%$v%>"/>
<%}%>
</t:list>

<fieldset><legend>
<% $rec=val("rec");if ($rec->getID()!=""){%>
Edycja <%$rec->getClass()%>
<%}else{%>
Dodaj <%$rec->getClass()%>
<%}%>
</legend>

<table class="item">
<tr><th>nick</th><td>
<input type="text" name="rec[name]" size="50"/> <%val("txt.required")%></td></tr>
<tr><th class="nowrap">e-mail</th><td>
<input type="text" name="rec[email]" size="50"/> <%val("txt.required").",".val("txt.hidden")%></td></tr>
<t:list property="rec" id="f" value="v">
<%if($f!="category" && $f!="contents")continue;%>
<tr><th><%val("txt.db.joke.".$f,$f)%></th><td>
<%if ($f=="category"){%>
<html:select property="categorylist" value="cat" name="rec[category]">
<option <%$cat["category"]==val("req.category")?"selected ":""%>value="<%$cat["category"]%>"><%$cat["name"]%></option>
</html:select>
<%}else{%>
<textarea name="rec[<%$f%>]" cols="55" rows="5"></textarea>
<%}%>
</td></tr>
</t:list>
<tr><td colspan="2" align="right">
<input type="button" value="<%val("txt.save","save")%>" onclick="commit('propose','rec[name]')"/>
<input type="button" value="<%val("txt.cancel","cancel")%>" onclick="$('newjoke').toggle();"/>
</td></tr>
</table>
</fieldset>
</form>

</div></div>
