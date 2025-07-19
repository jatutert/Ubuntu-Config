::
:: Script voor het aanmaken van latest bestanden op basis van nieuwste bestand in directory
:: 11 juli 2024
:: John Tutert 
:: 

@echo off

:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Aanmaken LATEST voor WSL2 Config (versie 1)
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Stel de bron- en doelmap in
set v1source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-1xx-WSL2-No-Usermenu
set v1destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config

:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%v1source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
:Continue

:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%v1source%\%NewestFile%" "%v1destination%\ubuntu-config-V1-latest.sh"

:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Aanmaken latest voor Ubuntu Config (versie 2)
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Stel de bron- en doelmap in
set v2source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Ubuntu-Config\Version-2xx-Usermenu-Edition
set v2destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config

:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%v2source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
:Continue

:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%v2source%\%NewestFile%" "%v2destination%\ubuntu-config-V2-latest.sh"

:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Aanmaken latest voor LUCT (versie 3)
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Stel de bron- en doelmap in
set v3source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-3xx-Distro-Independent\2025
set v3destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config

:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%v3source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
:Continue

:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%v3source%\%NewestFile%" "%v3destination%\ubuntu-config-V3-latest.sh"


:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Aanmaken latest voor LUCT (versie 4.0) DEV
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Stel de bron- en doelmap in
set v4source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V400-Dev-Tested
set v4destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config

:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%v4source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
:Continue

:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%v4source%\%NewestFile%" "%v4destination%\LUCT-4-0-DEV-latest.sh"



:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Aanmaken latest voor LUCT (versie 4.1) CANARY
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Stel de bron- en doelmap in
set v4source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config\Version-4xx\V410-Canary-Not-Tested
set v4destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-GitDesktop\Ubuntu-Config

:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%v4source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
:Continue

:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%v4source%\%NewestFile%" "%v4destination%\LUCT-4-1-Canary-latest.sh"
