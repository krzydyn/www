<%if (!val("robot")){%>
<div class="fixed suggest"><a href="#" onclick="$('suggestbox').toggle();return false;"><%val("txt.suggestion")%></a></div>
<div class="hold alpha60" id="suggestbox" style="display:none"><div class="center"><div>
<form name="suggestion" method="post" action="?<%val("srv.QUERY_STRING")%>" onsubmit="formcheck('suggestion','suggest[subj]')">
<input class="none" type="text" name="test"/>
<input type="hidden" name="act" value="suggest"/>
<fieldset>
<%if(val("req.lang")=="en"){%>
<legend>Your suggestion</legend>
<table>
<tr><td>Subject</td><td><input type="text" name="suggest[subj]" size="50" value="<%val("req.suggest.subj")%>"/></td></tr>
<tr><td>Type</td><td><select name="suggest[type]">
<option value="suggestion">Suggestion</option>
<option value="error">Damage</option>
<!--option value="question">Question</option-->
<option value="admit">Opinion</option>
<!--option value="priv">Private</option-->
</select></td></tr>
<tr><td>Description</td><td><textarea name="suggest[msg]" cols="50" rows="8"><%val("req.suggest.msg")%></textarea></td></tr>
<tr><td colspan="2" align="right">
<%}else{%>
<legend>Zgłoszenie sugestii</legend>
<table>
<tr><td>Temat</td><td><input type="text" name="suggest[subj]" size="50" value="<%val("req.suggest.subj")%>"/></td></tr>
<tr><td>Rodzaj</td><td><select name="suggest[type]">
<option value="suggestion">Sugestia</option>
<option value="error">Awaria</option>
<!--option value="question">Pytanie</option-->
<option value="admit">Opinia</option>
<!--option value="priv">Prywatnie</option-->
</select></td></tr>
<tr><td>Opis</td><td><textarea name="suggest[msg]" cols="50" rows="8"><%val("req.suggest.msg")%></textarea></td></tr>
<tr><td colspan="2" align="right">
<%}%>
<input type="submit" value="<%val("txt.send","send")%>"/>
<input type="button" value="<%val("txt.cancel","cancel")%>" onclick="$('suggestbox').toggle()"/>
</td></tr>
</table>
</fieldset></form>
</div></div></div>
<%}%>
