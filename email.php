<?
require_once("Mail.php");

require_once("config.php");
require_once($config["cmslib"]."modules.php");

function is_email_v1($str){
	$re="\w+([.+-]\w+){0,4}@\w+([.-]\w+){1,3}";
	if (preg_match("/^".$re."$/i",$str)) return 1;
	return 0;
}

function is_email($str){
	$re="\w+([.+-]\w+){0,4}@\w+([.-]\w+){1,3}";       //simple match
	$quoted="\"[\w+-. ]+\"@\w+([.-]\w+){1,3}";        //match quoted
	$lc="\w,!#$%&'*+\-\/=?^_`{|}~";                   //local-part (before @) chars
	$other="[$lc]+(\.[$lc]+){0,4}@\w+([.-]\w+){1,9}"; //other syntactically valid
	if (preg_match("/^".$re."$/i",$str)) return 1;
	if (preg_match("/^".$quoted."$/i",$str)) return 2;
	if (preg_match("/^".$other."$/i",$str)) return 3;
	return 0;
}

function sendmail($from,$subj,$recipients,$body){
	if (!$recipients) return "No recipients";
	$user="biuro@kysoft.pl";
	$params["host"] = "mail.active24.pl";
	$params["port"] = 25;
	$params["auth"] = true;
	$params["username"] = $user;
	$params["password"] = "misio2";
	$m = Mail::factory("smtp", $params);
	if (PEAR::isError($m)) return $m->getMessage();
	$headers["Subject"] = $subj;
	if ($from!=$user){
		$headers["From"] = "\"".$from."\""." <".$user.">";
		$headers["Reply-To"] = $headers["From"];
		$headers["Return-Path"] = $user;
		$headers["Errors-To"] = $user;
		//printobj("headers",$headers);
	} else $headers["From"] = $user;
	$headers["Content-Type"] ="text/plain; charset=UTF-8";
	$r = $m->send($recipients, $headers, $body);
	if (PEAR::isError($r)===true) return $r->getMessage();
	return "";
}

/*

require_once 'Mail.php';

$params['host'] = 'mail.active24.pl';
$params['port'] = 25;
$params['auth'] = true;
$params['username'] = 'nazwa@nazwa.twojej.domeny';
$params['password'] = 'haslo';

# naglowki
$headers['Subject'] = 'temat_wiadomosci';
$headers['From'] = 'nazwa@nazwa.twojej.domeny';
$headers['X-Abuse-To'] = 'abuse@nazwa.twojej.domeny';
$headers['Content-Type'] ='text/plain; charset=ISO-8859-2';
$body = 'tresc wiadomosci';

# do jednego adresata
$recipients = 'odbiorca';

$mail = Mail::factory('smtp', $params);
if (PEAR::isError($mail)) {
        print $mail->getMessage();
	} else {
		$error = $mail->send($recipients, $headers, $body);
		if (PEAR::isError($error)) {
			print $error->getMessage();
		} else {
			print 'KOMUNIKAT: e-mail zostal wyslany poprawnie!';
		}
}
*/
?>
