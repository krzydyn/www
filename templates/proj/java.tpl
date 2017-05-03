<table class="multcol"><tr><td>
<b>Java</b><br>
<t:list property="javaarticles" value="li">
<a class="nowrap" href="?tab=proj/java&amp;article=java/<%$li%>"><%$li%></a><br>
</t:list>
<a class="nowrap extern" href="http://nadeausoftware.com/articles/2008/02/java_tip_how_read_files_quickly">fast file read</a><br>
<br>
<b>C/C++</b><br>
<t:list property="cpparticles" value="li">
<a class="nowrap" href="?tab=proj/java&amp;article=cpp/<%$li%>"><%$li%></a><br>
</t:list>

</td><td>
<div style="text-align:center;">(currently only in english)</div>
<%if (val("req.article")) include("proj/".val("req.article").".tpl");%>
</td></tr></table>


