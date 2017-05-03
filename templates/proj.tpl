<table class="multcol"><tr>
<% $cernlogo=rand(0,10)>5?"cern-green.jpg":"cern-blue2.jpg"%>
<%if(val("req.lang")=="en"){%>
<td>
<a class="post" href="?tab=proj/java">
<img class="icon" src="proj/java/j+c.png" alt="JAVA/C++" height="40px"/>
<b>Java and C/C++</b><br>Libraries and some code
</a>

<a class="post" href="?tab=proj/php">
<img class="icon" src="proj/php/php.png" alt="PHP" height="40px"/>
<b>PHP/HTML</b><br>Tips & tricks (sources)
</a>

<a class="post" href="?tab=proj/dubna">
<img class="icon" src="proj/dubna/jinr.jpg" alt="JINR" height="70px"/>
<b>Dubna</b>Joint Institute of Nuclear Research</a>

<a class="post" href="?tab=proj/cern">
<img class="icon" src="proj/cern/<%$cernlogo%>" alt="CERN/NA61" height="80px"/>
<b>Monitoring &amp; Control Systems</b> for NA61/Shine experiment at European Organization for Nuclear Research <b>CERN</b>.</a>

<a class="post" href="?tab=proj/labsk">
<img class="icon" src="proj/fiz/wfpw.gif" alt="LAB/SK" height="80px"/>
<b>Labolatory of Computer Networks</b> Phisics Department on WUT</a>

<a class="post" href="?tab=proj/pan">
<img class="icon" src="proj/pan/ippt.png" alt="IPPT PAN" height="80px"/>
<b>Ultrasonic scanning microscope</b> devloped at Institute of Fundamental Technological Research
on Polish Academy of Sciences <b>IPPT PAN</b>.</a>

<a class="post" href="?tab=proj/spc">
<img class="icon" src="proj/spc/logo.jpg" alt="SPC" height="100px"/>
<b>Heat Measurement System</b> for Warsaw power plant - <b>EC Kawęczyn</b>.</a>

</td><td>
<a class="post" href="?tab=proj/comp">
<img class="icon" src="proj/comp/logo.png" alt="Computers" height="70px"/>
Computers & smartphones
</a>

<a class="post" href="?tab=moto/dynoiler">
<img class="icon" src="moto/oiler/cbr600/sterownik.jpg" alt="oiler" width="100px"/>
<b>Motorbike&nbsp;oiler</b>&nbsp;(motooiler,dynoiler)<br/>
Oiler is designed to replace the troublesome (and quite expensive) use of spray.
</a>

<div><b>Monitoring &amp; navigation</b></div>
<div class="post">
Monitoring system working with IP cameras<br>
Navigation on mobile phones with Java support<br>
</div>

<div><b>Network applications</b></div>
<div class="post">
Tunneling UDP over TCP<br>
Tunneling TCP over TCP<br>
</div>

<div><b>Banking &amp; payments</b></div>
<div class="post">
Termial applications EFT POS ("embeded system")
<ul>
<li>client identification for KredyBank, BGŻ</li>
<li>payment for eService,PolCard,Pekao,Auchan,Rossman</li>
<li>payment parkomat for Polskie Porty Lotnicze</li>
<li>prepaid for Lew,Agadka</li>
<li>multi-platform programing library <b>MultiX</b></li>
</ul>
Server applications
<ul>
<li>Terminal Managnet System TMS for Agadka,OPDF</li>
<li>prepaid codes distributing server for Agadka</li>
<li>authorisation system <b>MAAS</b> for Auchan/Lukas Bank</li>
<li>authorisation emulators (Base24, Postilion, protocols: Apacs30/40, ISO8583, SPDH)</li>
</ul>
</div>
<div><b>Cryptography</b></div>
<a class="post" href="#">
Symetric algorithms (DES,3DES)<br>
Asymetric algorithms (RSA)<br>
Hash functions (CRC16,CRC32,SHA1,SHA2,MD5)<br>
Cryptographic keys diversification (Apacs,Dukpt:X9.24-1997,Dukpt:X9.24-2004)
</a>
</td>

<%}else{%>

<td>
<a class="post" href="?tab=proj/java">
<img class="icon" src="proj/java/j+c.png" alt="JAVA/C++" height="40px"/>
<b>Java i C/C++</b><br>Biblioteki i trochę kodu
</a>

<a class="post" href="?tab=proj/php">
<img class="icon" src="proj/php/php.png" alt="PHP" height="40px"/>
<b>PHP/HTML</b><br>Przykłady i triki (źródła)
</a>

<a class="post" href="?tab=proj/dubna">
<img class="icon" src="proj/dubna/jinr.jpg" alt="JINR" height="70px"/>
<b>Dubna</b></a>

<a class="post" href="?tab=proj/cern">
<img class="icon" src="proj/cern/<%$cernlogo%>" alt="CERN/NA61" height="80px"/>
<b>Systemy Kontrolno-Pomiarowe</b> dla NA61/Shine w Europejskiej Organizacji Badañ Jądrowych <b>CERN</b>.</a>

<a class="post" href="?tab=proj/labsk">
<img class="icon" src="proj/fiz/wfpw.gif" alt="LAB/SK" height="80px"/>
<b>Labolatorium Sieci Komputerowych</b> zajęcia na Wydziale Fizyki PW</a>

<a class="post" href="?tab=proj/pan">
<img class="icon" src="proj/pan/ippt.png" alt="IPPT PAN" height="80px"/>
<b>Mikroskop ultradźwiękowy</b> zbudowany w Instytucie Podstawowych Problemów Techniki
na Polskiej Akademii Nauk <b>IPPT PAN</b>.</a>

<a class="post" href="?tab=proj/spc">
<img class="icon" src="proj/spc/logo.jpg" alt="SPC" height="100px"/>
<b>System Pomiaru Ciepła</b> dla Ektrociepłowni Kawęczyn</a>

</td><td>
<a class="post" href="?tab=proj/comp">
<img class="icon" src="proj/comp/logo.png" alt="Komputery" height="70px"/>
Komputery i smartfony
</a>
<a class="post" href="?tab=moto/dynoiler">
<img class="icon" src="moto/oiler/cbr600/sterownik.jpg" alt="olejarka" width="100px"/>
<b>Olejarka&nbsp;motocyklowa</b> motooiler,dynoiler<br>
Olejarka zastępuje uciążliwe (i<sp:/>dość drogie) smary w&nbsp;spray-u.</a>

<div><b>Monitoring i nawigacja</b></div>
<div class="post">
System monitorowania obiektu w oparciu o kamery IP<br>
Aplikacja nawigacji GPS na telefony komórkowe (Java)<br>
</div>

<div><b>Aplikacje sieciowe</b></div>
<div class="post">
Aplikacja tunelująca UDP over TCP<br>
Aplikacja tunelująca TCP over TCP<br>
</div>

<div><b>Bankowość i płatności</b></div>
<div class="post">
Aplikacje terminalowe EFT POS ("embeded system")<br>
Programowanie terminali płatniczych
<ul>
<li>identyfikacja klienta dla KredyBank, BGŻ</li>
<li>płatnicze dla eService,PolCard,Pekao,Auchan,Rossman</li>
<li>parkomat płatniczy dla Polskich Portów Lotniczych</li>
<li>przedpłacone (prepaid) dla Lew,Agadka</li>
<li>wieloplatformowa biblioteka programistyczna <b>MultiX</b></li>
</ul>
Aplikacje serwerowe
<ul>
<li>system zarządzania terminalmi TMS dla Agadka,OPDF</li>
<li>serwer kodów doładowań dla Agadka</li>
<li>serwer autoryzacyjny <b>MAAS</b> dla Auchan/Lukas Bank</li>
<li>emulatory auoryzacyjne (Base24, Postilion, protokoły: Apacs30/40, ISO8583, SPDH)</li>
</ul>
</div>
<div><b>Kryptografia</b></div>
<div class="post">
Algorytmy symetryczne (DES,3DES)<br>
Algorytmy asymetryczne (RSA)<br>
Funkcje skrótu (CRC16,CRC32,SHA1,SHA2,MD5)
Dywersyfikacja kluczy (Apacs,Dukpt:X9.24-1997,Dukpt:X9.24-2004)
</div>
</td>
<%}%>
</tr></table>
<!--
praca samodzielna, kreatywna, wymagaj¹ca nieszablonowego mylenia
-->
