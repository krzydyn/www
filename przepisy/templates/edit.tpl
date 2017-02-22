<form action="?" method="post">
<input type="hidden" name="act" value="saveRecipe"/>

<t:list property="rec" id="f" value="v">
<%if(array_key_exists($f,$rec->getPK())||$f=="userid"){%>
<input type="hidden" name="rec[<%$f%>]" value="<%$v%>">
<%}%>
</t:list>

<table class="item">
<t:list property="rec" id="f" value="v">
<%if(!array_key_exists($f,$rec->getPK())&&substr($f,0,1)!="_"&&$f!="userid"){%>
<tr><th><%val("txt.tab.recipe.".$f,$f)%></th><td>
<%if(val("user")){%>
<%if($f=="contents"){%>
<!--t:fckeditor class="editor" name="rec[contents]" skin="silver" toolbar="Default"/-->
<textarea id="rec_contents" name="rec[contents]"><%$v%></textarea>
<script>
CKEDITOR.replace('rec_contents',
{

	filebrowserImageBrowseUrl : '<%val("cfg.fck")%>filemanager/browser/default/browser.html?Type=Image&ServerPath=<%val("cfg.rooturl")%>upload/&Connector=../../connectors/php/connector.php',
	filebrowserImageUploadUrl : '<%val("cfg.fck")%>filemanager/connectors/php/upload.php?Type=Image&currentFolder=/kysoft.pl/przepisy/upload',
});</script>
<?
	filebrowserBrowseUrl :'<%val("cfg.fck")%>filemanager/browser/default/browser.html?Connector=<%val("cfg.fck")%>filemanager/connectors/php/connector.php',
	filebrowserUploadUrl  :'<%val("cfg.fck")%>filemanager/connectors/php/upload.php?Type=File',
	filebrowserFlashBrowseUrl :'<%val("cfg.fck")%>filemanager/browser/default/browser.html?Type=Flash&Connector=<%val("cfg.fck")%>filemanager/connectors/php/connector.php',
	filebrowserFlashUploadUrl : '<%val("cfg.fck")%>filemanager/connectors/php/upload.php?Type=Flash'
	?>
<%}else{%>
<input type="text" name="rec[<%$f%>]" value="<%$v%>">
<%}}else{%>
<%$v%>
<%}}%>
</td></tr>
</t:list>
<tr><td colspan="2" class="right">
<%if(val("rec")->id){%>
<input type="button" value="<%val("txt.delete","delete")%>" onclick="return submitForm('act=deleteRecipe');"/>
<%}%>
<input type="submit" value="<%val("txt.save","save")%>"/>
<input type="button" value="<%val("txt.cancel","cancel")%>" onclick="return submitForm('act=recipes');"/>
</td></tr>
</table>
</form>
