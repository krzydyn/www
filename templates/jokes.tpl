<table class="multcol"><tr><td>
<b>Kategorie</b><br>
<table>
<t:list property="categorylist" id="i" value="v"><tr>
  <td class="nowrap"><a href="?tab=jokes&amp;category=<%$v["category"]%>"><%$v["name"]%></a></td>
  <td align="right"><%$v["_cnt"]%></td>
</tr></t:list>
<t:list property="categorylist_ad" id="i" value="v"><tr>
  <%if(!is_array($v))echo"<td colspan=2><hr></td>";else{%>
  <td class="nowrap"><a href="?tab=jokes&amp;category=<%$v["category"]%>"><%$v["name"]%></a></td>
  <%if(array_key_exists("_cnt",$v)) echo "<td align=\"right\">".$v["_cnt"]."</td>"%>
  <%}%>
</tr></t:list>
</table>
<hr>

&nbsp;<iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fkysoft.pl%2F%3Ftab%3Djokes&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100px; height:21px;" allowTransparency="true"></iframe>
<!--iframe src="http://www.facebook.com/plugins/likebox.php?id=379551122075888&amp;width=150&amp;connections=10&amp;stream=true&amp;height=587" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:150px; height:200px;" allowTransparency="true"></iframe-->
<hr>
<%if(val("user")){%>
<div><a href="?act=newJoke&amp;category=<%val("req.category")%>">dodaj nowy</a></div>
<%}else if (!val("robot")) include("jokes/editJoke2.tpl");%>

</td><td>

<div><form method="post" action="?tab=jokes">
<input type="hidden" name="act" value="searchJoke"/>
<input type="text" name="jokesearch" size="40" value="<%val("req.jokesearch")%>"/> <input type="submit" value="Szukaj"/>
</form></div>

<%if(sizeof(val("pages"))>0){%>
<div class="nowrap">
Strona: <t:list property="pages" value="p">
<%if(!is_numeric($p[0])){%>
<b>&nbsp;<%$p[1]%>&nbsp;</b>
<%}else{%>
<a href="?tab=jokes&amp;category=<%val("req.category")%>&amp;page=<%$p[0]%>"><%$p[1]%></a>
<%}%></t:list></div><%}%>

<table class="multcol">
<t:list property="result" id="i" value="row">
<tr class="row row<%$rowcnt&1%>"><td>
<!-- updatetm=<%$row->updatetm." ".strftime("%Y-%m-%d %H:%M:%S",$row->updatetm)%> -->
<div class="nowrap">
<b><%$rowcnt+val("offs")+1%>.</b> dodany <b><%echo val("user")&&val("user.role")<2?strftime("%Y-%m-%d %H:%M",$row->updatetm):strftime("%Y-%m-%d",$row->updatetm)%></b>
<%if(val("user") && (val("user")->id==$row->userid || val("user")->role<2)){%>
przez <b><%$row->_user->name%></b>
<%}%>
w kategorii <b><%echo html_escape($row->category)%></b>,
ocena: <b><%echo sprintf("%.2f",$row->rank*4+1)%></b>/<%$row->votecnt%>
<%if(val("user") && (val("user")->id==$row->userid || val("user")->role<2)){%>
&nbsp;<a href="?act=editJoke&amp;id=<%$row->id%>">edytuj</a>
<a href="?act=deleteJoke&amp;category=<%val("req.category")%>&amp;id=<%$row->id%>">usuñ</a>
<%}else{%>
<%if(val("voteid")==$row->id){%>
&nbsp;&nbsp;Dziękuję za ocenę
<%}else if (!val("robot")){%>
 oceń:
<a href="?tab=jokes&amp;act=voteJoke&amp;id=<%$row->id%>&amp;rank=1&amp;category=<%val("req.category")%>&amp;page=<%val("req.page")%>">1</a>
<a href="?tab=jokes&amp;act=voteJoke&amp;id=<%$row->id%>&amp;rank=2&amp;category=<%val("req.category")%>&amp;page=<%val("req.page")%>">2</a>
<a href="?tab=jokes&amp;act=voteJoke&amp;id=<%$row->id%>&amp;rank=3&amp;category=<%val("req.category")%>&amp;page=<%val("req.page")%>">3</a>
<a href="?tab=jokes&amp;act=voteJoke&amp;id=<%$row->id%>&amp;rank=4&amp;category=<%val("req.category")%>&amp;page=<%val("req.page")%>">4</a>
<a href="?tab=jokes&amp;act=voteJoke&amp;id=<%$row->id%>&amp;rank=5&amp;category=<%val("req.category")%>&amp;page=<%val("req.page")%>">5</a>
<%}}%>
<%if($row->_cnt){%>wsk:<%$row->_cnt%><%}%>
</div>
<div class="post joke nowrap"><%$row->contents%></div>

</td></tr>
</t:list>
</table>

<%if(sizeof(val("pages"))>0){%>
<div class="nowrap">
Strona: <t:list property="pages" value="p">
<%if(!is_numeric($p[0])){%>
<b>&nbsp;<%$p[1]%>&nbsp;</b>
<%}else{%>
<a href="?tab=jokes&amp;category=<%val("req.category")%>&amp;page=<%$p[0]%>"><%$p[1]%></a>
<%}%></t:list></div><%}%>

</td>
</tr></table>
<%
/*
http://www.perelki.net?top=1&ps=14
http://kawaly.tja.pl/?url=najnowsze_kawaly&st=mvhzzy (5 strona)
http://www.wcipy.pl/ (najlepsza)

A wife comes home late one night, arriving early from being out of town and quietly opens the door to her bedroom.
Sticking out from under the blanket she sees four legs instead of two.
She reaches for a baseball bat and starts hitting the blanket as hard as she can.
Once she's done, she goes to the kitchen to have a drink.
As she enters, she sees her husband there, reading a magazine.
"Hi Darling", he says, "Your parents have come to visit us, so l let them stay in our bedroom.
*/
%>
