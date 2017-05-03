<table style="max-width:750px"><tr><td>
<%if(val("req.lang")=="en"){%>
<b>Ultrasonic scanning microscope devloped at Institute of Fundamental Technological Research
Polish Academy of Sciences <a href="http://www.ippt.gov.pl">IPPT PAN</a></b>.<br>
<br>

<div>
System is capable to make 3-dimensional image processing.<br>
Combines Scanning Acoustic Microscope (SAM) of type B and type C.<br>
System was constructed using high-tech electronic devices like:
<ul>
<img class="sp" src="proj/pan/scanner.gif" width="120px" align="right"/>
<li><b>Panametrics 5900PR</b> pulser/receiver</li>
<li><a href="http://www.signatec.com/products/daq/high-speed-pcix-digitizer-board-pda1000.html">
Signatec PDA1000 board</a> working at 1GHz sampling frequency placed in PC</li>
<li><b>Optica</b> XY table with ultrasonic head handle</li>
</ul>
<br>
<img class="sp" src="proj/pan/panametrics.jpg" alt="Panametrics" title="Panametrics 5900PR" width="200px"/>
<img src="proj/pan/pda1000.jpg" alt="PDA1000" title="Signatec PDA1000 board" width="200px"/>
</div><div>
The system (software) is developed as 3 modules (applications):
<img class="sp" src="proj/pan/fantom7.png" width="250px" align="right"/>
<ol>
<li>Collecting data from ADC while adjusting XY-table<br> to scan the region, resulting a Volume of data
</li>
<li>Filtering Volume with various filters
</li>
<li>3-dimensional visualization VTK/OpenGL
</li>
</ol>
<img class="sp" src="proj/pan/oscil0.jpg" height="150px"/>
<img class="sp" src="proj/pan/volfi.jpg" height="150px"/>
</div>

<%}else{%>
<b>Mikroskop ultradźwiękowy skanujący zbudowany w Instytucie Podstawowych Problemów Techniki
na Polskiej Akademii Nauk <a href="http://www.ippt.gov.pl">IPPT PAN</a></b>.<br>
<br>

<div>
System umożliwia obrazowanie trójwymiarowe, łącząc cechy mikroskopu akustycznego typu B-scan i C-scan.
Dane (echa ultradźwiękowe) typu B-scan zebrane podczas skanowania X-Y pozwalają stworzyć
trójwymiarowy obraz wewnętrznych struktur badanego materiału.<br>
Mikroskop ultradźwiękowy zbudowany został z następujących komponentów:
<ul>
<img class="sp" src="proj/pan/scanner.gif" width="120px" align="right"/>
<li><b>Panametrics 5900PR</b> nadajnik/odbirnik</li>
<li>Prztwornik ADC <a href="http://www.signatec.com/products/daq/high-speed-pcix-digitizer-board-pda1000.html">
Signatec PDA1000 board</a> pracujący z częstotliwością próbkowania 1GHz z 8-bitową
rozdzielczością pomiaru wartości sygnału zainstalowany w PC</li>
<li><b>Optica</b> skaner XY starowany silniczkami krokowymi z uchwytem na głowicą ultradźwiękową</li>
</ul>
<br>
<img class="sp" src="proj/pan/panametrics.jpg" alt="Panametrics" title="Panametrics 5900PR" width="200px"/>
<img class="sp" src="proj/pan/pda1000.jpg" alt="PDA1000" title="Signatec PDA1000 board" width="200px"/>
</div><br><div>
System (oprogramownie) zostam podzielony na 3 moduły (aplikacje):
<img class="sp" src="proj/pan/fantom7.png" width="250px" align="right"/>
<ol>
<li>Zbiearanie danych z ADC podczas przemieszczania stolika XY w zadanym obszarze, generując przestrzenny obraz (Volume)
</li>
<li>Filtrowanie obrazu przestrzennego z wykorzystaniem różnych filtrów
</li>
<li>Wizualizacja trójwymiarowa VTK/OpenGL
</li>
</ol>
<img class="sp" src="proj/pan/oscil0.jpg" height="150px"/>
<img class="sp" src="proj/pan/volfi.jpg" height="150px"/>
</div>
<%}%>
</td></tr></table>
