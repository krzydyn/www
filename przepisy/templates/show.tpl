<% $row=val("rec");%>
<!-- owner <%$row->userid%> -->
<table><tr><td>
<%if($row->icon){%>
<img src="<%echo strpos($row->icon,"://")?$row->icon:"upload/".$row->icon%>" width="220px" alt=""/>
<%}else{%>
<img src="noimg.png" height="40" alt=""/>
<%}%>
<td>

<div class="title"><%$row->name%></div>
<table class="item">
<t:list property="rec" id="f" value="v">
<%if(!array_key_exists($f,$rec->getPK())&&substr($f,0,1)!="_"&&$f!="userid"&&$f!="name"&&$f!="icon"&&$f!="contents"){%>
<tr><th width=""><%val("txt.tab.recipe.".$f,$f)%><td><%$v%></tr>
<%}%>
</t:list>
</table>

<div class="title"><%val("txt.tab.recipe.contents","contents")%></div>
<table class="item">
<tr><td><%$row->contents%></td></tr>
</table>

</td></tr>
<tr><td colspan=2 class="right">
<a href="?act=recipes">Powrót</a>
</td></tr></table>
