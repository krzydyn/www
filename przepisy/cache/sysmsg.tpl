<div class="abs"><div class="sysmsg" id="sysmsg">
<?if($this->getval("error")||$this->getval("warn")||$this->getval("info")){?>
<fieldset><legend>System message</legend><table cellspacing="0" cellpadding="0">
<?if($this->getval("error")){?>
<tr><td><? $error=$this->getval("error");if(sizeof($error)>0){?><ul class="error"><?if(is_array($error)||is_object($error)){?>
<?for(reset($error),$licnt=0;list($__i,$li)=each($error);++$licnt){?><li><?echo$li?></li><?}}else if (strlen($li=$error)>0){?><li><?echo$li?></li><?}?></ul><?}?></td></tr>
<?}?>
<?if($this->getval("warn")){?>
<tr><td><? $warn=$this->getval("warn");if(sizeof($warn)>0){?><ul class="warn"><?if(is_array($warn)||is_object($warn)){?>
<?for(reset($warn),$licnt=0;list($__i,$li)=each($warn);++$licnt){?><li><?echo$li?></li><?}}else if (strlen($li=$warn)>0){?><li><?echo$li?></li><?}?></ul><?}?></td></tr>
<?}?>
<?if($this->getval("info")){?>
<tr><td><? $info=$this->getval("info");if(sizeof($info)>0){?><ul class="info"><?if(is_array($info)||is_object($info)){?>
<?for(reset($info),$licnt=0;list($__i,$li)=each($info);++$licnt){?><li><?echo$li?></li><?}}else if (strlen($li=$info)>0){?><li><?echo$li?></li><?}?></ul><?}?></td></tr>
<?}?>
<tr><td align="right"><input type="submit" value="Ok" onClick="$('sysmsg').toggle()"/></td></tr>
</table>
</fieldset><?}?>
</div></div>
