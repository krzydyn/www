<h2>Protocol issues</h2>
(ordered by importance)
<ol>
<li>commands should never incorrect/wrong values<br>
after disable internal clock or set clock external these readouts are incorrect:<br>
<b>command 0E</b> returns 'Waveform Program Nr' = 00 (not matter which is choosen)<br>
<b>command 18</b> returns 'Online Status Register' = 00 (all cards online)<br>
<b>command 1E</b> returns 'Power Monitor Register' = 00 (current is not ok) for all cards<br>
commands should return error: "Operation failed", "Operation timeout" or "FPGA timeout"
<li>send data in binary format<br>
<b>Program Waveform Data(0x16)</b> - 16bit words have to be sent as 2-byte binaries, not 4byte ASCII 
<li>error code:<br>
would return in one "response error code" command, something like below:<br>
<pre>0002h 00FFh 0002h &lt;CODE> &lt;LENGTH> &lt;TEXT MESSAGE></pre>
but always response should be odd (now 00FC 00FE are not)
<li>avoid commands working as 'toggle'<br>
make commands to set or get the parameter(s)<br>
functions should be symmetric (getXXX reads something, setXXX sets the same thing)<br>
commands afected:<br>
<b>Internal Clock ON/OFF(0x04)</b><br>
<b>Clock source INTERNAL/EXTERNAL(0x06)</b><br>
<b>Clock status / Mode readout(0x24)</b><br>
<li>Power Amplifier Card - Online Status (command 0x18):<br>
return value should have higher bits set '1' if 1=offline
<li><b>Readout Voltage Monitor(0x10)</b> - values can be send in binary format,<br>
as integer value [miliVolts] on 2 bytes<br>
<li>Waveform Data description:<br>
<i>The received “Waveform Data”- frame contains 2750 values, coded as 16-bit hexadecimal data words</i><br>
should be rewrited rather as:<br>
The received “Waveform Data”- frame contains 1375 values, each coded as 16-bit hexadecimal data words<br>
<li>input stream processing timeout<br>
The problem can be reproduced by sending for example two requests like:
<pre>send: 0002 0002 0002 0002</pre>
Expected result should be receiving two times firmware info.
<li>default communication mode: binary for eth, text for RS232
</ol>
