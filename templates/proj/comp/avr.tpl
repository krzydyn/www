ISP connectors: (for SPI programming)<br>
<table class="dlg">
<tr><td>
IDC10<br>
<img src="proj/comp/spi10p.jpg" alt="IDC10">
</td><td>
IDC6<br>
<img src="proj/comp/spi6p.jpg" alt="IDC6">
</td></tr>
<tr><td colspan="2">
<ul>
<li>http://www.bassline.com.pl/atmel-avr-xmega-id34.html
<li>java for AVR: http://www.societyofrobots.com/robotforum/index.php?topic=15605.0
<li><pre>Semiconductors Bank Ltd. Sp.z o.o.
Łódź, ul. Radwańska 55/2
tel. 42-636 94 87, e-handel@semiconductors.com.pl</pre>
<li>http://dangerousprototypes.com
<li>http://www.state-machine.com/qp/
<li>timer/PWM<br>
http://www.ermicro.com/blog/?p=1971<br>
https://sites.google.com/site/qeewiki/books/avr-guide/pwm-on-the-atmega328<br>
https://sites.google.com/site/qeewiki/books/avr-guide/timers-on-the-atmega328<br>
<li>Audio player<br>
http://www.embedds.com/simple-and-small-portable-avr-mp3-player/ (VS1011b MP3 decoder IC)<br>
http://avrpcm.blogspot.com/2010/11/playing-8-bit-pcm-using-any-avr.html (simple !!!)<br>
http://www.whatcircuits.com/signal-generator-circuits/simple-sinewave-generator-with-attiny13/<br>
http://www.youtube.com/watch?v=GDnss0HZ9ho (play audio from rs232)
http://elm-chan.org/works/sd8p/report.html (slabe)<br>
http://playground.arduino.cc/Code/PCMAudio (arduino)<br>
http://aquaticus.info/pwm-music<br>
http://www.elektroda.pl/rtvforum/topic2363791-90.html (wyjscie na głosnik)<br>
http://www.zen22142.zen.co.uk/Prac/winscope.htm<br>
<li>Programtor<br>
http://mdiy.pl/uprog-maly-szybki-przenosny-programator-avr-z-sd/?lang=en#more-2197
</ul>
</td></tr>
</table>
<%code_start("c")%>
int rand(void)
{
	static unsigned long lfsr = 1;
	lfsr = (lfsr >> 1) ^ (-(lfsr & 1) & 0xd0000001); 
		return( lfsr );
}
<%code_stop("c")%>
