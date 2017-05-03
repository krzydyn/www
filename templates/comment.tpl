<%//printobj("srv",val("srv"));%>
<%if(val("context")){%>
<br>
<a href="#" id="commentref" onclick="$('commentbox').toggle();return false;">
<%if(val("req.lang")=="en"){%>
Add comment
<%}else{%>
Dodaj komentarz
<%}%>
</a>
<div class="relabs" style="top:-200px">
<div id="commentbox" style="display:none">
<form name="comment" method="post" action="?<%echo url_escape(val("srv.QUERY_STRING"))%>" onsubmit="formcheck('comment','comment[name]')">
<input class="none" type="text" name="test"/>
<input type="hidden" name="act" value="saveComment"/>
<input type="hidden" name="comment[context]" value="<%val("context")%>"/>
<fieldset>
<%if(val("req.lang")=="en"){%>
<legend>Add comment</legend>
<%}else{%>
<legend>Dodaj komentarz</legend>
<%}%>
<table>
<tr><th>Nick</th><td><input type="text" name="comment[name]" size="50" value="<%val("req.rec.name")%>"/> <%val("txt.required")%></td></tr>
<tr><th>e-mail</th><td><input type="text" name="comment[email]" size="50" value="<%val("req.rec.email")%>"/> <%val("txt.required").",".val("txt.hidden")%></td></tr>
<tr><th><%val("txt.db.comment.contents")%></th><td><textarea name="comment[contents]" cols="60" rows="3"><%val("req.rec.contents")%></textarea></td></tr>
<tr><td colspan="2" align="right">
<input type="submit" value="<%val("txt.save","save")%>"/>
<input type="button" value="<%val("txt.cancel","cancel")%>" onclick="$('commentbox').toggle();"/>
</td></tr>
</table>
</fieldset></form>
</div></div>
<%}%>

<table class="multcol comments">
<t:list property="comments" id="i" value="row">
<tr class="row row<%$rowcnt&1%>"><td>
<b><%$rowcnt+val("offs")+1%>.</b> dodany <b><%echo val("user")&&val("user.role")<2?strftime("%Y-%m-%d %H:%M",$row->createtm):strftime("%Y-%m-%d",$row->createtm)%></b>
przez <b><%$row->_user->name%></b>
<div class="post comment"><%$row->contents%></div>
</td></tr>
</t:list>
</table>
