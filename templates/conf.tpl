<table class="multcol"><tr><td>
<br>
<a href="?tab=conf/user">users</a><br>
<a href="?tab=conf/session">sessions</a><br>
<a href="?tab=conf/comment">comment</a><br>
<a href="?tab=conf/robot">robots</a><br>
<a href="?tab=conf/joke">jokes</a><br>
<a href="?tab=conf/jokeindex">jokeindex</a><br>

<%if(val("user")&&val("user.role")<2){%>
<div><br><form method="post" action="?">
<input type="hidden" name="act" value="jokeIndex"/>
<input type="submit" value="Reindex all"/>
</form></div>
<%}%>

</td><td>

<form action="?" method="post">
<input type="hidden" name="act" value="sendSQL"/>
SQL:<br><textarea name="sql" cols="50" rows="1">
<%val("req.sql")%>
</textarea> <input type="submit" value="send"/>
</form>

<t:list property="sqlresult" id="i" value="row" enclose="table">
<tr><td><%$rowcnt+1%></td>
<%if(is_array($row))for($n=0,reset($row);list($f,$v)=each($row);++$n){%>
<td><%$v%></td>
<%}else{%>
<td><%$row%></td>
<%}%>
</tr>
</t:list>

<style>
td.tm{width:120px;}
</style>

<%if(val("rec")){%>
<table class="db db<%val("rec")->tabname()%>">
<caption>
<a href="?act=new<%val("rec")->getClass();%>">add <%val("rec")->getClass();%></a>
[<%echo sizeof(val("result"))%>]
</caption>
<tr class="head">
<th class="cbox"><input type="checkbox" name="checkall" onClick="checkall('checkid',this.checked);"/></th>
<th class="ord">#</th>
<% $row=val("rec");while(list($f,$v)=each($row))if($f!="id"&&substr($f,0,1)!="_"){%>
<th class="<%$f%>"><%val("txt.db.".$row->tabname().".".$f,$f)%></th>
<%}%>
</tr>
<t:list property="result" value="row">
<tr class="row row<%$rowcnt&1%>" onClick="if(!containsEvent($(this).down(),event))window.location='?act=edit<%$row->getClass()%>&amp;id=<%$row->getID()%>';">
<td class="cbox"><input type="checkbox" name="checkid[<%$row->getID()%>]" <%val("checkid.".$row->getID())!==null?"checked":"";%>/></td>
<td class="ord numeric"><%$rowcnt+1%></td>
<%for($n=0,reset($row);list($f,$v)=each($row);++$n)if($f!="id"&&substr($f,0,1)!="_"){%>
<%if($f=="role")$v=val("txt.rolename.".$v)%>
<td class="<%$f%>"><%echo is_object($v)?$v->toString():$v%></td>
<%}%>
</tr>
</t:list>
</table>
<%}%>
</td></tr></table>
