<?php
// https://checkgzipcompression.com/?url=http%3A%2F%2Fkysoft.pl
require_once("config.php");
require_once($config["cmslib"]."modules.php");
require_once($config["cmslib"]."application.php");
require_once($config["cmslib"]."model.php");
require_once("email.php");

define('ITEMS_ON_PAGE',10);
define('PAGES_LINKS',20);
define('DEFAULT_TAB',"proj");

class User extends ModelObject{
	var $id;
	var $name;
	var $passwd;
	var $role;
	var $fullname;
	var $email;
	function toString(){return $this->fullname!==null?$this->fullname:$this->name;}
}
class Session extends ModelObject{
	var $hash;
	var $uid;
	var $tmses;
	var $tmstamp;
	function getPK(){return array("hash"=>null);}
}
class Joke extends ModelObject{
	var $id;
	var $userid;
	var $category;
	var $updatetm;
	var $rank;
	var $contents;
	var $votecnt;
	var $_cnt;
	var $_user;
}
class JokeIndex extends ModelObject{
	var $word;
	var $jokeid;
	var $cnt=1;
	var $_cnt;

	static function add($dao,$joke){
		if (!($joke instanceof Joke)) {echo "Joke required<br>"; return false;}
		if (!$joke->id) { echo "Joke.id required<br>"; return false; }
		$words=translate("ISO8859-1","ISO8859-2",$joke->contents);
		$words=preg_split("/[^[:alpha:]]+/",strtolower($words));
		$words_uq=array();
		for ($i=0; $i<sizeof($words); ++$i){
			$w=$words[$i];
			if (strlen($w)<3) continue;
			if (!array_key_exists($w,$words_uq))$words_uq[$w]=0;
			$words_uq[$w]+=1;
		}
		//printobj("words_uq",$words_uq);
		//TODO make one insert
		$ji=new JokeIndex();
		$dao->del($ji,new Criteria("jokeid",$joke->id));
		$ji->jokeid=$joke->id;
		while (list($w,$cnt)=each($words_uq)){
			$ji->word=$w;
			$ji->cnt=$cnt;
			if ($dao->insert($ji)===false) return false;
			//echo "add jid=".$ji->jokeid." w=".$ji->word."<br>";
		}
		return true;
	}
	static function &search($dao,$words){
		if (!$words) return false;

		if (!is_array($words)){
			$words=translate("ISO8859-1","ISO8859-2",$words);
			$words=preg_split("/[^[:alpha:]]+/",strtolower($words));
			$words=array_unique($words);
		}

		$ji=new JokeIndex();
		$crit=new Criteria();
		$crit->setOrder("_cnt desc");
		$crit->setLimit(50);
		for ($n=0,$i=0; $i<sizeof($words); ++$i){
			$w=$words[$i];
			if (strlen($w)<3) continue;
			$crit->addfv("word".$i,"%".$w."%");
			$crit->add("word like #word".$i,"or");
			++$n;
		}
		if ($n==0) return array();
		$crit->add("jokeid","group by");
		return $dao->find($ji,array("jokeid","sum(cnt) as _cnt"),$crit);
	}
}

class Comment extends ModelObject{
	var $id;
	var $userid;
	var $approved;
	var $createtm;
	var $updatetm;
	var $context;
	var $contents;
	var $_user;
	function toString(){return $this->contents;}
}
class Robot extends ModelObject{
	var $tm;
	var $addr;
	var $cnt;
	var $ua;
	var $type;
	var $msg;
	function getPK(){return array("addr"=>null);}
	function defaultOrder(){return "tm desc,ua";}
}
$dumpdone=false;
class KySoft extends Application{
	var $dao;
	var $user;
	var $ses;
	var $context;

	function initialize(){
		$db=DB::connectDefault();
		$this->dao=new ObjectDB($db);

		$reqtabs=array(
			"user"=>"id integer primary key,state int not null default 0,name varchar(63) not null,passwd varchar(32)not null default '',role int not null default 2,".
				"fullname varchar(255)not null default '',email varchar(255)not null default '',unique(name)",
			"session"=>"hash varchar(80) not null,uid int not null,tmses int,tmstamp int,unique(hash)",
			"joke"=>"id integer primary key,userid int not null,category varchar(100),".
				"updatetm int not null,rank real not null default '0.0',votecnt int default '1',contents text not null default ''",
			"jokeindex"=>"word varchar(30),jokeid int,cnt int not null default 1",
			"comment"=>"id integer primary key,userid int not null,approved int not null default 0,".
				"createtm int not null,updatetm int not null,context varchar(255),contents text not null default ''",
			"robot"=>"tm int not null,addr varchar(16),cnt int,ua varchar(255),type int,msg varchar(255),unique(addr)",

			// idea of generic votes (refname=other table name, refid=id in other table)
			//"vote"=>"id integer primary key,refname varchar(20),refid int not null,rank real not null,votes int not null)
		);
		$tabs=$db->tables();
		if ($tabs===false){
			$this->addval("error","DB:".$db->errmsg());
			return false;
		}
		while (list($t,$v)=each($reqtabs)){
			if (in_array($t,$tabs)) continue;
			$r=$db->tabcreate($t,$v);
			if ($r===false) {$this->addval("error","DB:".$db->errmsg());return false;}
		}
		if ($db->tabcount("user")==0){
			$r=$db->tabinsert("user",array("state"=>"1","name"=>"admin","role"=>"0","passwd"=>md5("admin")));
			if ($r===false) $this->addval("error","DB:".$db->errmsg());
			$r=$db->tabinsert("user",array("state"=>"1","name"=>"krzydyn","role"=>"1","passwd"=>md5("test")));
			if ($r===false) $this->addval("error","DB:".$db->errmsg());
		}
		/*
		$r=$db->describe("joke");
		if ($r===false) {$this->addval("error","DB:".$db->errmsg());return false;}
		if (!array_key_exists("votecnt",$r)) {
			$db->addcolumn("joke","votecnt int default '1'");
		}
		*/

		global $dumpdone;
		if (!$dumpdone) {
			$dumpdone=true;
			//$db->tabdelete("robot","");
			//logstr("*** DUMP");
			//$db->dump();
		}
	}

	function process(){
		global $config;
		$tabs=array(
			"about"=>"About",
			"proj"=>"Projects",
			"moto"=>"Motorbikes",
			"jokes"=>"Jokes",
			"links"=>"Links",
			"contact"=>"Contact",
		);

		$this->authenticate();
		if (!$this->user) $this->checkRobot();
		$this->logreq();
		if ($this->getval("robot"))$this->setval("req.act");//clear action
		//verify arguments
		$test=$this->getval("req.tab");
		if ($test && !preg_match("#^[-_A-Za-z0-9/]+$#",$test)){
			$this->setval("req.tab");
			$this->saveRobot(0,"tab:'".$test."'");
		}
		$test=$this->getval("req.act");
		if ($test && !preg_match("#^[-_A-Za-z0-9/]+$#",$test)){
			$this->setval("req.act");
			$this->saveRobot(0,"act:'".$test."'");
		}
		$test=$this->getval("req.article");
		if ($test && !preg_match("#^[-_A-Za-z0-9/]+$#",$test)){
			$this->setval("req.article");
			$this->saveRobot(0,"article:'".$test."'");
		}

		$preflang=$this->getval("srv.HTTP_ACCEPT_LANGUAGE");
		if (empty($preflang)) $preflang="pl";
		else $preflang=substr($preflang,0,2);
		if ($preflang!="pl") $preflang="en";
		$lang=$this->getval("req.lang");
		if (empty($lang)) $lang=$preflang;
		$this->setval("req.lang",$lang);
		setcookie("lang",$lang,time()+3600*24*30);

		parent::process();
		$tab=$this->getval("req.tab");

		if ($this->user){
			//add config tab
			if ($this->user->role<2) $tabs["conf"]="Config";
		}
		else {
			//profile only if user
			if ($tab=="profile"||$tab=="conf") $tab="";
		}

		if (empty($tab)) $tab=DEFAULT_TAB;
		else if (strchr($tab,"_")) $tab=strtr($tab,array("_"=>"/"));
		$this->setval("req.tab",$tab);
		setcookie("tab",$tab,time()+3600*24*30);

		//find content file
		$cont=$tab;
		while (!searchdir($config["templatedir"],$cont.".tpl")){
			if (($i=strrpos($cont,"/"))===false) {$cont=DEFAULT_TAB; break;}
			$cont=substr($cont,0,$i);
		}
		$this->setval("content",$cont);
		$this->setval("req.tab",$tab);

		//find subtitle
		$subt=$tab;
		$t=$this->getval("txt.subtitle");
		while (empty($t[$subt])) {
			if (($i=strrpos($subt,"/"))===false) {$t[$subt]=$subt;break;}
			$subt=substr($subt,0,$i);
		}
		if ($tab=="about") $this->setval("sitetitle",$this->getval("txt.title"));
		else $this->setval("sitetitle","KySoft &bull; ".$t[$subt]);

		if (($m=$this->getval("txt.menu"))!==false){
			for($i=0; list($f,$v)=each($tabs); ++$i){
				if (!empty($m[$f])) $tabs[$f]=$m[$f];
			}
			reset($tabs);
		} else $this->addval("info","no txt.menu");
		$this->setval("tabs",$tabs);

		$t=$this->getval("txt.keywords");
		if (is_array($t) && array_key_exists($tab,$t))
			$this->setval("txt.keywords",$t[$tab]);
		else $this->setval("txt.keywords",$t["about"]);

		if ($tab=="sms"){
			//$this->setval("token","913a06af-11bf-4bb9-9c32-e8b979ea573e");
			$this->setval("token","78a96ee4-a6f1-4292-b4f8-d750c86782f6");
		}

		if (strpos($tab,"/")!==false||$this->getval("req.article"))
			$this->setval("context",$this->getval("req.tab").":".$this->getval("req.article"));
		$this->listComments();
	}
	function defaultAction(){
		$tab=$this->getval("req.tab");
		if ($tab=="jokes") $this->listJokeAction();
		else if ($tab=="jokes/editJoke") $this->editJokeAction();
		else if ($tab=="photos") $this->listPhotos();
		else if ($tab=="proj/labsk") $this->listLabSK();
		else if ($tab=="proj/cern") $this->listCern();
		else if ($tab=="proj/java") $this->listJava();
		else if ($tab=="proj/php") $this->listPHP();
		else if ($tab=="proj/comp") $this->listComp();
		else if (substr($tab,0,5)=="moto/") $this->listMoto(substr($tab,5));
		else if ($tab=="conf/editUser") $this->editUserAction();
		else if (substr($tab,0,5)=="conf/") $this->listConf(substr($tab,5));
		else if ($tab=="cia") cia_flags("https://www.cia.gov/library/publications/the-world-factbook/docs/flagsoftheworld.html");
	}
	function emailAction(){
		$this->setval("req.tab","contact");
		if (!$this->checkForm("email","from")) return ;
		$from=$this->getval("req.from");
		$msg=$this->getval("req.msg");
		$err=false;
		if (empty($from)) {$this->addval("error","FROM must not be empty");$err=true;}
		if (empty($msg)) {$this->addval("error","TEXT must not be empty");$err=true;}
		if ($err===false) {
			$r=sendmail("KySoft Kontakt",$from,"krzydyn@gmail.com",$msg);
			if (!empty($r)) {$this->addval("error",$r);$err=true;}
		}
		if ($err) $this->addval("error","message not sent");
		else {
			$this->addval("info","e-mail został wysłany poprawnie!");
			$this->setval("req.msg");
		}
	}
	function listPhotos(){
		$photos=readfiles("images/photos",".*jpg");
		$this->setval("photos",$photos);
	}
	function listProj(){
		$this->setval("req.tab","proj");
	}
	function listLabSK(){
		for ($lab=1; $lab<10; ++$lab){
			$a=array();
			if ($lab==1){
				$a=array_merge($a,readfiles("proj/fiz/lab1",".*pdf"));
				$a=array_merge($a,readfiles("proj/fiz/lab1",".*sh"));
			}
			else if ($lab==2){
				$a=array_merge($a,readfiles("proj/fiz/lab2",".*pdf"));
				$a=array_merge($a,readfiles("proj/fiz/lab2",".*c"));
				$a=array_merge($a,readfiles("proj/fiz/lab2","Makefile"));
			}
			else
				$a=array_merge($a,readfiles("proj/fiz/lab".$lab));
			if (sizeof($a)>0){
				$this->setval("lab".$lab,$a);
			}
		}
	}
	function listCern(){
		$this->setval("req.tab","proj/cern");
		$a=array();
		$a=array_merge($a,readfiles("templates/proj/cern",".*tpl"));
		for ($i=0; $i<sizeof($a); ++$i)
			$a[$i]=strtr($a[$i],array(".tpl"=>""));
		$this->setval("events",$a);
	}
	function listJava(){
		$this->setval("req.tab","proj/java");
		$a=array();
		$a=array_merge($a,readfiles("templates/proj/java",".*tpl"));
		for ($i=0; $i<sizeof($a); ++$i)
			$a[$i]=strtr($a[$i],array(".tpl"=>""));
		$this->setval("javaarticles",$a);
		$a=array();
		$a=array_merge($a,readfiles("templates/proj/cpp",".*tpl"));
		for ($i=0; $i<sizeof($a); ++$i)
			$a[$i]=strtr($a[$i],array(".tpl"=>""));
		$this->setval("cpparticles",$a);
	}
	function listPHP(){
		$this->setval("req.tab","proj/php");
		$a=array();
		$a=array_merge($a,readfiles("templates/proj/php",".*tpl"));
		for ($i=0; $i<sizeof($a); ++$i)
			$a[$i]=strtr($a[$i],array(".tpl"=>""));
		$this->setval("articles",$a);
	}
	function listComp(){
		$this->setval("req.tab","proj/comp");
		$a=array();
		$a=array_merge($a,readfiles("templates/proj/comp",".*tpl"));
		for ($i=0; $i<sizeof($a); ++$i)
			$a[$i]=strtr($a[$i],array(".tpl"=>""));
		$this->setval("articles",$a);
	}
	function listConf($t){
		if (!$this->user||$this->user->role>1)return $this->listProj();
		if (!class_exists($t)) return ;
		$this->setval("req.tab","conf/".$t);
		$obj=new $t();
		$this->setval("rec",$obj);
		$crit=new Criteria();
		//if (array_key_exists("tm",$obj))
		$crit->setOrder($obj->defaultOrder());
		$r=$this->dao->find($obj,null,$crit);
		if ($r===false) return ;
		for ($i=0; $i<sizeof($r); ++$i){
			$row=$r[$i]; reset($row);
			while (list($f,$v)=each($row)){
				if (strpos($f,"tm")!==false && preg_match("/^[1-9][0-9]{8,10}$/",$v))
					$row->{$f}=strftime("%Y-%m-%d %H:%M:%S",$v);
			}
		}
		$this->setval("result",$r);
	}
	function listMoto($t){
		$this->setval("req.tab","moto/".$t);
		$a=array();
		$a=array_merge($a,readfiles("moto/events/".$t,".*jpg"));
		$this->setval("pics",$a);
	}

	function newUserAction(){
		if (!$this->user||$this->user->role>1)return $this->listProj();
		$obj=new User();
		$this->setval("rec",$obj);
		$this->setval("req.tab","conf/editUser");
	}
	function editUserAction(){
		if (!$this->user||$this->user->role>1)return $this->listProj();
		$id=$this->getval("req.id");
		if (!$id)	return $this->listConf("User");
		$obj=new User();
		$r=$this->dao->find($obj,null,new Criteria("id",$id));
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return $this->listConf("User");
		}
		if (sizeof($r)<1){
			$this->addval("error","no that user");
			//printobj("srv",$this->getval("srv"));
			return $this->listConf("User");
		}
		//echo $this->dao->qstr();
		$this->setval("rec",$r[0]);
		$this->setval("req.tab","conf/editUser");
	}
	function saveUserAction(){
		if (!$this->user) return $this->listProj();
		$rec=$this->getval("req.rec");
		if ($this->user->role>1){
			if ($rec["id"]!=$this->user->id){
				$this->addval("error","operation not allowed");
				return $this->defaultAction();
			}
		}
		if (!$rec) return listConf("user");
		//printobj("save.rec",$rec);
		if (!empty($rec["passwd1"])) $rec["passwd"]=md5($rec["passwd1"]);

		$obj=new User();
		$obj->setValues($rec);
		$this->setval("rec",$obj);
		if (empty($obj->name)) {
			$this->addval("error","name cannot be empty");
			return ;
		}
		if (!$obj->passwd) $obj->passwd=null;
		if (!$obj->id) $obj->id=null;

		$r=$this->dao->save($obj);
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return ;
		}
		if ($this->user->id == $obj->id){
			$r=$this->dao->find($obj,null,new Criteria("id",$obj->id));
			$this->user=$r[0];
			$this->setval("user",$this->user);
		}
		return $this->defaultAction();
	}

	function listJokeAction(){
		$this->setval("req.tab","jokes");
		$crit=new Criteria();
		$obj=new Joke();
		$order=$this->getval("req.category");

		if (substr($order,0,3)=="by_") {
			$order=strtr(substr($order,3),array("_"=>" "));
			if (!preg_match("/^((rank)|(updatetm)|(votecnt)|( )|(desc))+$/",$order)){
				$this->addval("error","wrong category request");
				$order="upd desc,rank desc";
			}
		}
		else {$obj->category=$order; $order="upd desc,rank desc";}

		if ($obj->category) $crit->addop("category",$obj->category);
		$r=$this->dao->count($obj,$crit);
		if ($r===false) {$this->addval("error","DB:".$this->dao->errmsg());return;}
		$cnt=$r;
		$pgs=(int)(($cnt+ITEMS_ON_PAGE-1)/ITEMS_ON_PAGE);
		$pg=$this->getval("req.page")-1;
		if ($pg<0 || $cnt<ITEMS_ON_PAGE) $pg=0;
		else if ($pg>=$pgs) $pg=$pgs-1;
		$this->setval("req.page",$pg+1);

		$pages=array();
		if ($pg>0) $pages[]=array($pg,"prev");
		if ($pg<PAGES_LINKS/2) $p=0;
		else if ($pg+PAGES_LINKS/2>$pgs) $p=$pgs-PAGES_LINKS;
		else $p=(int)($pg-PAGES_LINKS/2);
		$pm=$p+PAGES_LINKS;
		if ($pm+1>$pgs && $pgs>PAGES_LINKS) $p=$pgs-PAGES_LINKS;
		//if ($p>0) $pages[1]="1";
		for (; $p<$pgs && $p<$pm; ++$p) {
			if ($p==$pg) $pages[]=array("",$p+1);
			else $pages[]=array($p+1,$p+1);
		}
		if ($p<$pgs) {
			$pages[]=array("","...");
			$pages[]=array($pgs,$pgs);
		}
		if ($pg+1<$pgs) $pages[]=array($pg+2,"next");
		$this->setval("pages",$pages);

		$offs=$pg*ITEMS_ON_PAGE;
		//24*3600=86400
		//updatetm=1329519654 2012-02-18 00:00:54  updatetm%(24*3600)=82854,
		$daysec=24*3600;
		$fld=array();
		$fld[]="*";
		if (strpos($order,"upd ")!==false||strpos($order,"upd,")!==false){
			$fld[]="round((updatetm-(updatetm+3600)%$daysec)/$daysec,0) as upd";
		}
		else if (strpos($order,"updatetm")===false){
			$order.=",updatetm desc";
		}
		$crit->setOrder($order);
		$crit->setLimit($offs.",".ITEMS_ON_PAGE);
		$r=$this->dao->find($obj,$fld,$crit);
		//$this->addval("info",$this->dao->qstr());
		if ($r===false) $this->addval("error","DB:".$this->dao->errmsg());
		else {
			$user=new User();
			for ($i=0; $i<sizeof($r); ++$i){
				$r[$i]->contents=nl2br(html_escape($r[$i]->contents));
				$u=$this->dao->find($user,null,new Criteria("id",$r[$i]->userid));
				$r[$i]->_user=$u[0];
			}
			$this->setval("offs",$offs);
			$this->setval("result",$r);
		}
		$this->jokeCategories();
	}
	function searchJokeAction(){
		$search=$this->getval("req.jokesearch");
		$jids=JokeIndex::search($this->dao,$search);
		if ($jids===false){
			if (!empty($search)) $this->addval("error","Search:".$this->dao->errmsg());
			return $this->listJokeAction();
		}
		if (sizeof($jids)==0) {
			$this->addval("warn","nothing found");
		}
		else {
			$words=$search;
			//$words=preg_split("/[^[:alpha:]]+/",$words);
			$words=preg_split("/[^_A-Za-z±¡æÆêÊ³£óÓ¶¦¼¬¿¯]+/",$words);
			$words=array_unique($words);

			$this->setval("req.tab","jokes");
			//result is ordered by match factor, can't build one criteria
			$r=array();
			$jtmp=new Joke();
			for ($i=0; $i<sizeof($jids); ++$i){
				$ji=$jids[$i];
				$rj=$this->dao->find($jtmp,null,new Criteria("id",$ji->jokeid));
				if ($rj!==false){
					$rj=$rj[0];
					$rj->_cnt=$ji->_cnt;
					$rj->contents=html_escape($rj->contents);
					$rj->contents=highlight($rj->contents,$search);
					$rj->contents=nl2br($rj->contents);
					$u=$this->dao->find($user,null,new Criteria("id",$rj->userid));
					$rj->_user=$u[0];
					$r[]=$rj;
				}
			}
			$jids=null;
		}
		$this->setval("result",$r);
		$this->jokeCategories();
	}
	function jokeCategories(){
		$r=$this->dao->db->tabfind("joke","category as name,category,count(*)as _cnt","group by category order by category");
		if ($r===false) $this->addval("error","DB:".$this->dao->errmsg());
		for ($cnt=0; list($i,$v)=each($r); ) {
			$cnt+=$v["_cnt"];
			if (checkEncoding($v["name"],"UTF-8")==false) {
				$v["name"]=iconv("ISO-8859-2","UTF-8",$v["name"]);
				$v["category"]=$v["name"];
			}
			$r[$i]=$v;
		}
		$this->setval("categorylist",$r);
		$r=array();
		$r[]=array("name"=>"Wszystkie","category"=>"","_cnt"=>$cnt);
		$r[]=null;
		$r[]=array("name"=>"Mocniejsze","category"=>"by_rank_desc");
		$r[]=array("name"=>"Słabsze","category"=>"by_rank");
		$r[]=array("name"=>"Nowsze","category"=>"by_updatetm_desc");
		$r[]=array("name"=>"Starsze","category"=>"by_updatetm");
		$r[]=array("name"=>"Popularne","category"=>"by_votecnt_desc");
		$this->setval("categorylist_ad",$r);
	}
	function jokeIndexAction(){
		if (!$this->user||$this->user->role>1) return $this->listJokeAction();
		$obj=new Joke();
		$this->dao->db->tabdrop("jokeindex");
		$this->initialize(); // create jokeindex table
		$r=$this->dao->find($obj);
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return $this->defaultAction();
		}
		for ($n=$ok=0; list($i,$v)=each($r); ++$n){
			if (JokeIndex::add($this->dao,$v)!==false) ++$ok;
			else $this->addval("error",$this->dao->errmsg());
		}
		unset($r);
		$this->addval("info","Indexed: ".$ok." of ".$n);
		$this->listJokeAction();
	}
	function _voteJokeAction(){
		if ($this->getval("robot")) return ;
		$rank=$this->getval("req.rank");
		if ($rank<1||$rank>5) {logstr("rank out of range");return ;}
		$rank=($rank-1)/4.0;
		$id=$this->getval("req.id");
		if (!$id)	{logstr("joke id missed");return ;}
		$obj=new Joke();
		$r=$this->dao->find($obj,null,new Criteria("id",$id));
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return ;
		}
		if (sizeof($r)!=1){
			$this->addval("error","wrong joke id");
			logstr("joke id=".$id." not found in DB");return ;
		}
		$obj=$r[0];
		if ($obj->rank<0) $obj->rank=0; else if ($obj->rank>1) $obj->rank=1;
		if (($cnt=$obj->votecnt)<5) $cnt=5;
		$s=$obj->rank*$cnt+$rank;
		$obj->rank=$s/($cnt+1);
		$obj->votecnt+=1;
		$r=$this->dao->save($obj);
		if ($r===false){ $this->addval("error","DB:".$this->dao->errmsg()); }
		$this->setval("voteid",$id);
	}
	function voteJokeAction(){
		$this->_voteJokeAction();
		$this->listJokeAction();
	}
	function deleteJokeAction(){
		if (!$this->user) return $this->listJokeAction();
		$id=$this->getval("req.id");
		if (!$id) return $this->listJokeAction();
		$obj=new Joke();
		$r=$this->dao->del($obj,new Criteria("id",$id));
		if ($r!==false) $this->dao->del(new JokeIndex(),new Criteria("jokeid",$id));
		$this->listJokeAction();
	}
	function newJokeAction(){
		if (!$this->user) return $this->listJokeAction();
		$obj=new Joke();
		$obj->userid=$this->user->id;
		$obj->rank=0.5; $obj->votecnt=1; //default
		$obj->category=$this->getval("req.category");
		if (substr($obj->category,0,3)=="by_") $obj->category=null;
		$this->setval("rec",$obj);
		$this->setval("req.tab","jokes/editJoke");
		$this->jokeCategories();
	}
	function editJokeAction(){
		if (!$this->user) return $this->listJokeAction();
		$id=$this->getval("req.id");
		if (!$id)	return $this->listJokeAction();
		$obj=new Joke();
		$r=$this->dao->find($obj,null,new Criteria("id",$id));
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return $this->listJokeAction();
		}
		if (sizeof($r)!=1){
			$this->addval("error","wrong id");
			return $this->listJokeAction();
		}
		$obj=$r[0];
		if ($this->user->role>1 && $obj->userid!=$this->user->id) {
			$this->addval("error","operation not allowed");
			return $this->listJokeAction();
		}

		$this->setval("req.category",$obj->category);
		$this->setval("rec",$obj);
		$this->setval("req.tab","jokes/editJoke");
		$this->jokeCategories();

		$obj=new JokeIndex();
		$r=$this->dao->find($obj,null,new Criteria("jokeid",$this->getval("req.id")));
		//$this->addval("info","q:".$this->dao->qstr());
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
		}
		$this->setval("jokeindex",$r);
	}
	function saveJokeAction(){
		$rec=$this->getval("req.rec");
		if (!$this->user || empty($rec["contents"])) return $this->listJokeAction();

		$rec["contents"]=trim($rec["contents"]);
		$obj=new Joke();
		$obj->setValues($rec);
		if (!$obj->id) {
			$obj->id=null;
			$obj->userid=$this->user->id;
			if (empty($obj->votecnt)) $obj->votecnt=1;
			if (empty($obj->rank)) $obj->rank=0.5;
		}
		else {
			if (!$obj->userid) $obj->userid=$this->user->id;
			if ($this->user->role>1) $obj->rank=null; //don't change rank
		}
		if ($obj->rank===null) ;
		else if (!is_numeric($obj->rank) || $obj->rank<0) $obj->rank=0.0;
		else if ($obj->rank>1) $obj->rank=1.0;

		if (!$obj->id && strpos($rec["contents"],"\n---")!==false){
			$c=strtr($rec["contents"],array("\r\n"=>"\n"));
			$jokes=explode("\n---",$c);
			$t0=time();
			//echo printobj("jokes:",$jokes);
			for ($i=0; $i<sizeof($jokes); ++$i){
				$obj->contents=trim($jokes[$i]);
				if (empty($obj->contents)) continue;
				$obj->id=null;
				$obj->updatetm=$t0-$i;
				$r=$this->dao->save($obj);
				if ($r===false){
					$this->addval("error","DB:".$this->dao->errmsg());
					return ;
				}
				JokeIndex::add($this->dao,$obj);
			}
		}
		else {
			if ($this->user->role>1 && $obj->userid!=$this->user->id) {
				$this->addval("error","access danied");
				return $this->listJokeAction();
			}
			$r=$this->dao->find($obj,null,new Criteria("id",$obj->id));
			if (is_array($r) && sizeof($r)>0) $old=$r[0]->contents; else $old="";
			if (!$obj->updatetm) $obj->updatetm=time();
			$r=$this->dao->save($obj);
			if ($r===false){
				$this->addval("error","DB:".$this->dao->errmsg());
				return ;
			}
			if ($old!=$obj->contents)
				JokeIndex::add($this->dao,$obj);
		}
		$this->setval("req.category",$obj->category);
		return $this->listJokeAction();
	}

	function proposeJokeAction(){
		if (!$this->checkForm("propose","rec.name")) return $this->listJokeAction();
		$rec=$this->getval("req.rec");
		if (empty($rec["contents"])) return $this->listJokeAction();
		$origuser=$this->user; $err=false;
		if (!$this->user){
			if (empty($rec["name"])) {$this->addval("error","Name must not be empty");$err=true;}
			if (empty($rec["email"])) {$this->addval("error","e-mail must not be empty");$err=true;}
			else if (!is_email($rec["email"])) {$this->addval("error","e-mail is invalid ".$rec["email"]);$err=true;}
			if ($err) return $this->listJokeAction();
			$crit=new Criteria();
			$crit->addop("name",$rec["name"],"=","or");
			$crit->addop("email",$rec["email"],"=","or");
			$r=$this->dao->find(new User(),null,$crit);
			if ($r===false) {$this->addval("error","DB:".$this->dao->errmsg());return ;}
			if (sizeof($r)==0){
				$user=new User();
				$user->setValues($rec);
				$user->id=null;
				$user->role=3;
				$user->passwd=null;
				logstr("proposeJoke: new user ".$user->name);
				$r=$this->dao->save($user);
				if ($r===false) {$this->addval("error","DB:".$this->dao->errmsg());return ;}
				$this->user=$user;
			}
			else if (sizeof($r)==1){
				$user=$r[0];
				logstr("proposeJoke: known user ".$user->name);
				if ($rec["name"]!=$user->name || $rec["email"]!=$user->email)
					$this->addval("error","Wrong user or e-mail/".sizeof($r));
				else $this->user=$user;
			}else {
				logstr("propose joke: wrong user ".$user->name);
				$this->addval("error","Wrong user or e-mail/".sizeof($r));
			}
		}
		if (!$this->user) return $this->listJokeAction();
		$this->saveJokeAction();
		$this->user=$origuser;
	}
	function saveCommentAction(){
		if (!$this->checkForm("comment","comment.name")) return $this->defaultAction();
		$rec=$this->getval("req.comment");
		$err=false;
		while (list($k,$v)=each($rec)) $rec[$k]=trim($v);
		$id=0;
		if (empty($rec["contents"])) {$this->addval("error","Comment must not be empty");$err=true;}
		else if ($this->user){
			$id=$this->user->id;
		}
		else{
			if (empty($rec["name"])) {$this->addval("error","Name must not be empty");$err=true;}
			if (empty($rec["email"])) {$this->addval("error","e-mail must not be empty");$err=true;}
			else if (!is_email($rec["email"])) {$this->addval("error","e-mail is invalid ".$rec["email"]);$err=true;}
			if ($err===false){
				$crit=new Criteria();
				$crit->addop("name",$rec["name"],"=","or");
				$crit->addop("email",$rec["email"],"=","or");
				$r=$this->dao->find(new User(),null,$crit);
				if ($r===false) {$this->addval("error","DB:".$this->dao->errmsg());$err=true;}
				else if (sizeof($r)==0){
					$user=new User();
					$user->setValues($rec);
					$user->id=null;
					$user->role=3;
					$user->passwd=null;
					$r=$this->dao->save($user);
					if ($r===false) {$this->addval("error","DB:".$this->dao->errmsg());$err=true;}
					else $id=$r;
				}
				else if (sizeof($r)==1){
					$user=$r[0];
					if ($rec["name"]!=$user->name || $rec["email"]!=$user->email)
						{$this->addval("error","Wrong user or e-mail/".sizeof($r));$err=true;}
					else $id=$user->id;
				}else {$this->addval("error","Wrong user or e-mail/".sizeof($r));$err=true;}
			}
		}

		if ($err===false) {
			$tab=$this->getval("req.tab");
			$c=new Comment();
			$c->userid=$id;
			$c->createtm=time();
			$c->updatetm=$c->createtm;
			$c->context=$this->getval("req.tab").":".$this->getval("req.article");
			$c->contents=$rec["contents"];
			$r=$this->dao->save($c);
			if ($r===false) {$this->addval("error","DB:".$this->dao->errmsg());$err=true;}
			sendmail("Comment ".$rec["email"],$rec["name"]."/".$c->context,"krzydyn@gmail.com",$c->contents);
		}
		if ($err) {
			$this->addval("error","Comment not added");
		}
		else {
			$this->addval("info","Comment added, must be approved");
			$this->setval("req.rec");
		}
		$this->defaultAction();
	}

	function listComments(){
		$crit=new Criteria();
		$crit->add("(approved>0 or createtm>".(time()-60).")");
		$crit->addop("context",$this->getval("req.tab").":".$this->getval("req.article"));

		$crit->setOrder("createtm");
		$r=$this->dao->find(new Comment(),null,$crit);
		//$this->addval("info",$this->dao->qstr());
		if ($r===false) $this->addval("error","DB:".$this->dao->errmsg());
		else {
			$user=new User();
			for ($i=0; $i<sizeof($r); ++$i){
				$r[$i]->contents=nl2br(html_escape($r[$i]->contents));
				$u=$this->dao->find($user,null,new Criteria("id",$r[$i]->userid));
				$r[$i]->_user=$u[0];
			}
		}
		$this->setval("comments",$r);
	}

	function sendSQLAction(){
		if (!$this->user || $this->user->role>1){
			$this->addval("error","operation not allowed");
			return ;
		}
		$sql=$this->getval("req.sql");
		if (empty($sql)) return ;
		$db=$this->dao->db;
		$sql=trim($sql);
		$r=$db->query($sql);
		if ($r===false){
			$this->addval("error","DB:".$db->errmsg());
			return ;
		}
		if (strpos($sql,"select")!==false){
			$a=array();
			while ($row=$r->fetch()) $a[]=$row;
			$r=$a;
		}
		else if (strpos($sql,"insert")!==false){
			$r=array("insertid: ".$db->insertid());
		}
		else $r=array("rows afected: ".$db->affected());
		$this->setval("sqlresult",$r);
		$this->defaultAction();
	}

	function loginAction(){
		setcookie("hash");
		if (!$this->checkForm("login","user")) return $this->defaultAction();
		$user=$this->getval("req.user");
		if (!$user) return $this->defaultAction();
		$p=md5($this->getval("req.passwd"));
		$this->setval("req.passwd");//remove from workspace
		$r=$this->dao->find(new User(),null,new Criteria(array("name"=>$user,"passwd"=>$p)));
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return $this->defaultAction();
		}
		if (sizeof($r)!=1){
			$this->addval("error","invalid username or passwd /".sizeof($r));
			return $this->defaultAction();
		}
		$this->user=$r[0];
		$ses=new Session();
		$ses->uid=$this->user->id;
		$ses->tmses=time();
		$ses->tmstamp=$ses->tmses;
		$ses->hash=md5($ses->uid.$ses->tmses);
		$r=$this->dao->insert($ses);
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return $this->defaultAction();
		}
		$this->ses=$ses;
		$this->setval("session",$this->ses);
		$this->setval("user",$this->user);
		$this->setval("cookie.hash",$this->ses->hash);
		setcookie("hash",$this->ses->hash);
		$this->addval("info","your are logged in");
		$this->defaultAction();
	}
	function logoutAction(){
		$this->setval("cookie.hash");
		setcookie("hash");
		if (!$this->user) return $this->defaultAction();
		if ($this->ses) $this->dao->del($this->ses);
		$this->ses=false;
		$this->user=false;
		$this->setval("session");
		$this->setval("user");
		$tab=$this->getval("req.tab");
		if (strpos($tab,"conf")!==false) $this->setval("req.tab",DEFAULT_TAB);
		else if (($i=strpos($tab,"/edit"))>0) $this->setval("req.tab",substr($tab,0,$i));
		$this->addval("info","your are logged out");
		$this->defaultAction();
	}
	function authenticate(){
		if (is_object($this->ses)) return true;
		$hash=$this->getval("cookie.hash");
		if (empty($hash)) return false;

		$this->setval("cookie.hash");
		$crit=new Criteria("hash",$hash);
		$r=$this->dao->find(new Session(),null,$crit);
		if (sizeof($r)==0){
			setcookie("hash");
			if ($this->getval("req.act")=="logout") return false;
			$this->addval("error","Invalid session key /".sizeof($r));
			return false;
		}
		//hash is unique key, so now must sizeof($r)=1
		$ses=$r[0];
		$tm=time();
		if ($ses->tmstamp+3600<$tm){
			setcookie("hash");
			$this->dao->del($ses);
			if ($this->getval("req.act")=="logout") return false;
			$this->addval("error","Session expired");
			return false;
		}
		$this->dao->db->tabdelete("session","where tmses<".($tm-24*3600));

		$ses->tmstamp=$tm;
		$this->dao->update($ses); //update timestamp
		$this->ses=$ses;
		$this->setval("cookie.hash",$this->ses->hash);
		setcookie("hash",$this->ses->hash);
		if ($ses->uid==0) return true; //no user for this session

		$crit->clear();
		$crit->addop("id",$ses->uid);
		$r=$this->dao->find(new User(),null,$crit);
		if (sizeof($r)!=1){
			$this->addval("error","Invalid user refference /".sizeof($r));
			setcookie("hash");return false;
		}
		$this->user=$r[0];
		$this->setval("user",$this->user);
		return true;
	}
	function suggestAction(){
		if (!$this->checkForm("suggest","suggest.subj")) return $this->defaultAction();
		$rec=$this->getval("req.suggest");
		$err=false;
		if (empty($rec["type"])) return $this->defaultAction();
		if (empty($rec["subj"])) {$this->addval("error","SUBJ must not be empty");$err=true;}
		if (empty($rec["msg"])) {$this->addval("error","TEXT must not be empty");$err=true;}
		if ($err===false) {
			$tab=$this->getval("req.tab");
			$qs=$this->getval("srv.QUERY_STRING");
			if (strstr($qs,"tab=")===false) $qs="tab=".$tab."&".$qs;
			$r=sendmail("KySoft ".$rec["type"],$rec["subj"],"krzydyn@gmail.com","Path:[".$qs."]\n".$rec["msg"]);
			if (!empty($r)) {$this->addval("error",$r);$err=true;}
		}
		if ($err) $this->addval("error","message not sent");
		else {
			$this->setval("req.suggest");
			$this->addval("info","Sugestia została wysłana!");
		}
		$this->defaultAction();
	}
	function checkForm($form,$fld){
		$test=$this->getval("req.test");
		if (empty($test)) {
			logstr("Form ".$form.".test: empty '".$test."'");
			$this->saveRobot(0,"form:".$form.".test empty");
			return 0;
		}
		$str=$this->getval("req.".$fld);
		$v=""; $l=strlen($str);
		for ($i=0; $i<$l; ++$i){
			$c=substr($str,$i,1);//(str,offs,len)
			$r=unpack("C",$c);$r=$r[1];
			if ($r<127) $v.=$c;
		}
		if ($test!=md5($v)) {
			logstr($form.".test('".$str."','".$v."'):".$test."!=".md5($v));
			$this->saveRobot(2,"test incorrect");
			return 0;
		}
		return 1;
	}

	function editRobotAction(){
		$this->setval("req.tab","conf/robot");
		if (!$this->user)return $this->defaultAction();
		$id=$this->getval("req.id");
		if (!$id) return $this->defaultAction();

		if ($this->user->role>1) {
			$this->addval("error","operation not allowed");
			return $this->defaultAction();
		}
		$obj=new Robot();
		$r=$this->dao->find($obj,null,new Criteria("addr",$id));
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return ;
		}
		if (sizeof($r)!=1){
			$this->addval("error","wrong id");
			return ;
		}
		$this->setval("rec",$r[0]);
		$this->setval("req.tab","conf/editRobot");
	}
	function checkRobot(){
		/*if ($addr=="91.207.8.26") $type=2;
		if ($addr=="94.23.1.28") $type=2;
		if ($addr=="70.99.206.242") $type=2;
		if ($addr=="203.166.46.36") $type=2;*/
		$str=$this->getval("srv.HTTP_USER_AGENT");
		if (strpos($str,"kysoft")>0) return ;
		$str=$this->getval("req.act");
		if ($str=="login") return ;
		$str=$this->getval("srv.REMOTE_ADDR");
		$r=$this->dao->find(new Robot(),null,new Criteria("addr",$str));
		if ($r!==false && sizeof($r)>0 && $r[0]->type>1) {
			$a=$r[0];
			$this->setval("robot",$a->type);
			$a->cnt+=1;
			$a->ua=$this->getval("srv.HTTP_USER_AGENT");
			$this->dao->update($a);
			return ;
		}
		$type=0; $msg="";
		$str=trim($this->getval("srv.HTTP_USER_AGENT"));
		if (!$str) $type=1;
		else if (stripos($str,"bot")!==false || stripos($str,"search")!==false) $type=1;
		else if (stripos($str,"crawl")!==false || stripos($str,"archive")!==false) $type=1;
		//else if (stripos($str,"http:")!==false) $type=1;
		else if (stripos($str,"lipperhey")!==false) $type=1;
		else if ($this->getval("req.act") && !$this->getval("srv.HTTP_REFERER"))
			{$msg="no ref";}
		if ($msg){
			$this->setval("robot",$type);
			$this->saveRobot(1,$msg);
		}
	}
	function saveRobot($type,$msg){
		$a=new Robot();
		$r=$this->dao->find($a,null,new Criteria("addr",$this->getval("srv.REMOTE_ADDR")));
		if ($r!==false && sizeof($r)>0){
			$a=$r[0];
			if ($a->type<0) $type=$a->type;
			else if ($type==0) ;
			else if ($type < $a->type) $type=$a->type;
			if ($type>0 && $a->cnt>10) $type=2;
		}
		$a->tm=time();
		$a->addr=$this->getval("srv.REMOTE_ADDR");
		$a->cnt+=1;
		$a->type=$type;
		$a->ua=$this->getval("srv.HTTP_USER_AGENT");
		if ($msg!=null) $a->msg=$msg;
		if (sizeof($r)>0) $this->dao->update($a);
		else $this->dao->insert($a);
	}
	function logreq(){
		$srv=$this->getval("srv");
		if (strpos($srv["HTTP_USER_AGENT"],"kysoft")>0) return ;
		if ($srv["HTTP_HOST"]=="localhost") return ;//script is on localhost
		$tm=time();
		$str=$tm."\t".date("H:i:s");
		if ($this->getval("robot")>1) $str.="\tABUSE";
		else if ($this->getval("robot")) $str.="\tROBOT";
		@$str.="\tA=".$srv["REMOTE_ADDR"];
		@$str.="\tRQ=".$srv["REQUEST_URI"];
		if (!$this->getval("robot")){
			@$str.="\tUA=".$srv["HTTP_USER_AGENT"];
			if (!$this->getval("robot")){
				$str.="\t?".http_build_str($this->getval("req"));
				@$ref=$srv["HTTP_REFERER"];
				if (!empty($ref))	$str.="\nREF=".$ref;
			}
		}
		logstr($str);
	}
}

?>
