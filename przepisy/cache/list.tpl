<form action="?act=recipes" method="post"><input type="text" size="40" name="search" value="<?echo $this->getval("req.search")?>"/>
<input type="submit" value="Szukaj"/>
<a href="?act=advrecipes">Szukanie zaawansowane</a>
</form>
<br/><br/>
<table cellspacing="0" cellpadding="0" class="db recipe">
<caption>
<?if(sizeof($this->getval("pages"))>1){?>
Strona: <? $pages=$this->getval("pages");if(sizeof($pages)>0){?><?if(is_array($pages)||is_object($pages)){?>
<?for(reset($pages),$pcnt=0;list($i,$p)=each($pages);++$pcnt){?><a href="#" onclick="return submitForm('page=<?echo$p?>');"><?echo$p?></a> <?}}else if (strlen($p=$pages)>0){?><a href="#" onclick="return submitForm('page=<?echo$p?>');"><?echo$p?></a> <?}?><?}?>
<?}?>
(<? $from=$this->getval("offs")+1;$to=$from+sizeof($this->getval("result"))-1;
  if ($from<$to) echo "$from-$to z ".$this->getval("count"); else echo "brak wyników"?>)
<?if($this->getval("user")){?>
<a href="?act=addRecipe">dodaj przepis</a>
<?}?>
</caption>
<tr class="head">
<th></th>
<? $row=$this->getval("rec");while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="userid"&&$f!="icon"&&$f!="calority"&&$f!="contents"){?>
<th class="<?echo$f?>"><?echo $this->getval("txt.tab.recipe.".$f,$f)?></th>
<?}?>
</tr>
<? $result=$this->getval("result");if(sizeof($result)>0){?><?if(is_array($result)||is_object($result)){?>
<?for(reset($result),$rowcnt=0;list($i,$row)=each($result);++$rowcnt){?>
<tr class="row row<?echo$rowcnt&1?>" onClick="if(!containsEvent($(this).down(),event))window.location='?act=show<?echo$row->getClass()?>&id=<?echo$row->getID()?>';">
<!-- userid=<?echo$row->userid?> -->
<td class="icon"><a class="icon" href="#">
<?if($row->icon){?>
<img src="<?echo strpos($row->icon,"://")?$row->icon:"upload/".$row->icon?>" height="40" alt=""/>
<div class="bigsample"><img src="<?echo strpos($row->icon,"://")?$row->icon:"upload/".$row->icon?>" height="200" alt=""/></div>
<?}else{?>
<img src="noimg.png" height="40" alt=""/>
<?}?>
</a></td>
<?reset($row);while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="userid"&&$f!="icon"&&$f!="calority"&&$f!="contents"){?>
<?if(is_object($v)){?>
<td class="<?echo$f?>"><?echo$v->toString()?></td>
<?}else{?>
<td class="<?echo$f?>"><?echo$v?></td>
<?}}?>
</tr>
<?}}else if (strlen($row=$result)>0){?>
<tr class="row row<?echo$rowcnt&1?>" onClick="if(!containsEvent($(this).down(),event))window.location='?act=show<?echo$row->getClass()?>&id=<?echo$row->getID()?>';">
<!-- userid=<?echo$row->userid?> -->
<td class="icon"><a class="icon" href="#">
<?if($row->icon){?>
<img src="<?echo strpos($row->icon,"://")?$row->icon:"upload/".$row->icon?>" height="40" alt=""/>
<div class="bigsample"><img src="<?echo strpos($row->icon,"://")?$row->icon:"upload/".$row->icon?>" height="200" alt=""/></div>
<?}else{?>
<img src="noimg.png" height="40" alt=""/>
<?}?>
</a></td>
<?reset($row);while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="userid"&&$f!="icon"&&$f!="calority"&&$f!="contents"){?>
<?if(is_object($v)){?>
<td class="<?echo$f?>"><?echo$v->toString()?></td>
<?}else{?>
<td class="<?echo$f?>"><?echo$v?></td>
<?}}?>
</tr>
<?}?><?}?>
</table>
