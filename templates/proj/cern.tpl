<table><tr><td>
<% $cernlogo=rand(0,10)>5?"cern-green.jpg":"cern-blue2.jpg"%>
<img class="icon" src="proj/cern/<%$cernlogo%>" alt="CERN/NA61" height="80px"/>

<%if(val("req.lang")=="en"){%>
<b>Monitoring &amp; Control Systems</b> for <a class="extern" href="http://na61.web.cern.ch">NA61/Shine</a> experiment<br>
at European Organization for Nuclear Research <a class="extern" href="http://cern.ch">CERN</a></b>

<%}else{%>

<b>Systemy Kontrolno-Pomiarowe</b> dla eksperymentu <a class="extern" href="http://na61.web.cern.ch">NA61/Shine</a><br>
w Europejskiej Organizacji Badań Jądrowych <a class="extern" href="http://cern.ch">CERN</a></b>

<%}%>

<br><br>
<a class="extern" href="http://kdynowsk.web.cern.ch/kdynowsk/">DCS Apps</a> |
<a class="extern" href="https://na61elog.cern.ch/">elog</a> |
<a class="extern" href="http://op-webtools.web.cern.ch/op-webtools/vistar/vistars.php?usr=SPS1">SPS 1</a> |
<a class="extern" href="http://tpg.hafas.de/hafas/tp/query.exe/fn?">tpg</a>
<br>
<a class="extern" href="http://gs-dep.web.cern.ch/en/content/Shuttle/New">shuttle</a> |
<a class="extern" href="https://edh.cern.ch/Hostel/">hostel</a> |
<a class="extern" href="http://user.web.cern.ch/user/Welcome.asp">CERN user</a> |
<a class="extern" href="http://e-groups.cern.ch">e-groups</a>
<br><br>

<t:list property="events" value="li">
<a href="?tab=proj/cern/<%$li%>"><%$li%></a><br>
</t:list>

</td></tr></table>

