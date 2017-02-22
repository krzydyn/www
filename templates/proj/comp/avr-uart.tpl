<h2>Control and Status Registers</h2>
<table class="db">
<tr>
<th>UCSR0A Bit #</th><th>Name</th><th>Description</th>
</tr>
<tr>
  <td>bit 7</td>
  <td>RXC0</td>
  <td>
<span class="caps">USART</span> Receive Complete. Set when data is available and the data register has not be read yet.</td>
</tr>
<tr>
  <td>bit 6</td>
  <td>TXC0</td>
  <td>
<span class="caps">USART</span> Transmit Complete. Set when all data has transmitted.</td>
</tr>
<tr>
  <td>bit 5</td>
  <td>UDRE0</td>
  <td>
<span class="caps">USART</span> Data Register Empty. Set when the UDR0 register is empty and new data can be transmitted.</td>
</tr>
<tr>
  <td>bit 4</td>
  <td>FE0</td>
  <td>Frame Error. Set when next byte in the UDR0 register has a framing error.</td>
</tr>
<tr>
  <td>bit 3</td>
  <td>DOR0</td>
  <td>Data OverRun. Set when the UDR0 was not read before the next frame arrived.</td>
</tr>
<tr>
  <td>bit 2</td>
  <td>UPE0</td>
  <td>
<span class="caps">USART</span> Parity Error. Set when next frame in the UDR0 has a parity error.</td>
</tr>
<tr>
  <td>bit 1</td>
  <td>U2X0</td>
  <td>
<span class="caps">USART</span> Double Transmission Speed. When set decreases the bit time by half doubling the speed.</td>
</tr>
<tr>
  <td>bit 0</td>
  <td>MPCM0</td>
  <td>Multi-processor Communication Mode. When set incoming data is ignored if no addressing information is provided.</td>
</tr>
</tbody>
</table>
<br>
<table class="db">
<tr>
<th>UCSR0B Bit #</th> <th>Name</th> <th>Description</th>
</tr>
<tbody>
<tr>
  <td>bit 7</td>
  <td>RXCIE0</td>
  <td>RX Complete Interrupt Enable. Set to allow receive complete interrupts.</td>
</tr>
<tr>
  <td>bit 6</td>
  <td>TXCIE0</td>
  <td>TX Complete Interrupt Enable. Set to allow transmission complete interrupts.</td>
</tr>
<tr>
  <td>bit 5</td>
  <td>UDRIE0</td>
  <td>
<span class="caps">USART</span> Data Register Empty Interrupt Enable. Set to allow data register empty interrupts.</td>
</tr>
<tr>
  <td>bit 4</td>
  <td>RXEN0</td>
  <td>Receiver Enable. Set to enable receiver.</td>
</tr>
<tr>
  <td>bit 3</td>
  <td>TXEN0</td>
  <td>Transmitter enable. Set to enable transmitter.</td>
</tr>
<tr>
  <td>bit 2</td>
  <td>UCSZ20</td>
  <td>
<span class="caps">USART</span> Character Size 0. Used together with UCSZ01 and UCSZ00 to set data frame size. Available sizes are 5-bit (000), 6-bit (001), 7-bit (010), 8-bit (011) and 9-bit (111).</td>
</tr>
<tr>
  <td>bit 1</td>
  <td>RXB80</td>
  <td>Receive Data Bit 8. When using 8 bit transmission the 8th bit received.</td>
</tr>
<tr>
  <td>bit 0</td>
  <td>TXB80</td>
  <td>Transmit Data Bit 8. When using 8 bit transmission the 8th bit to be submitted.</td>
</tr>
</tbody>
</table>
<br>
<table class="db">
<tr>
<th>UCSR0C Bit #</th> <th>Name</th> <th>Description</th>
</tr>
<tbody>
<tr>
  <td>bit 7<br>bit 6</td>
  <td>
UMSEL01<br>UMSEL00
</td>
  <td>
<span class="caps">USART</span> Mode Select 1 and 0. UMSEL01 and UMSEL00 combined select the operating mode. Available modes are asynchronous (00), synchronous (01) and master<span class="caps">SPI</span> (11).</td>
</tr>
<tr>
  <td>bit 5<br>bit 4</td>
  <td>
UPM01<br>UPM00
</td>
  <td>
<span class="caps">USART</span> Parity Mode 1 and 0. UPM01 and UPM00 select the parity. Available modes are none (00), even (10) and odd (11).</td>
</tr>
<tr>
  <td>bit 3</td>
  <td>USBS0</td>
  <td>
<span class="caps">USART</span> Stop Bit Select. Set to select 1 stop bit. Unset to select 2 stop bits.</td>
</tr>
<tr>
  <td>bit 2<br>bit 1</td>
  <td>
UCSZ01<br>UCSZ00
</td>
  <td>
<span class="caps">USART</span> Character Size 1 and 0. Used together with with UCSZ20 to set data frame size. Available sizes are 5-bit (000), 6-bit (001), 7-bit (010), 8-bit (011) and 9-bit (111).</td>
</tr>
<tr>
  <td>bit 0</td>
  <td>UCPOL0</td>
  <td>
<span class="caps">USART</span> Clock Polarity. Set to transmit on falling edge and sample on rising edge. Unset to transmit on rising edge and sample on falling edge.</td>
</tr>
</tbody>
</table>

<h3>Timer0 observations</h3>
<pre>
delay(1000)
presc	intr	regs	freq   calc
1/1	9790 RA=83,RB=1	10kHz	16M/1/256=62k NOK (6x za wolno)
1/8	8003 RA=83,RB=2  8kHz	16M/8/256=7812 ok
1/64	982  RA=83,RB=3 980Hz	16M/64/256=976 ok
1/256	245  RA=83,RB=4 245Hz	16M/256/256=244 ok
</pre>
<pre>
delay(500) (probably delay loop is not very accurate)
presc	intr	regs	freq   calc
1/1	41039 RA=83,RB=1	16M/1/256/2=32k ok
1/8	4029 RA=83,RB=2  8kHz	16M/8/256/2=7812 ok
1/64	491  RA=83,RB=3 980Hz	16M/64/256/2=976 ok
1/256	122  RA=83,RB=4 245Hz	16M/256/256/2=122 ok
</pre>

