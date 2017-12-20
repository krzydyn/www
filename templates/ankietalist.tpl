<style type="text/css">
.name {width:10%;}
.updatetm {width:10%;}
.value {width:70%;}
.action {width:10%;}
</style>
<h1>Lista życzeń do św.Mikołaja</h1>
<h2 style="color:yellow">&gt;&gt;&gt; należy podać conajmniej 3 konkretne pozycje &lt;&lt;&lt;</h2>
<table class="db">
<tr class="head">
<th class="name">Twoje Imię</th>
<th class="updatetm">Zmieniono</th>
<th class="value">Lista życzeń</th>
<th class="action"></th>
</tr>
<t:list property="items" value="row">

<tr class="row<%$rowcnt&1%>">

<%for($n=0,reset($row);list($f,$v)=each($row);++$n)if($f!="id"&&substr($f,0,1)!="_"){%>
	<%if($f=="name"){%>
	<th class="<%$f%>"><%$v%></th>
	<%}else if($f=="updatetm"){%>
	<td class="<%$f%>"><%$v?strftime("%Y/%m/%d %H:%M",$v):""%></td>
	<%}else{%>
	<td class="<%$f%>"><%$v%></td>
	<%}%>
<%}%>

<td class="action">
<%if(empty($row["name"])){%>
<a href="?act=edit">dodaj</a>
<%}else if(empty($row["value"])){%>
<a href="?act=edit&id=<%$row["name"]%>">zmień</a>
<a href="?act=del&id=<%$row["name"]%>">usuń</a>
<%}else{%>
<a href="?act=edit&id=<%$row["name"]%>">zmień</a>
<%}%>
</td>
</tr>
</t:list>
</table>
<% $v=val("lastupdate")%>
<table>
<tr><td>Czas ostatniej modyfikacji: <%$v?strftime("%Y/%m/%d %H:%M",$v):""%></td></tr>
<tr><td><b>Uwaga:</b> edytując wpis innej osoby można dopytać o szczegóły</td></tr>
</table>

<?
----------
od 1.05.2013 na 24mies:
- plan na kazdy dzien, abo 49brt
- na kom 30 w PL
- na kom 49 w EU
- no limit na stacjonarne w EU, Kanada,USA
- no limit na kom Kan,USA

?>
