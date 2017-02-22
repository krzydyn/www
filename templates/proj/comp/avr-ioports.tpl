<div><strong>Registers</strong></div>
<p align="justify">AVR is 8 bit microcontroller. All its ports are 8 bit wide. Every port has 3 registers associated with it each one with 8 bits. Every bit in those registers configure pins of particular port. Bit0 is associated with Pin0 of the port, Bit1 is associated with Pin1 of the port, and so on for other bits.</p>
<p>These three registers are as follows: (x can be replaced by A,B,C,D as per the AVR you are using)<br>- DDRx register <br>- PORTx register<br>- PINx register</p>

<div><strong>DDRx register </strong></div>
<p align="justify"><strong></strong>DDRx (Data Direction Register) configures data direction of port pins. Means its setting determines whether port pins will be used for input or output. Writing 0 to a bit in DDRx makes corresponding port pin as input, while writing 1 to a bit in DDRx makes corresponding port pin as output.</p>
<p>example:</p>
<ul>
<li>to make all pins of port A as input pins :<br>DDRA = 0b00000000;
</li><li>to make all pins of port A as output pins :<br>DDRA = 0b11111111;
</li><li>to make lower <a class="extern" href="http://wiki.answers.com/Q/How_many_nibbles_are_there_in_a_byte">nibble</a> of port B as output and higher <a href="http://wiki.answers.com/Q/How_many_nibbles_are_there_in_a_byte" target="_blank">nibble</a> as input :<br>DDRB = 0b00001111; </li>
</ul>

<div><strong>PINx register</strong>&nbsp;</div>
<p align="justify">PINx (Port IN) used to read data from port pins. In order to read the data from port pin, first you have to change port’s data direction to input. This is done by setting bits in DDRx to zero. If port is made output, then reading PINx register will give you data that has been output on port pins.</p>
<p align="justify">Now there are two input modes. Either you can use port pins as tri stated inputs or you can activate internal pull up. It will be explained shortly.</p>
<p>example :</p>
<ul>
<li>to read data from port A.
<div>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">DDRA = 0x00;    <span style="color:#008000;">//Set port a as input</span>
x = PINA;       <span style="color:#008000;">//Read contents of port a </span>
</pre>
</div>
</li>
</ul>
<div><strong>PORTx register</strong></div>
<p>PORTx is used for two purposes.</p>
<p align="justify">1) To output data&nbsp; :&nbsp; when port is configured as output</p>
<p>When you set bits in DDRx to 1, corresponding pins becomes output pins. Now you can write data into respective bits in PORTx register. This will immediately change state of output pins according to data you have written.</p>
<p align="justify">In other words to output data on to port pins, you have to write it into PORTx register. However do not forget to set data direction as output.</p>
<p>example :</p>
<ul>
<li>to output 0xFF data on port b
<div>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">DDRB = 0b11111111;        <span style="color:#008000;">//set all pins of port b as outputs</span>
PORTB = 0xFF;             <span style="color:#008000;">//write data on port </span>
</pre>
</div>
</li><li>to output data in variable x on port a
<div>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">DDRA = 0xFF;            <span style="color:#008000;">  //make port a as output</span>
PORTA = x;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:#008000;">//output variable on port</span>
</pre>
</div>
</li><li>to output data on only 0th bit of port c
<div>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">DDRC.0 = 1;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:#008000;">//set only 0th pin of port c as output</span>
PORTC.0 = 1;       <span style="color:#008000;">//make it high. </span>
</pre>
</div>
</li>
</ul>
<p align="justify">2) To activate/deactivate pull up resistors – when port is configures as input</p>
<p>When you set bits in DDRx to 0, i.e. make port pins as inputs, then corresponding bits in PORTx register are used to activate/deactivate pull-up registers associated with that pin. In order to activate pull-up resister, set bit in PORTx to 1, and to deactivate (i.e to make port pin tri stated) set it to 0.</p>
<p align="justify">In input mode, when pull-up is enabled, default state of pin becomes ’1'. So even if you don’t connect anything to pin and if you try to read it, it will read as 1. Now, when you externally drive that pin to zero(i.e. connect to ground / or pull-down), only then it will be read as 0.</p>
<p align="justify">However, if you configure pin as tri state. Then pin goes into state of high impedance. We can say, it is now simply connected to input of some OpAmp inside the uC and no other circuit is driving it from uC. Thus pin has very high impedance. In this case, if pin is left floating (i.e. kept unconnected) then even small static charge present on surrounding objects can change logic state of pin. If you try to read corresponding bit in pin register, its state cannot be predicted. This may cause your program to go haywire, if it depends on input from that particular pin.</p>
<p>Thus while, taking inputs from pins / using micro-switches to take input, always enable pull-up resistors on input pins.</p>
<p>NOTE : while using on chip ADC, ADC port pins must be configured as tri stated input.</p>
<p>example :</p>
<ul>
<li>to make port a as input with pull-ups enabled and read data from port a
<div>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">DDRA = 0x00;        <span style="color:#008000;">//make port a as input</span>
PORTA = 0xFF;       <span style="color:#008000;">//enable all pull-ups  </span>
y = PINA;           <span style="color:#008000;">//read data from port a pins</span>
 </pre>
</div>
</li><li>to make port b as tri stated input
<div>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">DDRB  = 0x00;        <span style="color:#008000;">//make port b as input</span>
PORTB = 0x00;        <span style="color:#008000;">//disable pull-ups and make it tri state</span>
</pre>
</div>
</li><li>to make lower nibble of port a as output, higher nibble as input with pull-ups enabled
<div>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">DDRA  = 0x0F;        <span style="color:#008000;">//lower nib&gt; output, higher nib&gt; input</span>
PORTA = 0xF0;        <span style="color:#008000;">//lower nib&gt; set output pins to 0, </span>
                     <span style="color:#008000;">//higher nib&gt; enable pull-ups</span>
</pre>
</div>
</li>
</ul>
<div><strong>Summary</strong></div>
<p>Following table lists register bit settings and resulting function of port pins</p>
<div align="center">
<table class="db" width="500">
<tbody>
<tr>
<td valign="top" width="100"><strong>register bits<br>pin functions</strong></td>
<td valign="top" width="100"><strong>DDRx.n</strong></td>
<td valign="top" width="100"><strong>PORTx.n</strong></td>
<td valign="top" width="100"><strong>PINx.n</strong></td>
</tr>
<tr>
<td valign="top" width="100">tri stated input </td>
<td valign="top" width="100">0</td>
<td valign="top" width="100">0</td>
<td valign="top" width="100">read data bit<br>x = PINx.n;</td>
</tr>
<tr>
<td valign="top" width="100">pull-up input</td>
<td valign="top" width="100">0</td>
<td valign="top" width="100">1</td>
<td valign="top" width="100">read data bit<br>x = PINx.n;</td>
</tr>
<tr>
<td valign="top" width="100">output</td>
<td valign="top" width="100">1</td>
<td valign="top" width="100">write data bit<br>PORTx.n = x;</td>
<td valign="top" width="100">n/a</td>
</tr>
</tbody>
</table>
</div>
<p>&nbsp;<br>&nbsp;</p>
<h2>Examples</h2>
<div><strong>1) Blink LED on PB0 at a rate of 1Hz.</strong></div>
<div>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">#include &lt;mega16.h&gt;
#include &lt;delay.h&gt;

<span style="color:#0000ff;">void</span> main()
{
    DDRB = 0xFF;         <span style="color:#008000;">//PB as output</span>
    PORTB= 0x00;         <span style="color:#008000;">//keep all LEDs off</span>

    <span style="color:#0000ff;">while</span>(1)
    {
        PORTB.0=0;       <span style="color:#008000;">//turn LED off</span>
        delay_ms(500);   <span style="color:#008000;">//wait for half second</span>
        PORTB.0=1;       <span style="color:#008000;">//turn LED on </span>
        delay_ms(500);   <span style="color:#008000;">//wait for half second</span>
    };        
}
 </pre>
</div>
<div>&nbsp;</div>
<div><strong>2) Blink LEDs on PB with&nbsp; different patterns according to given input.<br></strong><br>- Kit : use SW0, SW1<br>- No Kit : Connect a 2 micro-switches between pin PC0,PC2 and ground. So that when you press the switch pin is pulled low.</div>
<div>
<pre style="font-size:8pt;overflow:visible;width:100%;color:black;line-height:12pt;font-family:consolas, 'Courier New', courier, monospace;background-color:#f4f4f4;border-style:none;margin:0;padding:0;">#include &lt;mega16.h&gt;
#include &lt;delay.h&gt;

<span style="color:#008000;">//declare global arrays for two patterns</span>
unsigned <span style="color:#0000ff;">char</span> p1[4] = { 0b10000001,
                        0b01000010,    
                        0b00100100,
                        0b00011000 };

unsigned <span style="color:#0000ff;">char</span> p2[4] = { 0b11111111,
                        0b01111110,    
                        0b00111100,
                        0b00011000 };
<span style="color:#0000ff;">void</span> main()
{
unsigned <span style="color:#0000ff;">char</span> i;                <span style="color:#008000;">//loop counter</span>

    DDRB = 0xFF;                <span style="color:#008000;">//PB as output</span>
    PORTB= 0x00;                <span style="color:#008000;">//keep all LEDs off</span>

    DDRC = 0x00;                <span style="color:#008000;">//PC as input</span>
    PORTC.0 = 1;                <span style="color:#008000;">//enable pull ups for</span>
    PORTC.1 = 1;                <span style="color:#008000;">//only first two pins</span>

    <span style="color:#0000ff;">while</span>(1)
    {
        <span style="color:#008000;">//# if SW0 is pressed show pattern 1</span>
        <span style="color:#0000ff;">if</span>(PINC.0==0)                                           
        {
            <span style="color:#0000ff;">for</span>(i=0;i&lt;3;i++)
            {
                PORTB=p1[i];    <span style="color:#008000;">//output data</span>
                delay_ms(300);  <span style="color:#008000;">//wait for some time</span>
            }
            PORTB=0;            <span style="color:#008000;">//turn off all LEDs</span>
        }

        <span style="color:#008000;">//# if SW1 is pressed show pattern 2</span>
        <span style="color:#0000ff;">if</span>(PINC.1==0)           
        {
            <span style="color:#0000ff;">for</span>(i=0;i&lt;3;i++)
            {
                PORTB=p2[i];    <span style="color:#008000;">//output data</span>
                delay_ms(300);  <span style="color:#008000;">//wait for some time</span>
            }
            PORTB=0;            <span style="color:#008000;">//turn off all LEDs</span>
        }

    };        
}
</pre>
</div>
