Problem description:<br>
</pre>
- USB camera is recognized by the system
- MovieMaker can capure
- MyComputer>Video Device USB #x  is visible but cause error on open
system message is:
"Nie mo¿na utworzyæ podgl¹du wideo.
SprawdŸ po³¹czenie urz¹dzenia i upewnij siê, ¿e ¿adna inna aplikacja..."
- Skype can't open camera (error)
skype message is:
"Nie mo¿na rozpoczac wideo. Spróbuj zamkn¹æ inne programy...."
1. uninstall Klite codec pack (full)
+ MyComputer>Video Device USB #x is visible and camara can be opened
- Skype can;t open camera (no error)

2. paste following to file.reg and execute
----------
Windows Registry Editor Version 5.00
[HKEY_CURRENT_USER\Software\GNU\ffdshow]
"multipleInstances"=dword:00000004
----------
</pre>
