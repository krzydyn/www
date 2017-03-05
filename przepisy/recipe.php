<?
require_once("config.php");
require_once($config["cmslib"]."modules.php");
require_once($config["cmslib"]."application.php");
require_once($config["cmslib"]."model.php");

//javascript:document.body.contentEditable=true;document.designMode='on';void 0
class Session extends ModelObject
{
	var $uid;
	var $hash;
	var $host;
	var $tmses;
	var $tmstamp;
	var $sesdata;
	function getPK(){return array("uid","hash");}

	function __wakeup()
	{
	}
	function __sleep()
	{
		return array_keys(get_object_vars($this));
	}
}
class User extends ModelObject
{
	var $id;
	var $name;
	var $passwd;
	var $role;
	var $fullname;
	var $email;
	function toString(){return $this->fullname!==null?$this->fullname:$this->name;}
}
class Recipe extends ModelObject
{
	var $id;
	var $userid;
	var $name;
	var $icon;
	var $author;
	var $category;
	var $type;
	var $_ingredients;
	var $time;
	var $calority;
	var $difficulty;
	var $contents;

	function &getSearchableFields()
	{
		$a=array();
		$fld=get_object_vars($this);
		while (list($f,$v)=each($fld))
		{
			if (substr($f,0,1)=="_"||$f=="id"||$f=="icon") continue; //internal field
			$a[]=$f;
		}
		return $a;
	}
}

class RecipeApp extends Application
{
	var $dao;
	var $ses;
	var $user;
	function initialize() {
		$db=DB::connectDefault();
		$this->dao=&new ObjectDB($db);
		$this->ses=null;
		$this->user=null;

		$reqtabs=array(
			"session"=>"uid int not null,hash varchar(80) not null,host varchar(63),tmses int,tmstamp int,".
				"sesdata text,unique(uid,hash)",
			"user"=>"id integer primary key,name varchar(63) not null,role int not null default 2,passwd varchar(32)not null default '',".
				"fullname varchar(255)not null default '',email varchar(255)not null default '',unique(name)",
			"recipe"=>"id integer primary key,userid int not null,name varchar(255) not null default '',icon varchar(255) not null default '',".
				"author varchar(255) not null default '',category varchar(100) not null default '',type varchar(100) not null default '',
				time integer not null default 0,calority integer not null default 0,".
				"difficulty integer not null default 0,contents text not null default ''",
		);
		$tabs=$db->tables();
		if ($tabs===false)
		{
			$this->addval("error","DB:".$db->errmsg());
			return false;
		}
		while (list($t,$v)=each($reqtabs))
		{
			if (in_array($t,$tabs)) continue;
			$r=$db->tabcreate($t,$v);
			if ($r===false) {$this->addval("error","DB:".$db->errmsg());return false;}
		}
		if ($db->tabcount("user")==0)
		{
			$r=$db->tabinsert("user",array("name"=>"admin","role"=>"0","passwd"=>md5("admin")));
			if ($r===false) $this->addval("error","DB:".$db->errmsg());
			$r=$db->tabinsert("user",array("name"=>"krzydyn","role"=>"1","passwd"=>md5("test")));
			if ($r===false) $this->addval("error","DB:".$db->errmsg());
		}
	}
	function getSession() {return $this->ses;}
	function getUser() {return $this->user;}

	function process(){
		$this->authenticate();
		parent::process();
	}

	function defaultAction(){
		if ($this->getval("req.recid"))
		{
			$this->setval("req.act","recipe");
			$this->showRecipeAction();
		}
		else
		{
			$this->setval("req.act","recipes");
			$this->recipesAction();
		}
	}
	function recipesAction() {
		$crit=new Criteria();
		$obj=&new Recipe();
		$this->setval("req.view","list");
		if ($s=$this->getval("req.name")) $this->setval("req.search",$s);
		else $s=$this->getval("req.search");
		if (!empty($s)){
			$crit->addfv("search","%".$s."%");
			$crit->add("name||category||contents like #search");
		}
		$pages=array();
		$cnt=$this->dao->count($obj,$crit);
		$pg=$this->getval("req.page")-1;
		if ($pg<0 || $cnt<10) $pg=0;
		else if ($pg*10>=$cnt) {$pg=(int)($cnt/10)-1;$this->setval("req.page",$pg+1);}
		$i=$pg-5;
		if (($i+10)*10>$cnt) $i=(int)(($cnt+9)/10)-10;
		if ($i<0) $i=0;
		for ($i*=10; $i<$cnt && sizeof($pages)<10; $i+=10) $pages[]=(int)($i/10)+1;
		$offs=$pg*10;
		$this->setval("rec",$obj);
		$this->setval("count",$cnt);
		$this->setval("pages",$pages);
		$this->setval("offs",$offs);
		$crit->setLimit("$offs,10");
		$crit->setOrder("name");
		$r=$this->dao->find($obj,null,$crit);
		if ($r===false) $this->addval("error","DB:".$this->dao->errmsg());
		else $this->setval("result",$r);
		//printobj("res",$r);
	}
	function advrecipesAction()
	{
		$this->setval("req.view","advsearch");
		if ($n=$this->getval("req.search")) $this->setval("req.name",$n);
		$this->setval("result",new Recipe());
	}
	function showRecipeAction()
	{
		if ($this->user) $this->setval("req.view","edit");
		else $this->setval("req.view","show");
		$r=$this->dao->find(new Recipe(),null,new Criteria(array("id"=>$this->getval("req.id"))));
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return $this->recipesAction();
		}
		if (sizeof($r)==0)
		{
			$this->addval("error","Recipe not exist");
			return $this->recipesAction();
		}
		$this->setval("rec",$r[0]);
	}
	function addRecipeAction()
	{
		$this->setval("req.view","edit");
		if ($this->getUser())
		{
			$obj=&new Recipe();
			$obj->userid=$this->getUser()->id;
			$obj->author=$this->getUser()->fullname;
			$obj->type="polska";
			$obj->time=15;
			$obj->difficulty=2;
			if (empty($obj->author)) $obj->author=$this->getUser()->name;
			$this->setval("rec",$obj);
		}
		else $this->recipesAction();
	}
	function saveRecipeAction() {
		$user=$this->getUser();
		$rec=$this->getval("req.rec");
		if ($user!=null && $rec!=null) {
			$this->setval("req.view","edit");
			$obj=&new Recipe();
			$obj->setValues($rec);
			if (!$obj->id) $obj->id=null;
			if (!$obj->userid) $obj->userid=$user->id;

			if ($user->role>1 && $obj->userid!=$user->id){
				$this->addval("error","you are not allowed");
				return ;
			}
			//printobj("save",$obj);
			$r=$this->dao->save($obj);
			if ($r===false)
			{
				$this->addval("error","DB:".$this->dao->errmsg());
				$this->setval("req.view","edit");
				return ;
			}
		}
		$this->recipesAction();
	}
	function deleteRecipeAction()
	{
		$rec=$this->getval("req.rec");
		if (!$this->getUser()) return $this->recipesAction();

		$obj=&new Recipe();
		$obj->setValues($rec);
		//printobj("del",$obj);
		$r=$this->dao->del($obj);
		if ($r===false)
		{
			$this->addval("error","DB:".$this->dao->errmsg());
			return ;
		}
		$this->recipesAction();
	}
	function usersAction()
	{
		if (!$this->getUser()) return $this->recipesAction();
		if ($this->getUser()->role>1) return $this->recipesAction();
		$this->setval("req.view","userlist");
		$obj=&new User();
		$this->setval("rec",$obj);
		$r=$this->dao->find($obj);
		if ($r===false) $this->addval("error","DB:".$this->dao->errmsg());
		else $this->setval("result",$r);
	}
	function showUserAction()
	{
		if (!$this->user) return $this->recipesAction();
		$this->setval("req.view","useredit");
		$id=$this->getval("req.id");
		if ($this->getUser()->role>1 && $this->getUser()->id!=$id)
			return $this->recipesAction();

		$r=$this->dao->find(new User(),null,new Criteria("id",$id));
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return $this->usersAction();
		}
		if (sizeof($r)<1){
			$this->addval("error","no that user");
			return $this->usersAction();
		}
		//echo $this->dao->qstr();
		$this->setval("rec",$r[0]);
	}
	function addUserAction()
	{
		if (!$this->user) return $this->recipesAction();
		$this->setval("req.view","useredit");
		$obj=&new User();
		$obj->role=$this->getUser()->role;
		$this->setval("rec",$obj);
	}
	function saveUserAction() {
		if (!$this->user) return $this->recipesAction();
		$rec=$this->getval("req.rec");
		//verify if current user->role can modify this record
		if ($this->user->role>1){
			if ($rec["id"]!=$this->user->id){
				$this->addval("error","operation not allowed");
				return $this->defaultAction();
			}
		}
		if (!$rec) return $this->usersAction();
		if (empty($rec["name"])) {
			$this->addval("error","name cannot be empty");
			return ;
		}
		if (!empty($rec["passwd1"])) $rec["passwd"]=md5($rec["passwd1"]);

		$obj=&new User();
		$obj->setValues($rec);
		$this->setval("rec",$obj);
		if (!$obj->passwd) $obj->passwd=null;
		if (!$obj->id) { // add new user
			$obj->id=null;
		} else { //update existing user
			$r=$this->dao->find($obj,null,new Criteria("id",$id));
			$obj->role=$this->getUser()->role;
		}
		if ($obj->role<$this->getUser()->role){
			$this->addval("error","you have no right to do this (chg role)");
			return ;
		}

		if ($this->user->id == $obj->id){
			$r=$this->dao->find($obj,null,new Criteria("id",$obj->id));
			$this->user=$r[0];
			$this->setval("user",$this->user);
		}

		$r=$this->dao->save($obj);
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return ;
		}
		if ($this->user->id == $obj->id){
			//$r=$this->dao->find($obj,null,new Criteria("id",$obj->id));
			//$this->user=$r[0];
			$this->user=$obj;
			$this->setval("user",$this->user);
		}
		$this->usersAction();
	}
	function deleteUserAction()
	{
		$rec=$this->getval("req.rec");
		if (!$this->getUser() || !$rec) return $this->recipesAction();
		//verify if current user->role can modify this record
		if ($this->getUser()->role>1)
		{
			$this->addval("error","you have no right to do this (delete)");
			return $this->searchUserAction();
		}
		$obj=&new User();
		$obj->setValues($rec);
		//printobj("del",$obj);
		$r=$this->dao->del($obj);
		if ($r===false) {$this->addval("error","DB:".$this->dao->errmsg());return ;}
		$this->searchUserAction();
	}

	function loginAction(){
		setcookie("hash");
		$this->setval("req.view","login");
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
		$this->user=&$r[0];
		$ses=&new Session();
		$ses->uid=$this->user->id;
		$ses->tmses=time();
		$ses->tmstamp=$ses->tmses;
		$ses->hash=md5($ses->uid.$ses->tmses);
		$r=$this->dao->insert($ses);
		if ($r===false){
			$this->addval("error","DB:".$this->dao->errmsg());
			return $this->defaultAction();
		}
		$this->ses=&$ses;
		$this->setval("session",$this->ses);
		$this->setval("user",$this->user);
		$this->setval("req.hash",$this->ses->hash);
		setcookie("hash",$this->ses->hash);
		$this->addval("info","your are logged in");
		$this->defaultAction();
	}
	function logoutAction(){
		setcookie("hash");
		if (!$this->user) return $this->defaultAction();
		if ($this->ses) $this->dao->del($this->ses);
		$this->setval("req.hash");
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
		if (is_object($this->ses)) {
			logstr("ses is obj");
			return true;
		}
		$hash=$this->getval("req.hash");
		if (empty($hash)) {
			logstr("hash is empty");
			return false;
		}
		logstr("hash is $hash");

		$this->setval("req.hash");
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
		$this->ses=&$ses;
		setcookie("hash",$this->ses->hash);
		$this->setval("req.hash",$this->ses->hash);
		if ($ses->uid==0) return true; //no user for this session

		$crit->clear();
		$crit->addop("id",$ses->uid);
		$r=$this->dao->find(new User(),null,$crit);
		if (sizeof($r)!=1){
			$this->addval("error","Invalid user refference /".sizeof($r));
			setcookie("hash");return false;
		}
		$this->user=&$r[0];
		$this->setval("user",$this->user);
		return true;
	}
}
?>
