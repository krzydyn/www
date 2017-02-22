<form action="?" method="post">
<input type="hidden" name="act" value="saveRecipe"/>

<? $rec=$this->getval("rec");if(sizeof($rec)>0){?><?if(is_array($rec)||is_object($rec)){?>
<?for(reset($rec),$vcnt=0;list($f,$v)=each($rec);++$vcnt){?>
<?if(array_key_exists($f,$rec->getPK())||$f=="userid"){?>
<input type="hidden" name="rec[<?echo$f?>]" value="<?echo$v?>">
<?}?>
<?}}else if (strlen($v=$rec)>0){?>
<?if(array_key_exists($f,$rec->getPK())||$f=="userid"){?>
<input type="hidden" name="rec[<?echo$f?>]" value="<?echo$v?>">
<?}?>
<?}?><?}?>

<table cellspacing="0" cellpadding="0" class="item">
<? $rec=$this->getval("rec");if(sizeof($rec)>0){?><?if(is_array($rec)||is_object($rec)){?>
<?for(reset($rec),$vcnt=0;list($f,$v)=each($rec);++$vcnt){?>
<?if(!array_key_exists($f,$rec->getPK())&&substr($f,0,1)!="_"&&$f!="userid"){?>
<tr><th><?echo $this->getval("txt.tab.recipe.".$f,$f)?></th><td>
<?if($this->getval("user")){?>
<?if($f=="contents"){?>
<!--t:fckeditor class="editor" name="rec[contents]" skin="silver" toolbar="Default"/-->
<textarea id="rec_contents" name="rec[contents]"><?echo$v?></textarea>
<script>
CKEDITOR.replace('rec_contents',
{

	filebrowserImageBrowseUrl : '<?echo $this->getval("cfg.fck")?>filemanager/browser/default/browser.html?Type=Image&ServerPath=<?echo $this->getval("cfg.rooturl")?>upload/&Connector=../../connectors/php/connector.php',
	filebrowserImageUploadUrl : '<?echo $this->getval("cfg.fck")?>filemanager/connectors/php/upload.php?Type=Image&currentFolder=/kysoft.pl/przepisy/upload',
});</script>

<?}else{?>
<input type="text" name="rec[<?echo$f?>]" value="<?echo$v?>">
<?}}else{?>
<?echo$v?>
<?}}?>
</td></tr>
<?}}else if (strlen($v=$rec)>0){?>
<?if(!array_key_exists($f,$rec->getPK())&&substr($f,0,1)!="_"&&$f!="userid"){?>
<tr><th><?echo $this->getval("txt.tab.recipe.".$f,$f)?></th><td>
<?if($this->getval("user")){?>
<?if($f=="contents"){?>
<!--t:fckeditor class="editor" name="rec[contents]" skin="silver" toolbar="Default"/-->
<textarea id="rec_contents" name="rec[contents]"><?echo$v?></textarea>
<script>
CKEDITOR.replace('rec_contents',
{

	filebrowserImageBrowseUrl : '<?echo $this->getval("cfg.fck")?>filemanager/browser/default/browser.html?Type=Image&ServerPath=<?echo $this->getval("cfg.rooturl")?>upload/&Connector=../../connectors/php/connector.php',
	filebrowserImageUploadUrl : '<?echo $this->getval("cfg.fck")?>filemanager/connectors/php/upload.php?Type=Image&currentFolder=/kysoft.pl/przepisy/upload',
});</script>

<?}else{?>
<input type="text" name="rec[<?echo$f?>]" value="<?echo$v?>">
<?}}else{?>
<?echo$v?>
<?}}?>
</td></tr>
<?}?><?}?>
<tr><td colspan="2" class="right">
<?if($this->getval("rec")->id){?>
<input type="button" value="<?echo $this->getval("txt.delete","delete")?>" onclick="return submitForm('act=deleteRecipe');"/>
<?}?>
<input type="submit" value="<?echo $this->getval("txt.save","save")?>"/>
<input type="button" value="<?echo $this->getval("txt.cancel","cancel")?>" onclick="return submitForm('act=recipes');"/>
</td></tr>
</table>
</form>
