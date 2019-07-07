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

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="NCS3TX8E872HJ">
<table>
<tr><td><input type="hidden" name="on0" value="Wsparcie systemu">Wsparcie systemu</td></tr><tr><td><input type="text" name="os0" maxlength="200"></td></tr>
</table>
<input type="image" src="https://www.paypalobjects.com/pl_PL/PL/i/btn/btn_paynow_SM.gif" border="0" name="submit" alt="PayPal – Płać wygodnie i bezpiecznie">
<img alt="" border="0" src="https://www.paypalobjects.com/pl_PL/i/scr/pixel.gif" width="1" height="1">
</form>


</div>
