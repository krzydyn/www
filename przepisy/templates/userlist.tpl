<table class="db user">
<caption>
U¿ytkownicy
<%if(val("user")){%>
<a href="?act=addUser">dodaj usera</a>
<%}%>
</caption>
<tr class="head">
<th></th>
<% $row=val("rec");while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="passwd"){%>
<th class="<%$f%>"><%val("txt.tab.user.".$f,$f)%></th>
<%}%>
</tr>
<t:list property="result" id="i" value="row">
<tr class="row row<%$rowcnt&1%>" onClick="if(!containsEvent($(this).down(),event))window.location='?act=show<%$row->getClass()%>&id=<%$row->getID()%>';">
<th class="No"><%$rowcnt+1%></th>
<%reset($row);while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="passwd"){%>
<%if(is_object($v)){%>
<td class="<%$f%>"><%$v->toString()%></td>
<%}else{%>
<td class="<%$f%>"><%$v%></td>
<%}}%>
</tr>
</t:list>
</table>
