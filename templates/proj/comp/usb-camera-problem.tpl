Problem description:<br>
</pre>
- USB camera is recognized by the system
- MovieMaker can capure
- MyComputer>Video Device USB #x  is visible but cause error on open
system message is:
"Nie mo�na utworzy� podgl�du wideo.
Sprawd� po��czenie urz�dzenia i upewnij si�, �e �adna inna aplikacja..."
- Skype can't open camera (error)
skype message is:
"Nie mo�na rozpoczac wideo. Spr�buj zamkn�� inne programy...."
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
