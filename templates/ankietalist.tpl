<style type="text/css">
.name {max-width:80px;}
.updatetm {width:250px;}
.action {width:auto;text-align:left;}
.xvalue {font-size:13pt;}
</style>
<h1>Lista życzeń do św.Mikołaja</h1>
<h2 style="color:yellow">&gt;&gt;&gt; należy podać conajmniej 3 konkretne pozycje &lt;&lt;&lt;</h2>
<table class="db" style="table-layout: fixed;">
<tr class="head">
	<th>User</th>
	<th>Wpis</th>
</tr>

<t:list property="items" value="row">
<tr class="row<%$rowcnt&1%>">
	<th class="name"><%$row["name"]%></th>
	<td>
	<table style="width:100%">
		<tr>
		<td class="updatetm">
			<% $v=$row["updatetm"];$v=$v?strftime("%Y/%m/%d %H:%M",$v):""; %>
			<%if($v){%>
			(zmieniono o <%$v%>)
			<%}%>
		</td>
		<td class="action">
			<%if(empty($row["name"])){%>
				<a href="?act=edit">dodaj</a>
			<%}else{%>
				<%if(empty($row["value"])){%>
				<a href="?act=del&id=<%$row["name"]%>">usuń</a>
				<%}%>
				<input type="button" value="zmień" onclick="window.location.href='?act=edit&id=<%$row["name"]%>'">
			<%}%>
		</td>
		</tr>
		<tr><td class="xvalue" colspan=2><%$row["value"]%></td> </tr>
	</table>
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
