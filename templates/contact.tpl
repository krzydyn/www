<div style="height:450px;vertical-align:middle;display:table-cell;">

<%if(val("req.lang")=="en"){%>
<h2>Contact:</h2>
<br/>
<p>KySoft, Krzysztof Dynowski</p>
<p>Warsaw, Poland</p>
<br/>
<p>email: <a href="mailto:biuro@kysoft.pl">biuro@kysoft.pl</a></p>
<br/>

<%}else{%>

<h2>Kontakt:</h2>
<br/>
<p>KySoft, Krzysztof Dynowski</p>
<p>Warszawa, Polska</p>
<br/>
<p>email: <a href="mailto:biuro@kysoft.pl">biuro@kysoft.pl</a></p>
<br/>
<%}%>

<%if(!val("robot")){%>
<!-- <%val("txt.send","send")%> <a href="#" onclick="$('smsframe').toggle();">SMS</a> -->
<?
//<iframe id="smsframe" style="display:none;position:absolute;top:140px" frameborder="0" width="230" height="355" scrolling="no" src="http://sms.orange.pl/minisms2.aspx?"></iframe>
//<%val("txt.to_me","to me")%> (<%val("txt.free_gate","free gate")%>)</p>
?>
<br/><br/>
<form name="email" method="post" action="?" onsubmit="formcheck('email','from')">
<input type="hidden" name="act" value="email"/>
<input class="none" type="text" name="test"/>
<fieldset><legend><%val("txt.email.quick_msg","Quick message")%></legend>
<table><tr><td><%val("txt.email.from","From")%>:</td><td><input name="from" type="text" size="50" value="<%val("req.from")%>"/> (<%val("txt.email.name_or_email","name or email")%>)</td></tr>
<tr><td><%val("txt.email.text","Text")%>:</td><td><textarea name="msg" cols="55" rows="6"><%val("req.msg")%></textarea>
<tr><td colspan="2" align="right">
<input type="submit" value="<%val("txt.send","send")%>"/>
</td></tr></table>
</fieldset>
</form>
<%}%>

</div>
