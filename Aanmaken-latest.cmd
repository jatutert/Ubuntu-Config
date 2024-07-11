::
:: Script voor het aanmaken van latest bestanden op basis van nieuwste bestand in directory
:: 11 juli 2024
:: John Tutert 
:: 

@echo off

:: Aanmaken LATEST voor WSL2 Config (versie 1)

:: Stel de bron- en doelmap in
set source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config\Version-1xx-WSL2-No-Usermenu
set destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config

:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
:Continue

:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%source%\%NewestFile%" "%destination%\ubuntu-config-V1-latest.sh"

:: Aanmaken latest voor Ubuntu Config (versie 2)

:: Stel de bron- en doelmap in
set source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config\Version-2xx-Usermenu-Edition
set destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config

:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
:Continue

:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%source%\%NewestFile%" "%destination%\ubuntu-config-V2-latest.sh"

:: Aanmaken latest voor Ubuntu Config (versie 3)

:: Stel de bron- en doelmap in
set source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config\Version-3xx-Distro-Independent
set destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config

:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
:Continue

:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%source%\%NewestFile%" "%destination%\ubuntu-config-V3-latest.sh"
