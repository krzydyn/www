<table cellspacing="0" cellpadding="0" class="db user">
<caption>
U¿ytkownicy
<?if($this->getval("user")){?>
<a href="?act=addUser">dodaj usera</a>
<?}?>
</caption>
<tr class="head">
<th></th>
<? $row=$this->getval("rec");while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="passwd"){?>
<th class="<?echo$f?>"><?echo $this->getval("txt.tab.user.".$f,$f)?></th>
<?}?>
</tr>
<? $result=$this->getval("result");if(sizeof($result)>0){?><?if(is_array($result)||is_object($result)){?>
<?for(reset($result),$rowcnt=0;list($i,$row)=each($result);++$rowcnt){?>
<tr class="row row<?echo$rowcnt&1?>" onClick="if(!containsEvent($(this).down(),event))window.location='?act=show<?echo$row->getClass()?>&id=<?echo$row->getID()?>';">
<th class="No"><?echo$rowcnt+1?></th>
<?reset($row);while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="passwd"){?>
<?if(is_object($v)){?>
<td class="<?echo$f?>"><?echo$v->toString()?></td>
<?}else{?>
<td class="<?echo$f?>"><?echo$v?></td>
<?}}?>
</tr>
<?}}else if (strlen($row=$result)>0){?>
<tr class="row row<?echo$rowcnt&1?>" onClick="if(!containsEvent($(this).down(),event))window.location='?act=show<?echo$row->getClass()?>&id=<?echo$row->getID()?>';">
<th class="No"><?echo$rowcnt+1?></th>
<?reset($row);while (list($f,$v)=each($row))if(!array_key_exists($f,$row->getPK())&&substr($f,0,1)!="_"&&$f!="passwd"){?>
<?if(is_object($v)){?>
<td class="<?echo$f?>"><?echo$v->toString()?></td>
<?}else{?>
<td class="<?echo$f?>"><?echo$v?></td>
<?}}?>
</tr>
<?}?><?}?>
</table>
