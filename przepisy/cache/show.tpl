<? $row=$this->getval("rec");?>
<!-- owner <?echo$row->userid?> -->
<table cellspacing="0" cellpadding="0"><tr><td>
<?if($row->icon){?>
<img src="<?echo strpos($row->icon,"://")?$row->icon:"upload/".$row->icon?>" width="220px" alt=""/>
<?}else{?>
<img src="noimg.png" height="40" alt=""/>
<?}?>
<td>

<div class="title"><?echo$row->name?></div>
<table cellspacing="0" cellpadding="0" class="item">
<? $rec=$this->getval("rec");if(sizeof($rec)>0){?><?if(is_array($rec)||is_object($rec)){?>
<?for(reset($rec),$vcnt=0;list($f,$v)=each($rec);++$vcnt){?>
<?if(!array_key_exists($f,$rec->getPK())&&substr($f,0,1)!="_"&&$f!="userid"&&$f!="name"&&$f!="icon"&&$f!="contents"){?>
<tr><th width=""><?echo $this->getval("txt.tab.recipe.".$f,$f)?><td><?echo$v?></tr>
<?}?>
<?}}else if (strlen($v=$rec)>0){?>
<?if(!array_key_exists($f,$rec->getPK())&&substr($f,0,1)!="_"&&$f!="userid"&&$f!="name"&&$f!="icon"&&$f!="contents"){?>
<tr><th width=""><?echo $this->getval("txt.tab.recipe.".$f,$f)?><td><?echo$v?></tr>
<?}?>
<?}?><?}?>
</table>

<div class="title"><?echo $this->getval("txt.tab.recipe.contents","contents")?></div>
<table cellspacing="0" cellpadding="0" class="item">
<tr><td><?echo$row->contents?></td></tr>
</table>

</td></tr>
<tr><td colspan=2 class="right">
<a href="?act=recipes">Powrót</a>
</td></tr></table>
