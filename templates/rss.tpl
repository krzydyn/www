<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<rss version="2.0">
<channel>
	<title>KySoft.pl Aktualności</title>
	<link>http://kysoft.pl</link>
	<language>pl</language>
	<description><%val("description")%></description>
	<lastBuildDate><%echo date("r",val("buildtm"));%></lastBuildDate>
	<pubDate><%echo date("r",val("buildtm"))%></pubDate>
	<ttl>2</ttl>

<t:list property="items" value="row">
	<item>
	<title><%$row["title"]%></title>
	<author><%$row["author"]%></author>
	<link><%$row["link"]%></link>
	<pubDate><%echo date("r",$row["updatetm"])%></pubDate>
	<description><%$row["contents"]%></description>
	</item>
</t:list>

</channel>
</rss>
