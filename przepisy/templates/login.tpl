<center>
<table class="login" align="center" valign="middle">
  <tr><td>Logowanie</td></tr>
  <tr><td><input name="user" type="text" value="<%val("req.user")%>"></td></tr>
  <tr><td><input name="passwd" type="password"></td></tr>
  <tr><td align="right">
  <input class="button" type="button" value="Powrót" onclick="back()">
  <input class="button" type="submit" value="Login" onclick="submitForm('act=login')">
  </td></tr>
</table>
</center>
