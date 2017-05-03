<h2>Computers</h2>

<table class="multcol"><tr><td>
<t:list property="articles" value="li">
<a class="nowrap" href="?tab=proj/comp&amp;article=<%$li%>"><%$li%></a><br>
</t:list>
</td><td>
<div style="text-align:center;">(currently only in english)</div>
<%if (val("req.article")) include("proj/comp/".val("req.article").".tpl");%>
</td></tr></table>
