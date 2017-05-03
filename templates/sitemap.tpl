<b><%if(val("req.lang")=="en"){%>
Sita map
<%}else{%>
Mapa strony
<%}%></b>
<t:list property="txt.subtitle" id="tab" value="li" enclose="ul">
<%if($tab=="conf")break;%>
<li><a href="?tab=<%$tab%>&lang=<%val("req.lang")%>"><%$li%></a></li>
</t:list>
