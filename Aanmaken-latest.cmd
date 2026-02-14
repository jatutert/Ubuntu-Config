::
:: Script voor het aanmaken van latest bestanden op basis van nieuwste bestand in directory
:: 11 juli 2024
:: John Tutert 
:: 

@echo off

set "destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config"
::
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Aanmaken LATEST voor WSL2 Config (versie 1)
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 1
::
:: Stel de bron- en doelmap in
set v1source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-1xx\Version-1xx-WSL2-No-Usermenu
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%v1source%" /B /A:-D /O:-D') DO SET v1NewestFile=%%I & GOTO V1Continue
:V1Continue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%v1source%\%v1NewestFile%" "%destination%\ubuntu-config-V1-latest.sh"
::
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Aanmaken latest voor Ubuntu Config (versie 2)
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 2
:: 
:: Stel de bron- en doelmap in
set v2source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-2xx\Version-2xx-Usermenu-Edition
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%v2source%" /B /A:-D /O:-D') DO SET v2NewestFile=%%I & GOTO V2Continue
:V2Continue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%v2source%\%v2NewestFile%" "%destination%\ubuntu-config-V2-latest.sh"
::
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Aanmaken latest voor LUCT (versie 3)
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 3
:: 
:: Stel de bron- en doelmap in
set v3source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-3xx-Distro-Independent\2025
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%v3source%" /B /A:-D /O:-D') DO SET v3NewestFile=%%I & GOTO V3Continue
:V3Continue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%v3source%\%v3NewestFile%" "%destination%\ubuntu-config-V3-latest.sh"
::
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  Aanmaken latest voor LUCT (versie 4.0) Canary
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 40 Canary Channel 
::
:: Stel de bron- en doelmap in
set V40Csource=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V400-Canary-Not-Tested
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%V40Csource%" /B /A:-D /O:-D') DO SET "V40CNewestFile=%%I"&GOTO V40CContinue
:V40CContinue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%V40Csource%\%V40CNewestFile%" "%destination%\LUCT-4-0-CAN-latest.sh"
::
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  Aanmaken latest voor LUCT (versie 4.0) DEV
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 40 DEV Channel
:: 
:: Stel de bron- en doelmap in
set V40Dsource=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V400-Dev-Tested
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%V40Dsource%" /B /A:-D /O:-D') DO SET "V40DNewestFile=%%I"&GOTO V40DContinue
:V40DContinue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%V40Dsource%\%V40DNewestFile%" "%destination%\LUCT-4-0-DEV-latest.sh"
::
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  Aanmaken latest voor LUCT (versie 4.0) Stable
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 40 Stable Channel 
::
:: Stel de bron- en doelmap in
set V40Ssource=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V400-Stable-Full-Tested
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%V40Ssource%" /B /A:-D /O:-D') DO SET "V40SNewestFile=%%I"&GOTO V40SContinue
:V40SContinue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%V40Ssource%\%V40SNewestFile%" "%destination%\LUCT-4-0-Stable-latest.sh"
::
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  Aanmaken latest voor LUCT (versie 4.1) CANARY
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 41 Canary Channel
:: 
:: Stel de bron- en doelmap in
set V41Csource=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V410-Canary-Not-Tested
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%V41Csource%" /B /A:-D /O:-D') DO SET "V41CNewestFile=%%I"&GOTO V41CContinue
:V41CContinue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%V41Csource%\%V41CNewestFile%" "%destination%\LUCT-4-1-CAN-latest.sh"
::
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  Aanmaken latest voor LUCT (versie 4.1) DEV
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 41 Dev Channel
:: 
:: Stel de bron- en doelmap in
set V41Dsource=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V410-Dev-Tested
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%V41Dsource%" /B /A:-D /O:-D') DO SET "V41DNewestFile=%%I"&GOTO V41DContinue
:V41DContinue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%V41Dsource%\%V41DNewestFile%" "%destination%\LUCT-4-1-DEV-latest.sh"
::
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  Aanmaken latest voor LUCT (versie 4.1) Stable
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 41 Stable Channel
:: 
:: Stel de bron- en doelmap in
set V41Ssource=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V410-Stable-Full-Tested
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%V41Ssource%" /B /A:-D /O:-D') DO SET "V41SNewestFile=%%I"&GOTO V41SContinue
:V41SContinue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%V41Ssource%\%V41SNewestFile%" "%destination%\LUCT-4-1-Stable-latest.sh"
::
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  Aanmaken latest voor LUCT (versie 4.2) Canary
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 42 Canary Channel
:: 
:: Stel de bron- en doelmap in
set V42Csource=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V420-Canary-Not-Tested
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%V42Csource%" /B /A:-D /O:-D') DO SET "V42CNewestFile=%%I"&GOTO V42CContinue
:V42CContinue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%V42Csource%\%V42CNewestFile%" "%destination%\LUCT-4-2-CAN-latest.sh"
::
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  Aanmaken latest voor LUCT (versie 4.2) DEV
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 42 Dev Channel 
:: 
:: Stel de bron- en doelmap in
set V42Dsource=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V420-Dev-Tested
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%V42Dsource%" /B /A:-D /O:-D') DO SET "V42DNewestFile=%%I"&GOTO V42DContinue
:V42DContinue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%V42Dsource%\%V42DNewestFile%" "%destination%\LUCT-4-2-DEV-latest.sh"
::
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  Aanmaken latest voor LUCT (versie 4.2) Stable
::  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
ECHO Version 42 Stable Channel
:: 
:: Stel de bron- en doelmap in
set V42Ssource=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V420-Stable-Full-Tested
:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%V42Ssource%" /B /A:-D /O:-D') DO SET "V42SNewestFile=%%I"&GOTO V42SContinue
:V42SContinue
:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%V42Ssource%\%V42SNewestFile%" "%destination%\LUCT-4-2-Stable-latest.sh"