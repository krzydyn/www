<b>How to create RSS channel on my web?</b><br>
It is simple...<br>
<br>
1. in HEAD section of HTML place link to rss file<br>
<%code_start("html")%>
  <link rel="alternate" type="application/rss+xml" title="KySoft RSS" href="myrss.xml" />
<%code_stop()%>
<br>
2. create XML file 'myrss.xml' - as referred above<br>
<%code_start("xml")%>
&lt;?xml version="1.0" encoding="iso-8859-2"?&gt;
<rss version="2.0">
<channel>
	<title>Channel title</title>
	<link>http://kysoft.pl</link>
	<language>pl</language>
	<description>channel description</description>
	<lastBuildDate>DATE</lastBuildDate>
	<pubDate>DATE</pubDate>

	<item>
	<title>News Item 1</title>
	<author>krzydyn</author>
	<link>http://kysoft.pl?id=1</link>
	<pubDate>DATE</pubDate>
	<description>Item description</description>
	</item>
</channel>
</rss>  
<%code_stop()%>
<b>Note:</b> DATE must be in format: <i>Fri, 01 Jun 2012 15:03:56 +0200</i><br>
<br>
<b>It is little more complex (but flexible) to generate from php...</b><br>
<br>
1. in HEAD section of HTML place link to myrss.php file<br>
<%code_start("html")%>
  <link rel="alternate" type="application/rss+xml" title="KySoft RSS" href="myrss.php" />
<%code_stop()%>
<br>
2. create PHP file 'myrss.php' - as referred above<br>
<%code_start("php")%>
&lt;?
header("Content-type: application/rss+xml");
echo "&lt?xml version=\"1.0\" encoding=\"iso-8859-2\"?>\n";
$rows=getRows();//call some function to retrieve rows and store result in variable
// assumig that each row has fields: id, title, author, createtime, contents
$build=time();
$pub=time();
?&gt;
<%code_stop()%>
<%code_start("xml")%>
<rss version="2.0">
<channel>
	<title>Channel title</title>
	<link>http://kysoft.pl</link>
	<language>pl</language>
	<description>channel description</description>
	<lastBuildDate>&lt;?echo date("r",$build)?&gt;</lastBuildDate>
	<pubDate>&lt;?echo date("r",$build)?&gt;</pubDate>

&lt;?for ($i=0; $i&thinsp;<&thinsp;sizeof($rows); ++$i){$r=$row[$i];?&gt;
	<item>
	<title>&lt;?$r["title"]?&gt;</title>
	<author>&lt;?$r["author"]?&gt;</author>
	<link>http://kysoft.pl?id=&lt;?$r["id"]?&gt;</link>
	<pubDate>&lt;?echo date("r",$r["createtime"])?&gt;</pubDate>
	<description>&lt;?$r["contents"]?&gt;</description>
	</item>
&lt;?}?&gt;
</channel>
</rss>  
<%code_stop()%>
