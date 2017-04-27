<form action="?act=recipes" method="post"><input type="text" size="40" name="search" value="<%val("req.search")%>"/>
<input type="submit" value="Szukaj"/>
<a href="?act=advrecipes">Szukanie zaawansowane</a>
</form>
<br/><br/>
<table class="db recipe">
<caption>
<%if(sizeof(val("pages"))>1){%>
Strona: <t:list property="pages" id="i" value="p">
<a href="?page=<%$p%>"><%$p%></a>
</t:list>
<%}%>
(<% $from=val("offs")+1;$to=$from+sizeof(val("result"))-1;
  if ($from<$to) echo "$from-$to z ".val("count"); else echo "brak wynik?w"%>)
<%if(val("user")){%>
<a href="?act=addRecipe">dodaj przepis</a>
<%}%>
</caption>
<tr class="head">
<th></th>
<% $row=val("rec");while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="userid"&&$f!="icon"&&$f!="calority"&&$f!="contents"){%>
<th class="<%$f%>"><%val("txt.tab.recipe.".$f,$f)%></th>
<%}%>
</tr>
<t:list property="result" id="i" value="row">
<tr class="row row<%$rowcnt&1%>" onClick="if(!containsEvent($(this).down(),event))window.location='?act=show<%$row->getClass()%>&id=<%$row->getID()%>';">
<!-- userid=<%$row->userid%> -->
<td class="icon"><a class="icon" href="#">
<%if($row->icon){%>
<img src="<%echo strpos($row->icon,"://")?$row->icon:"upload/".$row->icon%>" height="40" alt=""/>
<div class="bigsample"><img src="<%echo strpos($row->icon,"://")?$row->icon:"upload/".$row->icon%>" height="200" alt=""/></div>
<%}else{%>
<img src="noimg.png" height="40" alt=""/>
<%}%>
</a></td>
<%reset($row);while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="userid"&&$f!="icon"&&$f!="calority"&&$f!="contents"){%>
<%if(is_object($v)){%>
<td class="<%$f%>"><%$v->toString()%></td>
<%}else{%>
<td class="<%$f%>"><%$v%></td>
<%}}%>
</tr>
</t:list>
</table>
