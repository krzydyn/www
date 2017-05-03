How to protect cell contents against editing:<br>
select cells<br>
choose menu option "Data > Validate"<br>
then in Criteria tab<br>
<div style="margin-left:20px;">
  Allow = text length<br>
  Data = between<br>
  Minimum = 0<br>
  Maksimum = 0<br>
</div>
then in Error message tab<br>
<div style="margin-left:20px;">
  Action = "Stop"<br>
  Title = "calculated cell"<br>
  Message = "this cell is calculated, do not edit"<br>
</div>
