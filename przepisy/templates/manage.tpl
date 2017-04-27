<input type="text" size="40" name="search" value="<%val("req.search")%>">
<input type="submit" value="Szukaj">
<a href="?#" onclick="return submitForm('act=advsearch')">Szukanie zaawansowane</a><br>
<br>
<table class="list">
<%if(sizeof(val("pages"))>1){%>
<tr class="row">
<td colspan=5>Strona: <t:list property="pages" id="i" value="p"><a href="#" onclick="return submitForm('page=<%$p%>');"><%$p%> </a></t:list>
</td>
</tr>
<%}%>
<tr class="head">
<th><input type="checkbox" onclick="checkall('checkid',this.checked);"></th>
<th></th>
<% $row=val("rec");while (list($f,$v)=each($row))if(!in_array($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="icon"&&$f!="contents"){%>
<th class="<%$f%>"><%$f%></th>
<%}%>
</tr>
<t:list property="result" id="i" value="row">
<tr class="row<%$rowcnt&1%>" onMouseMove="rowovr(this,event,'#cacae0');" onMouseOut="rowout(this,event);" onClick="rowclick(this,event,15,'submitForm(\'act=show\',\'recid=<%$i%>\')');">
<td><input type="checkbox" name="checkid[<%$i%>]"></td>
<td><img src="<%$row->icon?$row->icon:"noimg.jpg"%>" height="40"></td>
<%reset($row);while (list($f,$v)=each($row))if(!in_array($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="icon"&&$f!="contents"){%>
<%if(is_object($v)){%>
<td class="<%$f%>"><%$v->toString()%></td>
<%}else{%>
<td class="<%$f%>"><%$v%></td>
<%}}%>
</tr>
</t:list>
</table>

<xt:fckeditor class="editor" name="fck2" skin="Default" toolbar="Full"/>
