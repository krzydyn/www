<h2>Incorect fonts displayted with incorect fontmetrics</h2>
<b>The situation:</b><br>
computer whith several java versions intalled.<br>
There was java1.5, java1.6 and java1.7 installed<br>
System environment was set to run java1.6<br>
<b>The observation:</b><br>
java1.7 runtime show correct fonts<br>
<b>The solution:</b><br>
clean your configuration, unstall all java versions and install one (usually the latest)<br>
<br>
Other proposals found on the net
<hr>
<h2>tip</h2>
<p>
I have openjdk installed in linux and all apps where with very, very bad fonts... after many tries to change fonts, antialias, install Lucida fonts, etc i found that my problem was in the /etc/fonts/conf.d/35-freefont.conf
i simply removed that link, do a fc-cache -f and all new java apps will get a much better font.
In my case, the freefont config was telling java to use it instead of a much better fonts. if you have a similar problem, simply do as root "mv /etc/fonts/conf.d /etc/fonts/conf.d.off" and a "fc-cache -f" and test ... if it works, you also have a bad default font substitution and you should restore that dir and test each file. if stays the same, then you probably have another problem (dont forget to restore the conf.d dir)
update: On ubuntu 12.04 i had similar problem, all java fonts where bold. Removing the /etc/fonts/conf.d/65-nonlatin.conf fixed the problem
</p>
<h2>tip</h2>
<p>
You can use openJDK and use Sun/Oracle's fonts!
First install openDJK (both runtime and dev packages)
Then install Sun/Oracle's runtime only. This will install the fonts, but you'll still be using openJDK's java to run everything.
</p>
<h2>tip</h2>
<p>
This is something you might want to check. Do you run the VMs in
the same locale on the different OS versions?
</p>
<h2>tip</h2>
<p>
Java font configuration in font.properties file.
</p>
<h2>tip</h2>
<p>
install msttcorefonts
</p>
<h2>tip</h2>
<p>
Java 7 no longer uses the fontconfig.properties file on Linux, though it still has all of the files as if it did. It now uses the Linux font configuration file libfontconfig, which has to be re-built after the fonts are installed.
First, with a text editor, modify the file:
Code: /etc/fonts/conf.avail/60-latin.conf
This is an xml file that tells fontconfig which latin font families to prefer for each alias type (serif, sans-serif, monospace, etc.). Move or delete font families under each appropriate alias to get the preferred fonts to the top of each list.
Next, to rebuild libfontconfig, run the following from the command line (prefix sudo if appropriate, of course):
Code: dpkg-reconfigure fontconfig
</p>
<h2>tip</h2>
<p>
to choose one of installed java envs:
update-alternatives --config java
</p>
<h2>tip</h2>
<p>
