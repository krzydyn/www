<?php
define('SINGULAR',0);
define('PLURAL',1);

define('MIAN',0); //Mianownik Nominative
define('DOPE',1); //Dopelniacz Genetive
define('CELO',2); //Celownik Dative
define('BIER',3); //Biernik Accusative
define('NARZ',4); //Narzednik Instrumental
define('MIEJ',5); //Miejscownik Locative
define('WOLA',6); //Wolacz Vocative

// declination definition
$decl_info=array(
	//					M     D     C      B     N       Msc     W
	//    			kto   kogo  komu   kogo  kim     o kim   O!
	//					co    czego czemu  co    czym    o czym  O!

	//ania
	"(.*)ia"=> array("\$1ia","\$1i","\$1ie","\$1iê","\$1i±","\$1ie","\$1iu",
							"\$1ie","\$1","\$1iom","\$1ie","\$1iami","\$1iach","\$1ie"),
	//alicja
	"(.*)ja"=> array("\$1ja","\$1ji","\$1ji","\$1jê","\$1j±","\$1ji","\$1ja",
							"\$1je","\$1yj","\$1jom","\$1ji","\$1jami","\$1jach","\$1ji"),
	//anka
	"(.*)ka"=> array("\$1ka","\$1ki","\$1ce","\$1kê","\$1k±","\$1ce","\$1ko",
							"\$1ki","\$1ek","\$1kom","\$1ki","\$1kami","\$1kach","\$1ki"),
	"æma"=> array("æma","æmy","æmie","æmê","æm±","æmie","æmo",
							"æmy","ciem","æmom","æmy","æmami","æmach","æmy"),
	//marta
	"(.*)ta"=> array("\$1ta","\$1ty","\$1cie","\$1tê","\$1t±","\$1cie","\$1to",
							"\$1ty","\$1t","\$1tom","\$1ty","\$1tami","\$1tach","\$1ty"),
	//papa
	"(.*)a"=> array("\$1a","\$1y","\$1ie","\$1ê","\$1±","\$1ie","\$1o",
							"\$1y","\$1","\$1om","\$1y","\$1ami","\$1ach","\$1y"),
	"(.*)±c"=> array("\$1±c","\$1±ca","\$1±cowi","\$1±ca","\$1±cem","\$1±cu","\$1",
							"\$1±ce","\$1êcy","\$1±com","\$1êcy","\$1±cami","\$1±cach","\$1±ce"),
	//android
	"(.*id)"=> array("\$1","\$1a","\$1owi","\$1","\$1em","\$1zie","\$1",
							"\$1y","\$1ów","\$1om","\$1y","\$1ami","\$1ach","\$1y"),
	//b³¹d
	"(.*d)"=> array("\$1","\$1u","\$1owi","\$1","\$1em","\$1zie","\$1",
							"\$1y","\$1ów","\$1om","\$1y","\$1ami","\$1ach","\$1y"),
	"(.*)nie"=> array("\$1nie","\$1nia","\$1niu","\$1nie","\$1niem","\$1niu","\$1ni",
							"\$1nia","\$1ñ","\$1niom","\$1nia","\$1niami","\$1niach","\$1nia"),
	"(.*g)"=> array("\$1","\$1a","\$1owi","\$1","\$1iem","\$1u","\$1",
							"\$1i","\$1ów","\$1om","\$1i","\$1ami","\$1ach","\$1i"),
	"(.*)ch"=> array("\$1ch","\$1cha","\$1chowi","\$1ch","\$1chem","\$1chu","\$1ch",
							"\$1chy","\$1chów","\$1chom","\$1chy","\$1chami","\$1chach","\$1chy"),
	//rodzaj
	"(.*)j"=> array("\$1j","\$1ju","\$1jowi","\$1j","\$1jem","\$1ju","\$1j",
							"\$1je","\$1jów","\$1jom","\$1je","\$1jami","\$1jach","\$1je"),
	"(rok)"=>array("\$1","\$1u","\$1owi","\$1","\$1em","\$1u","\$1",
							"lata","lat","latom","lata","latami","latach","lata"),
	"(.*)ek"=>array("\$1ek","\$1ku","\$1kowi","\$1ka","\$1kiem","\$1ku","\$1ek",
							"\$1ki","\$1ków","\$1kom","\$1ki","\$1kami","\$1kach","\$1ki"),
	"(.*k)"=> array("\$1","\$1u","\$1owi","\$1","\$1em","\$1zie","\$1",
							"\$1i","\$1ów","\$1om","\$1i","\$1ami","\$1ach","\$1i"),
	"(.*)³o"=>array("\$1³o","\$1³a","\$1³u","\$1³o","\$1³em","\$1le","\$1³o",
							"\$1³a","\$1e³","\$1³om","\$1³a","\$1³ami","\$1³ach","\$1³a"),
	"(.*)to"=>array("\$1to","\$1ta","\$1tu","\$1to","\$1tem","\$1cie","\$1to",
							"\$1ta","\$1t","\$1tom","\$1ta","\$1tami","\$1tach","\$1ta"),
	"(.*)o"=>array("\$1o","\$1a","\$1u","\$1o","\$1em","\$1ie","\$1o",
							"\$1a","\$1e³","\$1om","\$1a","\$1ami","\$1ach","\$1a"),
	"(.*er)"=>array("\$1","\$1a","\$1owi","\$1","\$1em","\$1ze","\$1",
							"\$1y","\$1ów","\$1om","\$1y","\$1ami","\$1ach","\$1y"),
	"(.*)t"=> array("\$1t","\$1ta","\$1towi","\$1ta","\$1tem","\$1cie","\$1t",
							"\$1ty","\$1tów","\$1tom","\$1ty","\$1tami","\$1tach","\$1ty"),
	"(.*)y"=> array("\$1y","\$1ego","\$1emu","\$1ego","\$1ym","\$1ym","\$1y",
							"\$1e","\$1ych","\$1ym","\$1e","\$1ymi","\$1ych","\$1e"),
	"(.*ysz)"=> array("\$1","\$1y","\$1y","\$1ê","\$1±","\$1y","\$1o",
							"\$1e","\$1y","\$1om","\$1e","\$1ami","\$1ach","\$1e"),
	"(.*sz)"=> array("\$1","\$1a","\$1owi","\$1","\$1em","\$1u","\$1",
							"\$1e","\$1y","\$1om","\$1e","\$1ami","\$1ach","\$1e"),
	"(.*d)zieñ"=> array("\$1zieñ","\$1ni","\$1niowi","\$1","\$1niem","\$1niu","\$1niu",
							"\$1ni","\$1ni","\$1niom","\$1nie","\$1niami","\$1niach","\$1ni"),
	"(.*)ñ"=> array("\$1ñ","\$1ni","\$1niowi","\$1","\$1niem","\$1niu","\$1niu",
							"\$1nie","\$1ni","\$1niom","\$1nie","\$1niami","\$1niach","\$1ni"),

	// this have to be last entry
	"(.*)"=> array("\$1","\$1a","\$1owi","\$1","\$1em","\$1ie","\$1",
							"\$1y","\$1ów","\$1om","\$1y","\$1ami","\$1ach","\$1y")
);

function decline($name,$d,$p)
{
	global $decl_info;
	if ($d < 0 || $d > 6) return "decline($name,$d,$p):wrong_d$d";
	if ($p < 0 || $p > 1) return "decline($name,$d,$p):wrong_p$p";
	reset($decl_info);
	$v="";
	while (list($patt,$val)=each($decl_info))
	{
		$patt="/^".$patt."$/i";
		if (preg_match($patt,$name))
		{
			//logstr("matched pattern: $patt on $name");
			$v=preg_replace($patt,$val[7*$p+$d],$name); break;
		}
	}
	return $v?$v:"$name-??";
}
function numbered($name,$cnt)
{
	$cnt=(int)$cnt;
  if ($cnt==1) return decline($name,MIAN,SINGULAR);
  $cnt%=100;
  if ($cnt > 10 && $cnt < 21) return decline($name,DOPE,PLURAL);
	$cnt%=10;
  if ($cnt > 1 && $cnt < 5) return decline($name,MIAN,PLURAL);
  return decline($name,DOPE,PLURAL);
}
function number2text($n)
{
	$n=(int)$n;
	//logstr("number2text($n)");
	$d0=array("zero","jeden","dwa","trzy","cztery",
		"piêæ","sze¶æ","siedem","osiem","dziewiêæ",
		"dziesiêæ","jedena¶cie","dzwna¶cie","trzyna¶cie","czterna¶cie",
		"piêtna¶cie","szesna¶cie","siedemna¶cie","osiemna¶cie","dziewiêtna¶cie");
	$d10=array("dwadzie¶cia","trzydzie¶ci","czterdzie¶ci","piêædziesi±t",
		"sze¶ædziesi±t","siedemdziesi±t","osiemdziesi±t","dziewiêædziesi±t");
	$d100=array("sto","dwie¶cie","trzysta","czterysta","piêæset","sze¶æset",
		"siedemset","osiemset","dziewiêæset");
	if ($n < 20) $t=$d0[$n];
	else if ($n < 100)
	{
		$t=$d10[$n/10-2]; $n%=10;
		if ($n) $t.=" ".$d0[$n%10];
	}
	else if($n < 1000)
	{
		$t=$d100[$n/100-1];  $n%=100;
		if ($n) $t.=" ".number2text($n);
	}
	else if ($n < 1000000)
	{
		$t=number2text($n/1000)." ".numbered("tysi±c",$n/1000); $n%=1000;
		if ($n) $t.=" ".number2text($n);
	}
	else
	{
		$t=number2text($n/1000000)." ".numbered("milion",$n/1000000); $n%=1000000;
		if ($n) $t.=" ".number2text($n);
		//return $n;
	}
	return $t;
}
function amount2text($a)
{
	$t=number2text($a/100)." ".numbered("z³oty",$a); $a%=100;
	$t.=" i ".number2text($a)." ".numbered("grosz",$a);
	return $t;
}

/*
function translate($to,$from,$str)
{
	$charset=array(
		"ISO8859-1"=>"AaCcEeLlNnOoSsZzZz-\" ",
		"ISO8859-2"=>"\xa1\xb1\xc6\xe6\xca\xea\xa3\xb3\xd1\xf1\xd3\xf3\xa6\xb6\xaf\xbf\xac\xbc-\" ",
		"WIN1250"  =>"\xa5\xb9\xc6\xe6\xca\xea\xa3\xb3\xd1\xf1\xd3\xf3\x8c\x9c\xaf\xbf\x8f\x9f\x96\x84\xa0",
		"to-WIN1250"  =>"\xa5\xb9\xc6\xe6\xca\xea\xa3\xb3\xd1\xf1\xd3\xf3\x8c\x9c\xaf\xbf\x8f\x9f-\" "
	);
	$from=$charset[$from];
	if (!($to=$charset["to-$to"]))
		$to=$charset[$to];
	if (!$from || !$to) return $str;
  return strtr($str,$from,$to);
}
*/
?>
