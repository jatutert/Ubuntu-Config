#! /bin/bash
#
#
# ################################################################################
# ################################################################################
#
#   #    #  # #### #####  #   #      ####   Gemaakt door John Tutert (TutSOFT)
#   #    #  # #      #    #   #         #   2023 WSL Config
#   #    #  # #      #    #####         #   2024 Ubuntu Config
#   #    #  # #      #        #         #   2025 LUCT
#   #### #### ####   #        #  ##     #   Persoonlijk en / of educatief gebruik
#
# ################################################################################
# ################################################################################
#
#
#
#
# ################################################################################
# ################################################################################
#
# BLOK 1
# Informatieblok
#
# ################################################################################
# ################################################################################
#
#
# #######################
# Blok 1A
# Downloaden en uitvoeren Script
# #######################
#
#
# Ophalen van Canary Latest versie van dit script in externe omgeving
# sudo curl -L -o $HOME/luctv4.sh https://edu.nl/treah
# sudo wget -O $HOME/luctv4.sh https://edu.nl/treah
#
# Hierna
# sudo chmod +x $HOME/luctv4.sh 
# sudo $HOME/luctv4.sh docker 
# sudo $HOME/luctv4.sh minikube 
#
#
# #######################
# Blok 1B
# Bugcheck 
# #######################
#
#
# Bugcheck www.shellcheck.net
#
#
# #######################
# Blok 1C
# Versienummering Script
# #######################
#
#
# Versienummer Major.Minor.Build.Patch
#
# A major version increment (e.g., from 1.0 to 2.0) usually means there have been significant changes, potentially breaking compatibility with previous versions.
# A minor version increment (e.g., from 1.2 to 1.3) indicates the addition of new features or functionality in a backward-compatible way
# A patch or build number increment (e.g., from 1.2.1 to 1.2.2) usually signifies bug fixes, minor updates, or performance improvements
#
# Canary Channel ## Try the latest NOT TESTED features
# Dev Channel ## Try the latest TESTED features # Tested by a few people
# Stable Channel ## Try the latest TESTED features # Tested by a large group of people 
#
#
Major="4"
Minor="1"
Build="46"
Patch="0"
# Indien GEEN Release Candidate op 0 zetten
ReleaseCandidate="0"
Channel="DEV"
#
echo "LUCT $Major.$Minor Build $Build $Patch Channel $Channel Started by $USER" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
logger "LUCT $Major.$Minor Build $Build $Patch Channel $Channel Started by $USER"
#
# #######################
# Blok 1D
# Overzicht Poorten Script omgeving 
# #######################
#
#
# Inkomende Poorten
# #################
# 22   Inkomende poort Ansible host vanuit Controller 
# 9001 Inkomende poort voor Portainer Agent naar Portainer Server
#
#
# Uitgaande Poorten
# #################
#
#
# Uitgaande Webserver poorten
# 80 Apache Webserver
#
#
# Uitgaand Linux Managementpoorten 8100
# 8101 Cockpit 
#
#
# Uitgaand NotIsUse Managementpoorten 8200
# 8201 NotInUse
#
#
# Uitgaand Ansible Managementpoorten 8300
# 8301 Semaphore 
#
#
# Uitgaande Containerpoorten 9100 Docker Management Tools
# 9101 Portainer 
# 9102 Yacht
# 9103 Visual Studio Code Server
# 9104 Jenkins 
# 9105 Registry
# 9106 WatchTower
#
# Uitgaande Containerpoorten 9200 Docker Containers eigen
# 9200 NGINX
# 9201 K8S Demo Simple Deployment # k8s_simple_deployment_nginx.sh
# 9202 K8S Demo Deployment step 1 # k8s_nginx_deployment_stap_1.sh
# 9203 Niet in gebruik 
# 9204 Flask-demo # k8s-flask-demo-deployment.sh
#
# 9205 Flask-demo # Website 1 # Docker
# 9206 Flask-demo # Website 2 # Docker
# 9207 Flask-demo # Website 3 # Docker
# 9208 Flask-demo # Website 4 # Docker
# 9209 Flask-demo # Website 5 # Docker
#
# 9210 NextCloud
# 9211 dc-nextcloud-mariadb.yml
#
# 9220 WordPress
# 9221 mysql-deployment.yml
# 9222 wordpress-deployment.yml
#
#
#    Overzicht openstaande poorten in Ubuntu
#    sudo lsof -i -P -n | grep LISTEN
#
#
#
# #######################
# Blok 1E
# Changelog Script
# #######################
#
#
# Ubuntu
# 11juli25 Yacht Container Management zie https://www.youtube.com/watch?v=bsB2dvpdBYg van 6 minuten 
# 12juli25 Docker Management Tools functie 
# 12juli25 Visual Studio Code Server native en Docker 
# 12juli25 Visual Studio Code Server sed bug fixed 
# 18juli25 Build 32 Jenkins als Container in plaats van native install
# 18juli25 Build 32 Visual Studio Code Server als Container in plaats van native install 
# 19juli25 Edu link naar Canary latest opgenomen in kop van het script
# 20juli25 B5 PHP installatie output naar dev nul gezet
# 20juli25 B5 Native installatie van Visual Studio code uitgezet stond nog aan 
# 20juli25 B5 Docker Compose plugin installatie uitgezet wordt al gedaan bij installatie van Docker CE
# 20juli25 B5 Docker Compose installatie functie opmerkingen erbij gezet
# 20juli25 B5 Docker pull van Jenkins image gelijk aan gebruikte image stond op latest en lts 
# 20juli25 B5 Visual Studio Code Server als Docker container functie aangepast en werkend gemaakt
# 20juli25 B5 Volgorde functies Docker Podman en Minikube aangepast 
# 20juli25 B5 Namen containers met LUCT ervoor 
# 20juli25 B5 Initieel wachtwoord Jenkins naar lokaal bestand 
# 20juli25 B5 Dockly werkend 
# 20juli25 B5 LazyDocker werkend
# 20juli25 B5 Dry toevoeging
# 20juli25 B5 7zip in plaats van 7z installatie bugfix 
# 21juli25 B6 Poorten overzicht bijgewerkt
# 21juli25 B7 Nummering stappen correctie
# 21juli25 B7 Commando starten VS Code Server aangepast
# 21juli25 B8 Ansible eerste opzetje gemaakt start by scriptregel 1144
# 22juli25 B9 Ansible eth en ens netwerkconfiguratie
# 23juli25 B10 Ansible Master Inventory 
# 23juli25 B10 Uitbreiding logging 
# 23juli25 B10 Aanpassen hostname op basis van eerst check gebruikersnaam
# 24juli25 B11 Powershell installatie met snap in plaats van apt
# 24juli25 B11 Markering functies die niet meer actief in gebruik zijn
# 24juli25 B11 Patch 1 Snap installatie Powershell parameter classic EN run dry script chmod 
# 25juli25 B12 Nieuwe hoofd repo ubuntu en backup repo instellingen
# 25juli25 B12 Nieuwe logging manier docker images pull 
# 25juli25 B12 Patch 1 Bugfixes na run script
# 25juli25 B12 Patch 1 Aanpassen Ubuntu Repo op nieuwe manier 
# 25juli25 B13 Dive installatie fix WatchTower Image pull toegevoegd
# 25juli25 B13 Jenkins Wachtwoord bestand aanmaak in nested docker functie gezet
# Debian
# 25juli25 B14 Debian 12 Linux support start
# 25juli25 B14 Aanmaak Debian Ubuntu gezamenlijke functies 
# 26juli25 B14 Patch 1 wget voor ophalen script en aanpassen hostname debian docker
# 26juli25 B14 Patch 2 vullen distro variabele compatible met debian gemaakt
# 26juli25 B14 Patch 3 volgorde fixes nested oobe nav eerste run op debian
# 28juli25 B15 Succesvolle testrun op Debian gedaan melding apt repo add stil gemaakt en 7zz bij Debian
# 28juli25 B15 Debian installatie Snap van Ubuntu toegevoegd Snap is dus nu ook beschikbaar op Debian
# Debian Ubuntu
# 28juli25 B16 Bepalen versienummer eerder in script verwijderd bij change repo ubuntu
# 28juli25 B17 Proces fase meldingen 
# 28juli25 B17 Powershell Debian Ubuntu 
# 29juli25 B17 Patch 1 Powershell Debian Ubuntu naar 1 in plaats van per distro
# 29juli25 B18 Docker pull Progress Bar en APT Install Progress Bar
# 30juli25 B18 Patch 1 Progress Bars fix
# 30juli25 B19 Progress Bar Functie apart gezet in distro onafhankelijk gedeelte
# 30juli25 B19 Introductie van parameter 2 test waarbij veel meer zichtbaar wordt tijdens uitvoering
# 30juli25 B19 Patch 1 bugfix parameter 2 en oude en nieuwe versie Debian weergeven
# 30juli25 B20 Foutmelding Docker installatie distro afhankelijk gemaakt 
# 30juli25 B20 paramater een en twee werkend gemaakt
# 31juli25 B21 Debian en Ubuntu opties gelijk getrokken en omv optie voor Debian 
# 31juli25 B22 Modus naar leeg bij geen parameter 2 opgegeven
# 31juli25 B22 ContainerEngine in plaats van Docker of Podman voor pull images en portainer
# 01aug25  B23 Introductie gezamenlijke functies besparing 900 regels code
# 01aug25  B23 Patch 1 Herstel foutje in if then statement
# 02aug25  B24 Check if then statements script en introductie nieuwe functies om regels te besparen
# 02aug25  B24 Ansible Master en Ansible Slave function nieuwe opzet
# 02aug25  B25 Debian Ubuntu deel voltooien uit B24
# 02aug25  B25 Patch 1 fix apt https installatie 
# 03aug25  B26 Eerste opzet nieuwe manier installatie Docker nog niet gereed
# 03aug25  B27 Nieuwe Functie Container Engine en Nieuwe Functie Netwerk instellingen
# 03aug25  B28 Testmodus apt update en fix dry EN Podman docker registry fix voor images
# 03aug25  B29 Linux Distros aangepast beginscherm EN Testmodus aangezet op belangrijke onderdelen 
# 04aug25  B30 Cockpit nieuwe installatie manier EN Podman Cockpit EN Gebruiker ROOT vrijgeven
# 04aug25  B31 curl in plaats van snap curl omdat snap curl problemen geeft
# 04aug25  B31 Add Repo in gezamenlijke functie in plaats van apart
# 04aug25  B32 Test modus standaard uit
# 06aug25  B33 Eerste implementatie van LinuxMint en LMDE Linux ondersteuning 
# 06aug25  B33 Nieuwe manier hostnamen Debian en Ubuntu en Debian nieuwe structuur hostnaam
# 06aug25  Feature Complete 
# 06aug25  B34 RC1 Functie Config Bash shell naar debulx EN functie betere namen
# 07aug25  B35 RC2 Minder meldingen op scherm en duidelijke indicate fasen in script op scherm 
# 07aug25  B36 RC2 Minikube altijd installeren bij Docker 
# 07aug25  B37 RC2 Progress bar bugfix alles blijft nu op 1 regel
# 08aug25  B38 RC2 Debug modus aan bij test EN UT Twente Repo toevoeging
# 08aug25  B39 RC3 Nieuwe menu optie non lts upgrade
# 08aug25  B40 RC3 Minder meldingen tijdens run en set e uitgezet omdat script onstabiel wordt
# 08aug25  B40 RC4 Nieuwe Structuur Script
# 09aug25  B40 RC4 Nieuwe Structuur Script
# 10aug25  B41 RC4 Nieuwe Structuur Script
# 10aug25  B42 RC4 Nieuwe Structuur Script
# 12aug25  B42 Lus eth ens Ansible master nieuwe opzet EN aanmaken log bestand in tmp directory
# 12aug25  B44 en B45 Logging via log bestanden in var log directory 
# 13aug25  B46 Canary Channel naar DEV Channel 
#
#
# #######################
# Blok 1F
# Header Script
# #######################
#
#
function luct_display_header () {
    echo '#########################################################################################'
    echo "Linux Universal Configuration Tool (LUCT) Version $Major.$Minor Build $Build Patch $Patch"
    if [[ $ReleaseCandidate == "0" ]]; then
        echo "Channel $Channel"
    else 
        echo "Channel $Channel                      RELEASE CANDIDATE $ReleaseCandidate"
    fi
    echo "Created by John Tutert(TutSOFT) for educational and/or personal use !"
    echo '#########################################################################################'
    echo ''
}
#
#
# #######################
# Blok 1G
# Openingssscherm gebruiker script
# #######################
#
#
clear
luct_display_header
echo 'Implemented and fully tested Linux distributions are:'
echo '- Debian  12      Bookworm'
echo '- Ubuntu  24 LTS  Noble Numbat'
echo ''
echo 'Features for the next version(s), which are already partially included in this version:'
echo '- Ansible'
echo '- Interactive menu' 
echo '- Linux Mint Debian 5/6 and Ubuntu 21/22'
echo ''
echo 'Developed and tested using virtual machines from the Linux VM Images website'
echo ''
echo 'Running this script normally takes at least 20 minutes. Can be slower because of memory, CPU and internet speed.'
echo 'Running this script on a laptop running on only battery power is NOT recommended.'
echo ''
#
#
# #######################
# Blok 1G
# Starttijd script
# #######################
#
#
TARGET_TIMEZONE="Europe/Amsterdam"
CURRENT_TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
if [ "$CURRENT_TIMEZONE" != "$TARGET_TIMEZONE" ]; then
    timedatectl set-timezone "$TARGET_TIMEZONE" > /dev/null 2>&1
fi 
#
logger "Timezone changed by LUCT $Major.$Minor Build $Build $Patch Channel $Channel"
#
echo "Starttijd" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
timedatectl status | sudo tee -a /var/log/luct.log > /dev/null 2>&1
#

#
#
#
# ################################################################################
# ################################################################################
#
# BLOK 2
# Argumenten Script
#
# ################################################################################
# ################################################################################
#
#
# #######################
# Blok 2A
# Rechten
# #######################
#
#
# Controleer ROOT rechten voor het script 
#
luct_phase_one_time=$(date)
echo "Phase 1 $luct_phase_one_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
#
if [ $(id -u) -ne 0 ]; then
    clear
    luct_display_header
    echo '## Phase 1 - Checking executing rights'
    echo ''
    echo "Script started as user $USER"
    echo 'Script NOT started with ROOT rights !'
    echo ''
    echo 'Please start script with sudo in advance for the correct rights to execute !'
    echo ''
    echo 'Terminate script execution ...'
    logger "LUCT Version $Major.$Minor Build $Build Patch $Patch Terminated at Phase 1"
    exit 1
else
    echo '## Phase 1 - Checking executing rights'
fi
#
#
# #######################
# Blok 2B
# Argument 1
# #######################
#
#
# Eerste parameter bijvoorbeeld docker
#
luct_phase_two_time=$(date)
echo "Phase 2 $luct_phase_two_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
#
echo '## Phase 2 - Checking Script Arguments'
if [ $# -eq 0 ]; then
    echo 'No parameter specified !' 
    echo ''
    echo 'Available parameters:'
    echo 'upgrade    Upgrade operating system and applications'
    echo 'network    Change networking settings for EduRoam'
    echo 'docker     Docker with demo environment'
    echo 'podman     Podman with demo environment'
    echo 'minikube   Minikube with demo environment'
    echo 'iacmaster  Ansible master with demo environment'
    echo 'iacslave   Configure Ansible slave'
    echo 'omv        Open Media Vault on Debian'
    echo ''
    echo 'Please specify parameter while starting the script !'
    echo ''
    echo 'Terminate script execution ...'
    #
    luct_end_time=$(date)
    echo "Einde $luct_end_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    logger "LUCT Version $Major.$Minor Build $Build Patch $Patch Terminated at Phase 2"
    exit 1
fi
#
#
# #######################
# Blok 2C
# Argument 2
# #######################
#
#
# Eerste parameter bijvoorbeeld docker
actie=${1,,}
# Tweede parameter
# Geldig zijn
# test om script sneller te doorlopen en meer meldingen te krijgen
# docker of podman voor container engine van minikube 
modus=${2,,}
#
#
if [[ ! "$modus" ]];then
    modus="leeg"
fi
#
echo "Actie $actie" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
echo "Modus $modus" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
#
# #######################
# Blok 2D
# Settings
# #######################
#
#
luct_phase_three_time=$(date)
echo "Phase 3 $luct_phase_three_time $USER $SUDO_USER" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
#
echo '## Phase 3 - Checking Script running mode'
#
#
# SET E
# Script laten stoppen zodra fout ## Script wordt hiedoor instabiel en daarom uitgezet 
# set -e
#
#
# SET X
# Debug modus aanzetten
if [[ $modus == "test" ]]; then
    echo 'DEBUG Mode is ON'
    set -x
fi
#
#
# ################################################################################
# ################################################################################
#
# BLOK 3
# Vullen Variabelen Script
#
# ################################################################################
# ################################################################################
#
#
# #######################
# Blok 3A
# Variabelen Script 
# #######################
#
#
luct_phase_four_time=$(date)
echo "Phase 4 $luct_phase_four_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
#
echo '## Phase 4 - Collecting current Linux Distribution information'
#
if [ -f /etc/os-release ]; then
    # Punt is gelijk aan Source commando
    . /etc/os-release
    distro=$(echo "$ID" | tr '[:upper:]' '[:lower:]')
    versie=$(echo "$VERSION_ID" | tr '[:upper:]' '[:lower:]')
    #
    if [[ $distro == "debian" ]]; then
        deb_vers_oud=$(cat /etc/debian_version | tr '[:upper:]' '[:lower:]')
    fi
    #
    if [[ $distro == "ubuntu" ]]; then
        ulx_vers_oud=$VERSION
    fi
    #
    echo "You are running $distro $versie as Operating System"
    echo "LUCT is running on $distro $versie" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
fi
#
#
# ################################################################################
# ################################################################################
#
# BLOK 4
# Definitie Functies Script
#
# ################################################################################
# ################################################################################
#
#
# #######################
# Blok 4A
# Melding Scherm 
# #######################
#
#
luct_phase_five_time=$(date)
echo "Phase 5 $luct_phase_five_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
#
echo '## Phase 5 - Define Functions for this Script'
#
#
# ################################################################################
#
# Blok 4B                                                  #####
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES              #     #
# ALPINE LINUX                                           #       #
#                                                        #########
# Planned for 2026                                       #       #
#                                                        #       #
#                                                        #       #
#
# ################################################################################
#
#
#
#
#   #######################
#   Blok 4B-1    Function Alpine 
#                Bijwerken
#   #######################
#
#
#
#
function alx_os_upgrade_full () {
    apk update -q
    apk upgrade -q
    apk fix -d -q
    apk add open-vm-tools 
}
#
#
#
#
# ################################################################################
#
# Blok 4C                                                #########
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES             #   #   #
# BuildRoot (Minikube VM) LINUX                          #   #   #
#                                                        #   #   #
#                                                        #   #   #
#                                                        #   #   #
#                                                        #   #   #
#
# ################################################################################
#
#
#
#
#   #######################
#   Blok 4C-1  BuildRoot 
#              Function Docker Compose Installation 
#   #######################
#
#
#
#
function build_install_docker_compose_plugin () {
    #
    mkdir -p /home/$SUDO_USER/.docker/cli-plugins
    curl -s -SL https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-linux-x86_64 -o /home/$SUDO_USER/.docker/cli-plugins/docker-compose
    chmod a+x /home/$SUDO_USER/.docker/cli-plugins/docker-compose
    #
}
#
#
#
#
# ################################################################################
#
# Blok 4D                                                        #
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES                     #
# Debian LINUX                                                   #
#                                                        #########
#                                                        #       #
#                                                        #       #
#                                                        #########
#
# ################################################################################
#
#
#
#
# Blok 4D-1 CATEGORIE 1 OS Functies
#
#
#
#
# Blok 4D-2 CATEGORIE 2 Install Software Functies
#
#
#
#
#   #######################
#   4D-2-1    Debian OS Install Software Functies
#             Functie Installatie Open Media Vault 
#             Debian OMV
#   #######################
#
#
function deb_install_omv () {
    #
    wget -q -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash
    #
# Open Media Vault NAS Install
}
#
#
#
#
# Blok 4D-3 CATEGORIE 3 Configuratie Functies
#
#
#
#
#   #######################
#   4D-3-1    Debian Configuratie Functies
#             Functie Change DNS OS
#             Onderdeel van Debian Nested OOBE Functie
#   #######################
#
#
function deb_config_dns_settings () {
    #
    #   #########################################################
    #   Stap 1: Detecteer actieve netwerkinterface (eth* of ens*)
    #   #########################################################
    #
    interface=$(ip -o link show | awk -F': ' '/^[0-9]+: (eth|ens)/ {print $2}' | head -n 1)
    #
    if [[ -n "$interface" ]]; then
        #
        #   #########################################################
        #   Stap 2: Bepaal het configuratiebestand voor Debian
        #   #########################################################
        #
        interfaces_file="/etc/network/interfaces"
        
        #
        #   #########################################################
        #   Stap 3: Maak een backup van het huidige bestand 
        #   #########################################################
        #
        backup_file="${interfaces_file}.bak.$(date +%Y%m%d%H%M%S)"
        cp "$interfaces_file" "$backup_file"
        #
        #   #########################################################
        #   Stap 4: Genereer nieuwe configuratie
        #   #########################################################
        #
        # Verwijder bestaande dns-nameservers regels voor de interface
        sed -i "/^dns-nameservers/d" "$interfaces_file"
        sed -i "/^iface $interface inet dhcp/a\    dns-nameservers 145.2.14.10 145.2.14.11 8.8.8.8 8.8.4.4" "$interfaces_file"
        
        # Als de interface nog niet als dhcp is geconfigureerd, voeg het toe
        if ! grep -q "iface $interface inet dhcp" "$interfaces_file"; then
            cat <<EOF >> "$interfaces_file"

auto $interface
iface $interface inet dhcp
    dns-nameservers 145.2.14.10 145.2.14.11 8.8.8.8 8.8.4.4
EOF
        fi
        #
        #   #########################################################
        #   Stap 5: Pas netwerkinstellingen toe
        #   #########################################################
        #
        # Herstart de netwerkinterface
        ifdown "$interface" > /home/$SUDO_USER/luct-logs/ulx_os_config_dns.log 2>&1
        ifup "$interface" >> /home/$SUDO_USER/luct-logs/ulx_os_config_dns.log 2>&1
    else
        echo 'No valid network interface found (eth* or ens*)'
    fi
}
#
#
#
#
# ################################################################################
#
# Blok 4E                                                        # #       #
# DECLARATIE Debian en Ubuntu Gezamenlijke functies              # #       #
# Debian 12                                                      # #       #
# Ubuntu 24                                              ######### #       #
#                                                        #       # #       #
#                                                        #       # #       #
#                                                        ######### #########
#
# ################################################################################
#
#
#
#
# Blok 4E-1 CATEGORIE 1 OS FUNCTIES
#
#
#
#
#   #######################
#   Blok 4E-1-1    Debian Ubuntu OS FUNCTIES
#                  Functie debulx os update apt
#                  Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_os_update_apt () {
    apt update -qq > /dev/null 2>&1
}
#
#
#
#
#   #######################
#   Blok 4E-1-2    Debian Ubuntu OS FUNCTIES
#                  Functie debulx os upgrade packages 
#                  Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
# Phase 8
#
#
#
function debulx_os_upgrade_packages () {
    #
    luct_upgrade_os_start_time=$(date)
    echo "Start OS Upgrade $luct_upgrade_os_start_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $modus = "test" ]]; then
        apt full-upgrade -y
        apt install python3-distupgrade -y 
    else
        apt full-upgrade -y > /dev/null 2>&1
        apt install python3-distupgrade -y > /dev/null 2>&1
    fi
    if [[ $modus = "test" ]]; then
        apt autoremove -y
    else
        apt autoremove -y > /dev/null 2>&1
    fi
    #
    luct_upgrade_os_end_time=$(date)
    echo "Einde OS Upgrade $luct_upgrade_os_end_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
}

#
#
#
# Blok 4E-2 CATEGORIE 2 Install Software Functies
#
#
#
#
#   #######################
#   Blok 4E-2-1    Debian Ubuntu OS Install Software Functies
#                  Functie Installatie Default Apps
#                  Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_install_default_apps () {
    #
    luct_install_default_apps_start_time=$(date)
    echo "Start Installatie Default Apps $luct_install_default_apps_start_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $modus == "test" ]]; then
        APT_INSTALL_ARRAY=(
            "7zip"
            "apt-transport-https"
            "ca-certificates"
            "curl"
            "dmidecode"
            "dpkg"
            "git"
            "gnupg"
            "gzip"
            "nano"
            "php"
            "libapache2-mod-php"
            "php-gd"
            "php-imap"
            "php-xml"
            "php-json"
            "php-mbstring"
            "php-mysql"
            "php-intl"
            "php-apcu"
            "php-zip"
            "python3"
            "shellcheck"
            "software-properties-common"
            "tar"
            "unzip"
            "wget"
            "wget2"
            "zip"
        )
    else 
        APT_INSTALL_ARRAY=(
            "7zip"
            "apt-transport-https"
            "ca-certificates"
            "cowsay"
            "curl"
            "default-jdk"
            "dmidecode"
            "dpkg"
            "git"
            "glances"
            "gnupg"
            "gzip"
            "lolcat"
            "mc"
            "micro"
            "nano"
            "neofetch"
            "nmap"
            "php"
            "libapache2-mod-php"
            "php-gd"
            "php-imap"
            "php-xml"
            "php-json"
            "php-mbstring"
            "php-mysql"
            "php-intl"
            "php-apcu"
            "php-zip"
            "python3"
            "screenfetch"
            "shellcheck"
            "sl"
            "software-properties-common"
            "tar"
            "unzip"
            "wget"
            "wget2"
            "zip"
        )
    fi
    TOTAL_APT_INSTALL=${#APT_INSTALL_ARRAY[@]}
    CURRENT_APT_INSTALL_COUNT=0
    for apt_install in "${APT_INSTALL_ARRAY[@]}"; do
        CURRENT_APT_INSTALL_COUNT=$((CURRENT_APT_INSTALL_COUNT + 1))
        # Bereken de voortgang in percentage
        PROGRESS=$((CURRENT_APT_INSTALL_COUNT * 100 / TOTAL_APT_INSTALL))
        # Update de progressiebalk
        draw_progress_bar "$PROGRESS"
        if [[ $modus == "test" ]]; then 
            echo "Install of $apt_install in progress ..."
        fi
        apt install "$apt_install" -y >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps_pb.log 2>&1
        if [[ $? -ne 0 ]]; then
            echo "$apt_install could not be installed. Continue with the next one ..."
        fi
    done
    # echo " "
    echo 'Aligning differences between Linux distributions'
    if [[ $distro == "debian" ]]; then
        #
        # Install Ubuntu Snap on Debian
        #
        echo 'Installing Ubuntu Snap Management System from Canonical '
        apt install snapd -y >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps_snap.log 2>&1
        snap install core >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps_snap.log 2>&1
        #
    fi
    if [[ $distro == "ubuntu" ]]; then
        #
        # Ubuntu APT Package Manager
        #
        echo 'Installing Ubuntu driver tools'
        apt install ubuntu-drivers-common -y >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps.log 2>&1
        #
    fi
    # BAT 
    echo 'Installing bat'
    wget -q -O /tmp/bat_0.25.0_amd64.deb https://github.com/sharkdp/bat/releases/download/v0.25.0/bat_0.25.0_amd64.deb
    dpkg -i /tmp/bat_0.25.0_amd64.deb > /dev/null 2>&1
    # Youtube DL
    curl -L https://github.com/ytdl-patched/youtube-dl/releases/download/2025.08.07.19419/youtube-dl -o /usr/local/bin/youtube-dl > /dev/null 2>&1
    chmod a+rx /usr/local/bin/youtube-dl
    #
    # Deze Curl heeft maar beperkt toegang tot bestandssysteem Kan niet gebruik worden voor bijv Docker
    echo 'Installing Snap curl package'
    snap install curl >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps_snap.log 2>&1
    #
    luct_install_default_apps_end_time=$(date)
    echo "Einde Installatie Default Apps $luct_install_default_apps_end_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
}
#
#
#
#
#   #######################
#   Blok 4E-2-2 Debian Ubuntu OS Install Software Functies
#                  Functie Native Installatie Cockpit Management Server
#                  Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_install_cockpit_srv () {
    #
    luct_install_cockpit_start_time=$(date)
    echo "Start Installatie Cockpit $luct_install_cockpit_start_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    # #######################
    # ## Parameters vullen
    # #######################
    . /etc/os-release
    #
    # ######################
    # ## Installeren
    # ######################
    #
    apt install -t ${VERSION_CODENAME}-backports cockpit -y > /home/$SUDO_USER/luct-logs/debulx_install_cockpit_srv.log 2>&1
    #
    # ######################
    # ## Service
    # ######################
    #
    systemctl enable --now cockpit.socket >> /home/$SUDO_USER/luct-logs/debulx_install_cockpit_srv.log 2>&1
    # Aanpassen Poort 
    rm -f /tmp/listen.conf
    echo '[Socket]' > /tmp/listen.conf
    echo 'ListenStream=' >> /tmp/listen.conf
    echo 'ListenStream=8101' >> /tmp/listen.conf
    mkdir -p /etc/systemd/system/cockpit.socket.d/
    cp /tmp/listen.conf /etc/systemd/system/cockpit.socket.d
    # Herstarten
    systemctl daemon-reload >> /home/$SUDO_USER/luct-logs/debulx_install_cockpit_srv.log 2>&1
    systemctl restart cockpit.socket >> /home/$SUDO_USER/luct-logs/debulx_install_cockpit_srv.log 2>&1
    #
    luct_install_cockpit_end_time=$(date)
    echo "Einde Installatie Cockpit $luct_install_cockpit_end_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
# Cockpit
}
#
#
#
#
#   #######################
#   Blok 4E-2-3    Debian Ubuntu OS Install Software Functies
#                  Functie Installatie Container Engine
#                  Onderdeel van Debian Ubuntu Container Engine Nested Functie
#   #######################
#
#
#
#
function debulx_install_conteng () {
    #
    luct_install_conteng_start_time=$(date)
    echo "Start Installatie Container Engine $luct_install_conteng_start_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    # DOCKER
    if [[ $actie = "docker" || $actie = "minikube" ]]; then
        # 
        echo 'Removing any installed container daemon'
        apt purge container* -y > /dev/null 2>&1
        # apt purge -qq -y container* || true
        apt autoremove -y > /dev/null 2>&1
        #
        echo 'Removing any installed version of Docker'
        apt purge docker* -y > /dev/null 2>&1
        # apt purge -qq -y docker* || true
        apt autoremove -y > /dev/null 2>&1
        #
        echo 'Removing any installed version of Podman'
        apt purge podman* -y > /dev/null 2>&1
        # apt purge -qq -y podman* || true
        apt autoremove -y > /dev/null 2>&1
        #
        echo 'Removing any installed version of Runc'
        apt purge runc* -y > /dev/null 2>&1
        # apt purge -qq -y runc* || true
        apt autoremove -y > /dev/null 2>&1
        #
        echo 'Installing Docker and Compose plugin'
        apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y > /home/$SUDO_USER/luct-logs/debulx_install_docker.log 2>&1
        #
        docker -v | sudo tee -a /var/log/luct.log > /dev/null 2>&1
        docker compose version | sudo tee -a /var/log/luct.log > /dev/null 2>&1
        #
        echo "Adding current user $SUDO_USER to security group Docker"
        usermod -a -G docker $SUDO_USER
        if [[ $modus = "test" ]]; then
            echo 'Einde installatie Docker'
        fi 
    fi
    # PODMAN
    if [[ $actie = "podman" ]]; then
        #
        echo 'Removing any installed container daemon'
        apt purge container* -y > /dev/null 2>&1
        # apt purge -qq -y container* || true
        apt autoremove -y > /dev/null 2>&1
        #
        echo 'Removing any installed version of Docker'
        apt purge docker* -y > /dev/null 2>&1
        # apt purge -qq -y docker* || true
        apt autoremove -y > /dev/null 2>&1
        #
        echo 'Removing any installed version of Podman'
        apt purge podman* -y > /dev/null 2>&1
        # apt purge -qq -y podman* || true
        apt autoremove -y > /dev/null 2>&1
        #
        echo 'Removing any installed version of Runc'
        apt purge runc* -y > /dev/null 2>&1
        # apt purge -qq -y runc* || true
        apt autoremove -y > /dev/null 2>&1
        #
        echo 'Installing Podman'
        apt install -y podman > /home/$SUDO_USER/luct-logs/debulx_install_podman.log 2>&1
        echo 'Starting Podman service'
        systemctl enable --now podman >> /home/$SUDO_USER/luct-logs/debulx_install_podman.log 2>&1
        #
        podman -v | sudo tee -a /var/log/luct.log > /dev/null 2>&1
        podman auto-update
        #
        echo 'Adding Docker Registry to Podman'
        # Docker IO Registry toevoegen aan lijst omdat standaard niet aanwezig is
        sed -i '$a[registries.search]' /etc/containers/registries.conf
        sed -i '$aregistries = ["docker.io"]' /etc/containers/registries.conf
        # Cockpit Podman installeren en starten 
        echo 'Installing Podman Cockpit integration'
        apt install cockpit-podman -y >> /home/$SUDO_USER/luct-logs/debulx_install_podman.log 2>&1
        systemctl enable --now cockpit.socket podman.service >> /home/$SUDO_USER/luct-logs/debulx_install_podman.log 2>&1
        systemctl restart cockpit.socket >> /home/$SUDO_USER/luct-logs/debulx_install_podman.log 2>&1
    fi
    #
# Install Container Engine
}
#
#
#
#
#   #######################
#   BLOK 4E-2-4    Debian Ubuntu OS Install Software Functies
#                  Functie Installatie OS Powershell
#                  Onderdeel van Debian Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_install_pwrshell () {
    #
    pwsh --command Get-Host > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        apt install powershell -y >> /home/$SUDO_USER/luct-logs/luct_pwsh.log 2>&1
        rm /tmp/packages-microsoft-prod.deb >> /home/$SUDO_USER/luct-logs/luct_pwsh.log 2>&1
    fi
    #
# Install Powershell
}
#
#
#
#   #######################
#   BLOK 4E-2-5    Debian Ubuntu OS Install Software Functies
#                  Functie Installatie Minikube
#                  Minikube Kubeadm Kubectl
#   #######################
#
#
# PHASE 11
#
#
function debulx_install_minikube_and_k8stools () {
    #
    luct_install_minikube_start_time=$(date)
    echo "Start Installatie Minikube $luct_install_minikube_start_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    echo '## Phase 11 - Installing latest version of Minikube and tools'
    # 
    # Bij installatie Docker of Podman wordt ALTIJD ook Minikube geinstalleerd 
    #
    if ! [ -x "$(command -v minikube)" ]; then
        # LET OP Geen Snap Curl gebruiken 
        curl -s -o /tmp/minikube_latest_amd64.deb https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
        dpkg -i /tmp/minikube_latest_amd64.deb > /home/$SUDO_USER/luct-logs/luct_minikube.log 2>&1
        rm /tmp/minikube_latest_amd64.deb
    fi 
    #
    minikube version > /home/$SUDO_USER/luct-logs/luct_minikube.log 2>&1
    minikube version | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    apt install kubeadm kubectl kubecolor -y > /dev/null 2>&1
    #
    kubeadm version > /home/$SUDO_USER/luct-logs/luct_minikube.log 2>&1
    kubectl version > /home/$SUDO_USER/luct-logs/luct_minikube.log 2>&1
    kubecolor version > /home/$SUDO_USER/luct-logs/luct_minikube.log 2>&1
    #
    luct_install_minikube_end_time=$(date)
    echo "Einde Installatie Minikube $luct_install_minikube_end_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
# Minikube en Tools
}
#
#
#
#   #######################
#   BLOK 4E-2-6    Debian Ubuntu OS Install Software Functies
#                  Functie Installatie Ansible
#                  Ansible Master Slave
#   #######################
#
#
#   WERK IN UITVOERING 
#
#
#
function debulx_install_ansible_master_slave () {
    #
    rol=$1
    #
    apt install sshpass -y
    #
    if [[ $rol == "master" ]]; then
        #
        # MASTER stap 1
        # Installeren Ansible Controller
        echo 'Installing Ansible'
        apt install ansible -y
        # MASTER stap 2
        # Hosts bestand aanpassen
        echo 'Changing HOSTS file'
        network_interface=$(ip -o link show | awk '$2 ~ /^(eth|ens)[0-9]+:/ {print $2}' | sed 's/:$//' | head -n 1)
        if [ -n "$network_interface" ]; then
            network_ip=$(ip -o -4 addr show dev "$network_interface" | awk '{print $4}' | cut -d/ -f1)
            IFS=. read -r a b c d <<< "$network_ip"
            # Bepaal eigen IP adres plus 1
            network_plus1_ip="$a.$b.$c.$((d+1))"
            network_ip_var="network_ip=$network_ip"
            network_plus1_ip_var="network_plus1_ip=$network_plus1_ip"
            # Bepaal eigen IP adres min 1
            network_min1_ip="$a.$b.$c.$((d-1))"
            network_ip_var="network_ip=$network_ip"
            network_min1_ip_var="network_plus1_ip=$network_min1_ip"
            # Aanpassen hosts bestand 
            if grep -q "$network_ip" /etc/hosts; then
                echo "$HOSTNAME already exists in /etc/hosts"
            else
                echo "$network_ip $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
                # TO DO versie 4.2
                # Naam van de slaaf moet nog dynamisch worden gemaakt
                echo "$network_plus1_ip D12-BKW-M-IAC-S01" | sudo tee -a /etc/hosts > /dev/null > /dev/null 2>&1
                echo "Hostname $HOSTNAME added to /etc/hosts"
            fi
        fi
        # MASTER stap 3a
        # Inventory bestand op de juiste plek zetten
        echo 'Ansible Inventory'
        mkdir -p /etc/ansible/inventory 
        cp /home/$SUDO_USER/demos/Ansible/Guest/Inventory/ansible-demo-inventory-LUCT-4 /etc/ansible/inventory
        # MASTER Stap 3b
        # Inventory bestand voorzien van de juiste gegevens
        WORD_TO_REPLACE="gebruikersnaam"
        sed -i "s/$WORD_TO_REPLACE/$SUDO_USER/g" /etc/ansible/inventory/ansible-demo-inventory-LUCT-4
        #
        WORD_TO_REPLACE="wachtwoord"
        sed -i "s/$WORD_TO_REPLACE/$SUDO_USER/g" /etc/ansible/inventory/ansible-demo-inventory-LUCT-4
        #
        WORD_TO_REPLACE="machinenaam"
        if [[ $distro == "debian" ]]; then
            SLAVE="D12-BKW-M-IAC-S01"
            sed -i "s/$WORD_TO_REPLACE/$SLAVE/g" /etc/ansible/inventory/ansible-demo-inventory-LUCT-4
        fi
        if [[ $distro == "ubuntu" ]]; then
            SLAVE="U24-LTS-S-IAC-S01"
            sed -i "s/$WORD_TO_REPLACE/$SLAVE/g" /etc/ansible/inventory/ansible-demo-inventory-LUCT-4
        fi
        # MASTER stap 4
        # Aanpassen Ansible configuratie voor inventory
        if grep -q "defaults" /etc/ansible/ansible.cfg; then
            echo "Ansible Configuratiebestand reeds voorzien van Inventory"
        else
            # Add the hostname and IP address to /etc/hosts
            echo "[defaults]" | sudo tee -a /etc/ansible/ansible.cfg > /dev/null 2>&1
            echo "inventory = inventory/" | sudo tee -a /etc/ansible/ansible.cfg > /dev/null 2>&1
            echo "Ansible Configuratiebestand voorzien van Inventory"
        fi
        # MASTER stap 5
        # Playbooks op de juiste plek zetten
        echo 'Playbooks'
        mkdir -p /home/$SUDO_USER/playbooks
        chown -f -R $SUDO_USER /home/$SUDO_USER/playbooks
        cp /home/$SUDO_USER/demos/Ansible/Guest/Playbooks/Linux/*.yml /home/$SUDO_USER/playbooks
        # MASTER stap 6
        # Ansible Semaphore installeren
        snap install semaphore
        snap stop semaphore
        semaphore user add --admin --login labadmin --name=labadmin --email=labadmin@mail.local --password=labadmin
        semaphore user add --admin --login $SUDO_USER --name=$SUDO_USER --email=$SUDO_USER@mail.local --password=$SUDO_USER
        snap start semaphore
        snap set semaphore port=8301
        snap restart semaphore
        if [[ $distro == "debian" ]]; then
            echo 'echo Uitvoeren als user Vagrant en niet als Root' > /home/$SUDO_USER/ansible_host_ssh.sh
            echo "sshpass -p $SUDO_USER ssh -o StrictHostKeyChecking=no $SUDO_USER@D12-BKW-M-IAC-S01" > /home/$SUDO_USER/ansible_host_ssh.sh 
            chmod +x /home/$SUDO_USER/ansible_host_ssh.sh
        fi
        if [[ $distro == "ubuntu" ]]; then
            echo 'echo Uitvoeren als user Vagrant en niet als Root' > /home/$SUDO_USER/ansible_host_ssh.sh
            echo "sshpass -p $SUDO_USER ssh -o StrictHostKeyChecking=no $SUDO_USER@U24-LTS-S-IAC-S01" > /home/$SUDO_USER/ansible_host_ssh.sh 
            chmod +x /home/$SUDO_USER/ansible_host_ssh.sh
        fi
    # Ansible Master
    fi
    #
    if [[ $rol == "slave" ]]; then
        # SLAVE stap 2
        # Optie ETH
        eth_interface=$(ip -o link show | awk '$2 ~ /^eth[0-9]+:/ {print $2}' | sed 's/:$//' | head -n 1)
        if [ -n "$ens_interface" ]; then
            eth_ip=$(ip -o -4 addr show dev "$eth_interface" | awk '{print $4}' | cut -d/ -f1)
            IFS=. read -r a b c d <<< "$eth_ip"
            eth_min1_ip="$a.$b.$c.$((d-1))"
            # Sla de IP-adressen op in afzonderlijke variabelen
            eth_ip_var="eth_ip=$eth_ip"
            eth_min1_ip_var="eth_plus1_ip=$eth_min1_ip"
            # Aanpassen hosts bestand 
            if grep -q "$eth1_ip" /etc/hosts; then
                echo "$HOSTNAME already exists in /etc/hosts"
            else
                echo "$eth_ip $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null 2>&1
                echo "$eth_min1_ip D12-BKW-M-IAC-S01" | sudo tee -a /etc/hosts > /dev/null 2>&1
                echo "Hostname $HOSTNAME added to /etc/hosts"
            fi
        fi
        # SLAVE stap 2
        # Optie ENS
        ens_interface=$(ip -o link show | awk '$2 ~ /^ens[0-9]+:/ {print $2}' | sed 's/:$//' | head -n 1)
        if [ -n "$ens_interface" ]; then
            ens_ip=$(ip -o -4 addr show dev "$ens_interface" | awk '{print $4}' | cut -d/ -f1)
            IFS=. read -r a b c d <<< "$ens_ip"
            ens_min1_ip="$a.$b.$c.$((d-1))"
            # Sla de IP-adressen op in afzonderlijke variabelen
            ens_ip_var="ens_ip=$ens_ip"
            ens_min1_ip_var="ens_plus1_ip=$ens_min1_ip"
            # Aanpassen hosts bestand 
            if grep -q "$eth1_ip" /etc/hosts; then
                echo "$HOSTNAME already exists in /etc/hosts"
            else
                echo "$eth_ip $HOSTNAME" | sudo tee -a /etc/hosts > /dev/null 2>&1
                echo "$eth_min1_ip D12-BKW-M-IAC-S01" | sudo tee -a /etc/hosts > /dev/null 2>&1
                echo "Hostname $HOSTNAME added to /etc/hosts"
            fi
        fi
        if [[ $distro == "debian" ]]; then
            echo 'echo Uitvoeren als user Vagrant en niet als Root' > /home/$SUDO_USER/ansible_host_ssh.sh
            echo "sshpass -p $SUDO_USER ssh -o StrictHostKeyChecking=no $SUDO_USER@D12-BKW-M-IAC-M01" > /home/$SUDO_USER/ansible_host_ssh.sh 
            chmod +x /home/$SUDO_USER/ansible_host_ssh.sh
        fi
        if [[ $distro == "ubuntu" ]]; then
            echo 'echo Uitvoeren als user Vagrant en niet als Root' > /home/$SUDO_USER/ansible_host_ssh.sh
            echo "sshpass -p $SUDO_USER ssh -o StrictHostKeyChecking=no $SUDO_USER@U24-LTS-S-IAC-M01" > /home/$SUDO_USER/ansible_host_ssh.sh 
            chmod +x /home/$SUDO_USER/ansible_host_ssh.sh
        fi
    # Ansible Slave
    fi
# Ansible
}
#
#
#
#
# BLOK 4E-3 CATEGORIE 3 Container Engine
#
#
#
#
# ###############################
# BLOK 4E-3-1  Container Engine
#                 Function Management Tools Install and Run
# ###############################
#
#
#
#
#
function debulx_conteng_install_run_mgmt_tools () {
    #
    conteng=$1
    #
    if [[ $conteng == "docker" ]]; then
        #
        #
        # Overzicht tools
        # https://www.tecmint.com/docker-tools/
        #
        #
        #
        # ###########
        # Dive
        # https://github.com/wagoodman/dive
        # ###########
        #
        # Alternatieve installatiewijze
        # snap install dive   niet aan te bevelen omdat deze manier vernieling doet van docker 
        #
        if [[ $modus == "test" ]]; then
            echo 'Dive'
        fi
        DIVE_VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
        DIVE_DWNLD_URL="https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb"
        wget -q -O /home/$SUDO_USER/tmp/dive_linux_amd64.deb $DIVE_DWNLD_URL
        apt install /home/$SUDO_USER/tmp/dive_linux_amd64.deb >> /home/$SUDO_USER/luct-logs/dive.log 2>&1
        #
        #
        # ###########
        # Dockly 
        # https://github.com/lirantal/dockly
        # ###########
        #
        # Alternatieve instalatiewijze 
        # apt install npm -y
        # npm install -g dockly
        #
        if [[ $modus == "test" ]]; then
            echo 'Dockly'
        fi
        echo 'echo "Dockly wordt gestart als Container"' > /home/$SUDO_USER/dkr-scripts/dkr_run_dockly.sh
        echo 'echo "Druk op q toets om Dockly te verlaten"' >> /home/$SUDO_USER/dkr-scripts/dkr_run_dockly.sh
        echo 'echo read -p "Druk op Enter om verder te gaan..." dummy' >> /home/$SUDO_USER/dkr-scripts/dkr_run_dockly.sh
        echo "docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock lirantal/dockly" >> /home/$SUDO_USER/dkr-scripts/dkr_run_dockly.sh
        chmod +x /home/$SUDO_USER/dkr-scripts/dkr_run_dockly.sh
        #
        #
        # ###########
        # Dry
        # https://github.com/moncho/dry
        # ###########
        #
        if [[ $modus == "test" ]]; then
            echo 'Dry'
        fi
        echo "docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_HOST=$DOCKER_HOST moncho/dry" > /home/$SUDO_USER/dkr-scripts/dkr_run_dry.sh
        chmod +x /home/$SUDO_USER/dkr-scripts/dkr_run_dry.sh
        #
        #
        # ###########
        # LazyDocker
        # https://github.com/jesseduffield/lazydocker
        # ###########
        #
        if [[ $modus == "LazyDocker" ]]; then
            echo 'Dive'
        fi
        # Haal de nieuwste Lazydocker versie op
        LDV_MET_V=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
        LDV_ZONDER_V="${LDV_MET_V#v}"
        #
        # Zet variabele Download URL met hulp van voorgaande variabelen
        LD_DWNLD_URL="https://github.com/jesseduffield/lazydocker/releases/download/${LDV_MET_V}/lazydocker_${LDV_ZONDER_V}_Linux_x86_64.tar.gz"
        #
        # download nieuwste versie van LazyDocker
        wget -q -O /home/$SUDO_USER/tmp/lazydocker.tar.gz $LD_DWNLD_URL
        #
        # Uitpakken 
        if [[ $distro == "debian" ]]; then
            7zz x /home/$SUDO_USER/tmp/lazydocker.tar.gz -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
            7zz x /home/$SUDO_USER/tmp/lazydocker.tar -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
        fi
        #
        if [[ $distro == "ubuntu" ]]; then
            7z x /home/$SUDO_USER/tmp/lazydocker.tar.gz -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
            7z x /home/$SUDO_USER/tmp/lazydocker.tar -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
        fi
        #
        # Overzetten
        mv /home/$SUDO_USER/tmp/lazydocker /usr/local/bin/lazydocker >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
        #
        # Uitvoerbaar maken 
        chmod +x /usr/local/bin/lazydocker >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
        #
        echo 'sudo lazydocker' > /home/$SUDO_USER/dkr-scripts/dkr_lazydocker_run.sh
        chmod +x /home/$SUDO_USER/dkr-scripts/dkr_lazydocker_run.sh
    fi
    if [[ $conteng == "podman" ]]; then
        echo 'Cockpit is available as management tool for Podman'
    fi 
# Container Engine Management Tools 
}
#
#
#
#
# ################################################
# Blok 4E-3-2     Container Engine
#                 Images Pull 
# ###############################################
#
#
#
#
function debulx_conteng_images_pull () {
    #
    luct_conteng_images_pull_start_time=$(date) 
    echo "Start container images laden $luct_conteng_images_pull_start_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    local containerengine=$1
    #
    if [[ $modus == "test" ]]; then
        DOCKER_IMAGES=(
            "containrrr/watchtower:latest"
            "codercom/code-server:latest"
            "portainer/portainer-ce:latest"
            "registry:latest"
            "selfhostedpro/yacht:latest"
            "jenkins/jenkins:latest-jdk21"
        )
    else
        DOCKER_IMAGES=(
            "alpine:latest"
            "amazonlinux:latest"
            "clearlinux:latest"
            "containrrr/watchtower:latest"
            "codercom/code-server:latest"
            "debian:latest"
            "httpd:latest"
            "minio/minio:latest"
            "nginx:latest"
            "photon:latest"
            "portainer/portainer-ce:latest"
            "registry:latest"
            "selfhostedpro/yacht:latest"
            "wordpress:latest"
            "alpine:3.5"
            "prakhar1989/static-site"
            "jenkins/jenkins:latest-jdk21"
        )
    fi
    #
    TOTAL_IMAGES=${#DOCKER_IMAGES[@]}
    CURRENT_IMAGE_COUNT=0
    #
    for image in "${DOCKER_IMAGES[@]}"; do
        CURRENT_IMAGE_COUNT=$((CURRENT_IMAGE_COUNT + 1))
        # Bereken de voortgang in percentage
        PROGRESS=$((CURRENT_IMAGE_COUNT * 100 / TOTAL_IMAGES))
        # Update de progressiebalk
        draw_progress_bar "$PROGRESS"
        # echo " "
        if [[ $modus == "test" ]]; then
            echo "Pull van image $image"
        fi
        $containerengine pull -q "$image" > /dev/null 2>&1
        if [[ $? -ne 0 ]]; then
            echo "Error loading image $image. Pulling next image ..."
        fi
    done
    #
    echo " "
    #
    $containerengine images > /home/$SUDO_USER/luct-logs/debulx_docker_images_pull.log 2>&1
    #
    luct_conteng_images_pull_end_time=$(date) 
    echo "Einde container images laden $luct_conteng_images_pull_end_time" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
}
#
#
#
#
# ################################################
# Blok 4E-3-3    Container Engine
#                Portainer
# ###############################################
#
#
#
#
function debulx_conteng_portainer_run () {
    #
    echo "Portainer" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $modus == "test" ]]; then
        echo 'Portainer'
    fi
    #
    local containerengine=$1
    #
    $containerengine volume create portainer_data > /dev/null 2>&1
    #
    # Docker Run Portainer
    # HOST PORT / CONTAINER PORT
    # Poorten
    # Port 8000: Used for the TCP tunnel server, primarily for Edge Agent communication and is optional if not using Edge Compute features. 
    # Port 9443: Used by the Portainer Server for accessing the user interface (UI) and API. This is the default HTTPS port for Portainer
    # Port 9001: The default port used by the Portainer Agent to communicate with the Portainer Server. 
    #
    #
    if [[ $containerengine == "docker" ]]; then
        $containerengine run -d -p 8000:8000 -p 9101:9443 --name LUCT_portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest >> /home/$SUDO_USER/luct-logs/luct_start_Portainer.log 2>&1
    fi
    #
    if [[ $containerengine == "podman" ]]; then
        $containerengine run -d -p 8000:8000 -p 9101:9443 --name LUCT_portainer --restart=always -v /var/run/podman/podman.sock:/var/run/podman/podman.sock -v portainer_data:/data portainer/portainer-ce:latest >> /home/$SUDO_USER/luct-logs/luct_start_Portainer.log 2>&1
    fi
    #
    #
    # Bash Shell Script maken Portainer dkr-scripts
    echo '#! /bin/bash' > /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    #
    echo "$containerengine stop portainer" >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    echo "$containerengine start portainer" >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    #
    echo 'echo "Portainer is beschikbaar op"' >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    echo 'echo ""' >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    #
    if ip link show ens33 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show ens33 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
        echo 'echo "https://$IP:9101"' >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    fi
    #
    if ip link show eth0 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
        echo 'echo "https://$IP:9101"' >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    fi
    #
    echo 'echo ""' >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    #
    echo 'echo "Start Webbrowser op PC of Laptop en ga naar bovenstaand adres"'          >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    echo 'echo ""'          >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    echo 'echo "Gebruik onderstaande gegevens op het eerste scherm"'          >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    echo 'echo ""'          >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    echo 'echo "Gebruiker admin"' >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    echo 'echo "Wachtwoord password1234"' >> /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    #
    chmod +x /home/$SUDO_USER/dkr-scripts/portainer_restart.sh
    #
}
#
#
#
#
# ################################################
# Blok 4E-3-4    Container Engine
#                Yacht
# ###############################################
#
#
#
#
function debulx_conteng_yacht_run () {
    #
    echo "Yacht" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $modus == "test" ]]; then
       echo 'Yacht'
    fi
    #
    local containerengine=$1
    #
    $containerengine volume create yacht_data > /home/$SUDO_USER/luct-logs/debulx_docker_yacht_run.log 2>&1
    #
    if [[ $containerengine == "docker" ]]; then
        $containerengine run -d -p 9102:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht_data:/config --name LUCT_Yacht --restart=always selfhostedpro/yacht >> /home/$SUDO_USER/luct-logs/luct_start_Yacht.log 2>&1
    fi
    #
    if [[ $containerengine == "podman" ]]; then
        $containerengine run -d -p 9102:8000 -v /var/run/podman/podman.sock:/var/run/podman/podman.sock -v yacht_data:/config --name LUCT_Yacht --restart=always selfhostedpro/yacht >> /home/$SUDO_USER/luct-logs/luct_start_Yacht.log 2>&1
    fi
    #
    # Bash Shell Script maken Yacht dkr-scripts
    echo '#! /bin/bash' > /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    #
    echo "$containerengine stop yacht" >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    echo "$containerengine start yacht" >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    #
    echo 'echo "Yacht is beschikbaar op"' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    echo 'echo ""' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    #
    if ip link show ens33 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show ens33 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
        echo 'echo "https://$IP:9102"' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    fi
    #
    if ip link show eth0 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
        echo 'echo "https://$IP:9102"' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    fi
    #
    echo 'echo ""' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    #
    echo 'echo "Start Webbrowser op PC of Laptop en ga naar bovenstaand adres"' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    echo 'echo ""' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    echo 'echo "Gebruik onderstaande gegevens op het eerste scherm"' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    echo 'echo ""' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    echo 'echo "Gebruiker admin@yacht.local"' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    echo 'echo "Wachtwoord pass"' >> /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    #
    chmod +x /home/$SUDO_USER/dkr-scripts/yacht_restart.sh
    #
    # Aanmaken bestand met inloggegeven Yacht
    #
    echo "Gebruiker admin@yacht.local" > /home/$SUDO_USER/yacht_credentials.txt 
    echo "Wachtwoord pass" >> /home/$SUDO_USER/yacht_credentials.txt 
    #
}
#
#
#
#
# ################################################
# Blok 4E-3-5    Container Engine
#                Visual Studio Code Server
# ###############################################
#
#
#
#
function debulx_conteng_vscsrv_run () {
    #
    echo "Visual Studio Code Server" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $modus == "test" ]]; then
       echo 'Visual Studio Code Server'
    fi
    #
    local containerengine=$1
    #
    CONTAINER_NAME="LUCT_VSC_Server"
    PROJECT_DIR="/home/$SUDO_USER/demos"
    DOCKER_IMAGE="codercom/code-server:latest"
    #
    $containerengine run -d -p 9103:8080 -v "$PROJECT_DIR:/home/coder/project" --name "$CONTAINER_NAME" --restart=always "$DOCKER_IMAGE" --auth=none >> /home/$SUDO_USER/luct-logs/luct_start_vsc_srv.log 2>&1
    #
    # In Visual Studio Code Server is lokale omgeving zichtbaar onder Project
    #
}
#
#
#
#
# ################################################
# Blok 4E-3-6    Container Engine
#                Jenkins
# ###############################################
#
#
#
#
function debulx_conteng_jenkins_run () {
    #
    echo "Jenkins" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $modus == "test" ]]; then
       echo 'Jenkins'
    fi
    #
    local containerengine=$1
    #
    $containerengine volume create jenkins_data > /home/$SUDO_USER/luct-logs/debulx_docker_jenkins_run.log 2>&1
    #
    $containerengine run -d --name LUCT_Jenkins -p 9104:8080 -p 50000:50000 --restart=always -v jenkins_data:/var/jenkins_home jenkins/jenkins:latest-jdk21 >> /home/$SUDO_USER/luct-logs/luct_start_jenkins.log 2>&1
    #
}
#
#
#
#
# ################################################
# Blok 4E-3-7    Container Engine
#                Registry
# ###############################################
#
#
#
#
function debulx_conteng_registry_run () {
    #
    echo "Registry" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $modus == "test" ]]; then
        echo 'Registry'
    fi
    #
    local containerengine=$1
    #
    $containerengine run -d -p 9105:5000 --restart always --name registry registry > /home/$SUDO_USER/luct-logs/luct_start_registry.log 2>&1 
    #
} 
#
#
#
#
# ################################################
# Blok 4E-3-8    Container Engine
#                WatchTower
# ###############################################
#
#
#
#
function debulx_conteng_watchtower_run () {
    #
    echo "WachTower" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $modus == "test" ]]; then
        echo 'WatchTower'
    fi
    #
    local containerengine=$1
    #
    #
    # ###########
    # WatchTower
    # https://github.com/containrrr/watchtower
    # ###########
    #
    if [[ $containerengine == "docker" ]]; then
        $containerengine run -d -p 9106:8080 --restart always --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower >> /home/$SUDO_USER/luct-logs/luct_start_WachTower.log 2>&1
    fi
    if [[ $containerengine == "podman" ]]; then
        $containerengine run -d -p 9106:8080 --restart always --name watchtower -v /var/run/podman/podman.sock:/var/run/podman/podman.sock containrrr/watchtower >> /home/$SUDO_USER/luct-logs/luct_start_WachTower.log 2>&1
    fi
}
#
#
#
#
# Blok 4E CATEGORIE 4 Ubuntu Configuratie 
#
#
#
#
#
#   #######################
#   Blok 4E-4-1    Debian UBUNTU Configuratie Functies
#                  Functie Config Timezone Amsterdam Europa 
#                  Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_config_taal_nl () {
    #
    # Taal 
    apt install language-pack-nl -y > /dev/null 2>&1
    # Lokale instellingen
    locale-gen nl_NL.UTF-8 > /dev/null 2>&1
    localectl set-locale LANG=nl_NL.UTF-8 > /dev/null 2>&1
    update-locale LANG=nl_NL.UTF-8 > /dev/null 2>&1
    #
# Configuratie Taal Nederlands
}
#
#
#
#
#
#   #######################
#   Blok 4E-4-2    Debian UBUNTU Configuratie Functies
#                  Functie Change OS Repository
#                  Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_config_os_repo_change () {
    if [[ $distro == "debian" ]] ; then
        if [[ $versie == "12" ]] ; then
            sed -i '1c\deb http://mirror.ams.macarne.com/debian/ bookworm main non-free-firmware' /etc/apt/sources.list
            sed -i '2c\deb-src http://mirror.ams.macarne.com/debian/ bookworm main non-free-firmware' /etc/apt/sources.list
        fi
    # Debian
    fi 
    if [[ $distro == "linuxmint" ]] ; then
        if [[ $versie == "21" ]] ; then
            linuxmintnaam = "vanessa"
            ubuntunaam = "jammy"
        fi
        if [[ $versie == "21" ]] ; then
            linuxmintnaam = "vera"
            ubuntunaam = "jammy"
        fi
        if [[ $versie == "21" ]] ; then
            linuxmintnaam = "victoria"
            ubuntunaam = "jammy"
        fi
        if [[ $versie == "21" ]] ; then
            linuxmintnaam = "virgina"
            ubuntunaam = "jammy"
        fi
        if [[ $versie == "22" ]] ; then
            linuxmintnaam = "wilma"
            ubuntunaam = "noble"
        fi
        if [[ $versie == "22.1" ]] ; then
            linuxmintnaam = "xia"
            ubuntunaam = "noble"
        fi
        # Rechten instellen
        chown -R linuxmint:linuxmint /etc/apt/sources.list.d
        chmod -R u+rwx /etc/apt/sources.list.d
        # Verwijder het aanwezige bestand
        rm -f /etc/apt/sources.list.d/official-package-repositories.list
        # Nieuw bestand aanmaken met aangepaste inhoud
        # Triple IT
        echo "deb https://mintlinux.mirror.wearetriple.com/packages $linuxmintnaam main upstream import backport" > /etc/apt/sources.list.d/official-package-repositories.list
        echo ' ' >> /etc/apt/sources.list.d/official-package-repositories.list
        # Ubuntu NL 100 Gbs
        echo "deb http://mirror.ams.macarne.com/ubuntu/ $ubuntunaam-updates main restricted universe multiverse" >> /etc/apt/sources.list.d/official-package-repositories.list
        # Ubuntu NL 50 GBs
        echo "deb https://mirrors.mediascope.group/ubuntu/ $ubuntunaam-updates main restricted universe multiverse" >> /etc/apt/sources.list.d/official-package-repositories.list
        # Ubuntu NL 20 GBs
        echo "deb http://mirror.i3d.net/pub/ubuntu/ $ubuntunaam-updates main restricted universe multiverse" >> /etc/apt/sources.list.d/official-package-repositories.list
        echo ' ' >> /etc/apt/sources.list.d/official-package-repositories.list
        echo "deb http://security.ubuntu.com/ubuntu/ $ubuntunaam-security main restricted universe multiverse" >> /etc/apt/sources.list.d/official-package-repositories.list
    # LinuxMint Ubuntu
    fi 
    if [[ $distro == "lmde" ]] ; then
        if [[ $versie == "5" ]] ; then
            linuxmintnaam = "elsie"
            debiannaam = "bullseye"
        fi
        if [[ $versie == "6" ]] ; then
            linuxmintnaam = "faye"
            debiannaam = "bookworm"
        fi
        # Rechten instellen
        chown -R lmde:lmde /etc/apt/sources.list.d
        chmod -R u+rwx /etc/apt/sources.list.d
        # Verwijder het aanwezige bestand
        rm -f /etc/apt/sources.list.d/official-package-repositories.list
        # Nieuw bestand aanmaken met aangepaste inhoud
        # Triple IT
        echo 'deb https://mintlinux.mirror.wearetriple.com/packages $linuxmintnaam main upstream import backport' > /etc/apt/sources.list.d/official-package-repositories.list
        echo ' ' >> /etc/apt/sources.list.d/official-package-repositories.list
        # Debian NL 100 Gbs
        echo "deb http://mirror.ams.macarne.com/debian/ $debiannaam main contrib non-free" >> /etc/apt/sources.list.d/official-package-repositories.list
        echo "deb http://mirror.ams.macarne.com/debian/ $debiannaam-updates main contrib non-free" >> /etc/apt/sources.list.d/official-package-repositories.list
        echo "deb http://security.debian.org $debiannaam-security main contrib non-free" >> /etc/apt/sources.list.d/official-package-repositories.list
        echo ' ' >> /etc/apt/sources.list.d/official-package-repositories.list
        echo "deb https://deb.debian.org $debiannaam-backports main contrib non-free" >> /etc/apt/sources.list.d/official-package-repositories.list
    # LinuxMint Debian
    fi 
    if [[ $distro == "ubuntu" ]] ; then
        #
        if [[ $versie == "22.04" ]] ; then
            if grep -q "in.archive.ubuntu.com" /etc/apt/sources.list; then
                sed "s@in.archive.ubuntu.com@mirror.ams.macarne.com@" -i /etc/apt/sources.list
            fi
            if grep -q "nl.archive.ubuntu.com" /etc/apt/sources.list; then
                sed "s@nl.archive.ubuntu.com@mirror.ams.macarne.com@" -i /etc/apt/sources.list
            fi
            if grep -q "mirrors.edge.kernel.org" /etc/apt/sources.list; then
                sed "s@mirrors.edge.kernel.org@mirror.ams.macarne.com@" -i /etc/apt/sources.list
            fi 
        fi
        #
        if [[ $versie == "24.04" ]] ; then
            # Vervang tweede tekstregel door nieuwe inhoud 
            # Op regel eronder staat Suites noble noble-updates noble-backports daarom alleen aanpassen host
            sed -i '2c\URIs: http://mirror.ams.macarne.com/ubuntu/' /etc/apt/sources.list.d/ubuntu.sources > /home/$SUDO_USER/luct-logs/add-apt-repository.log
        fi
    # Ubuntu
    fi
    #
}
#
#
#
#
#
#   #######################
#   Blok 4E-4-3    Debian UBUNTU Configuratie Functies
#                  Functie Config Repository
#                  Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_config_add_repositories () {
    #
    # ############################
    # ## Parameters vullen
    # ############################
    #
    . /etc/os-release
    #
    # ############################
    # ## Operating System
    # ############################
    #
    #
    if [[ $distro = "debian" || "ubuntu" ]]; then
        #
        # DataPacket NL 20GBs
        if [[ $modus = "test" ]]; then 
            echo 'NL Datapacket 20Gbs'
        fi
        echo "Datapacket" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
        add-apt-repository http://mirror.nl.datapacket.com/$distro/ -s -y > /dev/null 2>&1
        #
        # UT Twente NL 10GBs
        if [[ $modus = "test" ]]; then 
            echo 'NL UT Twente 10Gbs'
        fi
        echo "UT Twente" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
        add-apt-repository https://ftp.snt.utwente.nl/pub/os/linux/$distro/ -s -y > /dev/null 2>&1
        #
        # Backup 1
        # PilotFiber US 50GBs
        if [[ $modus = "test" ]]; then 
            echo 'US PilotFiber 50GBs'
        fi
        echo "Pilotfiber" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
        add-apt-repository http://mirror.pilotfiber.com/$distro/ -s -y > /dev/null 2>&1
    fi
    if [[ $distro = "linuxmint" ]]; then
        add-apt-repository http://mirror.pilotfiber.com/$distro/ -s -y > /dev/null 2>&1
    fi
    if [[ $distro = "lmde" ]]; then
        add-apt-repository http://mirror.pilotfiber.com/$distro/ -s -y > /dev/null 2>&1
    fi
    #
    # ############################
    # ## Cockpit
    # ############################
    #
    echo "Cockpit" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $distro == "debian" ]]; then
        echo "deb http://deb.debian.org/debian ${VERSION_CODENAME}-backports main" > /etc/apt/sources.list.d/backports.list
    fi
    #
    # ############################
    # ## Docker
    # ############################
    #
    echo "Docker" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    install -m 0755 -d /etc/apt/keyrings
    # LET OP Curl van Ubuntu gebruiken omdat Snap Curl maar beperkt toegang heeft tot filesystem
    rm -f /etc/apt/keyrings/docker.asc
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc > /dev/null 2>&1
    chmod a+r /etc/apt/keyrings/docker.asc
    # Add the repository to Apt sources
    if [[ $distro = "debian" ]]; then
        echo \
          "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
          $(echo "$VERSION_CODENAME") stable" | \
          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 2>&1
    fi
    if [[ $distro = "ubuntu" ]]; then
        echo \
          "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
          $(echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 2>&1
    fi
    #
    # ############################
    # ## Microsoft
    # ############################
    #
    echo "Microsoft" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    curl -s -SL "https://packages.microsoft.com/config/$distro/$versie/packages-microsoft-prod.deb" -o "/tmp/packages-microsoft-prod.deb" > /dev/null 2>&1
    dpkg -i /tmp/packages-microsoft-prod.deb > /dev/null 2>&1
    #
    # ############################
    # ## Kubernetes
    # ############################
    #
    echo "Kubernetes" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    rm -f /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    k8sstable_lang=$(curl -Ls https://dl.k8s.io/release/stable.txt)
    k8sstable_kort=${k8sstable_lang:0:5}
    curl -fsSL https://pkgs.k8s.io/core:/stable:/$k8sstable_kort/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/$k8sstable_kort/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null 2>&1
    #
    # ############################
    # ## Ansible
    # ############################
    #
    echo "Ansible" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ $distro == "ubuntu" ]]; then
        apt-add-repository ppa:ansible/ansible -s -y > /dev/null 2>&1
    fi
    #
    apt update -qq > /dev/null 2>&1
    #
# Repository toevoegen aan OS
} 
#
#
#
#
#   #######################
#   Blok 4E-4-4    Debian UBUNTU Configuratie Functies
#                  Functie Configuratie Virtualisatie
#                  Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_config_virtualization () {
    #
    # VMWare Workstation Pro Hypervisor 
    #
    if sudo dmidecode | grep -iq vmware; then
        #
        apt install open-vm-tools -y > /dev/null 2>&1
        apt autoremove -y > /dev/null 2>&1
        # Shared Folders
        mkdir -p /mnt/hgfs > /dev/null 2>&1
        chmod 2777 /mnt/hgfs > /dev/null 2>&1
        # mount -t fuse.vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other
        if ! mount -t fuse.vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other; then
            code=$?
            if [ $code -eq 107 ]; then
               echo "Fout 107: Geen instelling gedaan onder Options Shared Folders bij VM in Workstation Pro"
            else
               echo "Mount faalde met foutcode $code"
            fi
        fi
    fi
    #
}
#
#
#
#
#   #######################
#   Blok 4E-4-5    Debian UBUNTU Configuratie Functies
#                  Functie Python Compatible
#                  Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_python_compatible () {
    #
    if [ -L /usr/local/bin/python ]; then
        rm /usr/local/bin/python
    fi
    #
    ln -s /usr/bin/python3 /usr/local/bin/python
    #
}
#
#
#
#   #######################
#   Blok 4E-4-6    Debian UBUNTU Configuratie Functies
#                  Functie Minikube
#                  Minikube met Docker als driver
#   #######################
#
#
#
#
function debulx_config_minikube_driver () {
    #
    echo '## Phase 12 - Configuring Minikube default driver'
    #
    conteng=$1
    #
    if [[ $conteng == "docker" ]]; then
        if command -v docker &> /dev/null; then
            #
            # sudo -u zorgt ervoor dat instelling wordt gedaan als gewone gebruiker en niet als root
            sudo -u "$SUDO_USER" minikube config set driver docker
            sudo -u "$SUDO_USER" minikube config set WantUpdateNotification true
            sudo -u "$SUDO_USER" minikube config set WantBetaUpdateNotification false
            sudo -u "$SUDO_USER" minikube config set WantVirtualBoxDriverWarning false
            sudo -u "$SUDO_USER" export MINIKUBE_IN_STYLE=false
            sudo -u "$SUDO_USER" export MINIKUBE_SUPPRESS_DOCKER_PERFORMANCE=true
        else
            echo "Docker is niet geïnstalleerd. Installeer Docker om verder te gaan."
        fi
    fi
    if [[ $conteng == "podman" ]]; then
        if command -v podman &> /dev/null; then
            #
            # sudo -u zorgt ervoor dat instelling wordt gedaan als gewone gebruiker en niet als root
            sudo -u "$SUDO_USER" minikube config set driver podman
            sudo -u "$SUDO_USER" minikube config set WantUpdateNotification true
            sudo -u "$SUDO_USER" minikube config set WantBetaUpdateNotification false
            sudo -u "$SUDO_USER" minikube config set WantVirtualBoxDriverWarning false
            sudo -u "$SUDO_USER" export MINIKUBE_IN_STYLE=false
            sudo -u "$SUDO_USER" export MINIKUBE_SUPPRESS_DOCKER_PERFORMANCE=true
        else
            echo "Podman is niet geïnstalleerd. Installeer Docker om verder te gaan."
        fi
    fi
# Minikube config driver
}
#
#
#
#   #######################
#   Blok 4E-4-7    Debian UBUNTU Configuratie Functies
#                  Functie Network Settings
#         
#   #######################
#
#
#
#
function debulx_config_network_settings () {
   #
    echo 'DEBIAN/UBUNTU - Step 1 of 2 Changing Domain Name Service (DNS) settings'
    if [[ $distro == "debian" ]]; then
        deb_config_dns_settings
    fi
    if [[ $distro == "ubuntu" ]]; then
        ulx_os_config_dns
    fi
    echo 'DEBIAN/UBUNTU - Step 2 of 2 Configure Network Interface Card 2'
    # ulx_os_netplan_download
} 
#
#
#
#   #######################
#   Blok 4E-4-8    Debian UBUNTU Configuratie Functies
#                  Functie Configuratie BASH shell
#         
#   #######################
#
#
#
#
function debulx_config_bash_shell () {
    #
    echo "Bash Shell Config" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    # Wordt ook gebruikt voor BuildRoot Linux omdat stappen exact gelijk zijn
    #
    # Downloaden settings bestand
    curl -s -o /home/$SUDO_USER/.bashrc https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/.bashrc
    # Downloaden bestand dat settings bestand automatisch activeert
    curl -s -o /home/$SUDO_USER/.bash_profile https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/.bash_profile
    # 
    # LET OP
    # Wordt pas actief na uitloggen of herstarten net zoals docker
    #
}
#
#
#
#
# Blok 4E CATEGORIE 5 Nested Functions
#
#
#
#
#   #################################
#   Blok 4E-5-1    Debian Ubuntu Nested 
#                  OOBE
#   #################################
#
#
# PHASE 8
#
#
function debulx_nested_os_config () {
    #
    phase_eight_time=$(date)
    echo "Phase 8 $phase_eight_time $USER $SUDO_USER" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    # Europa Amsterdam instellen
    echo '## Phase 8 - Step 1 of 12 Set Operating System settings to Europe'
    debulx_config_taal_nl
    echo "## Phase 8 - Step 2 of 12 Change Operating System Repository to Europe"
    debulx_config_os_repo_change
    # APT
    echo '## Phase 8 - Step 3 of 12 Implementing new APT Repository from Europe'
    debulx_os_update_apt
    echo '## Phase 8 - Step 4 of 12 Upgrading Operating System (takes about 5 minutes)'
    debulx_os_upgrade_packages
    if [[ $distro == "debian" ]]; then
        echo "Version before upgrade $deb_vers_oud"
        deb_vers_nw=$(cat /etc/debian_version | tr '[:upper:]' '[:lower:]')
        echo "Version after upgrade $deb_vers_nw"
    fi
    if [[ $distro == "ubuntu" ]]; then
        echo "Version before upgrade $ulx_vers_oud"
        . /etc/os-release
        ulx_vers_nw=$VERSION
        echo "Version after upgrade $ulx_vers_nw"
    fi
    echo '## Phase 8 - Step 5 of 12 Installing Default Apps (takes about 5 minutes)'
    # Doet installate van add apt repository commando
    debulx_install_default_apps
    echo "## Phase 8 - Step 6 of 12 Adding new Repositories to APT"
    # Toevoegen Ansible Cockpit Docker Kubernetes Powershell 
    # Gebruikt add apt repository commando
    debulx_config_add_repositories
    # Operating System instellen
    echo "## Phase 8 - Step 7 of 12 Configure BASH Shell settings"
    debulx_config_bash_shell
    echo '## Phase 8 - Step 8 of 12 Releasing ROOT user'
    wachtwoord=$SUDO_USER
    echo "root:$wachtwoord" | sudo chpasswd
    usermod -p $(openssl passwd -1 -salt xyz $wachtwoord) root
    # Applicaties
    echo '## Phase 8 - Step 9 of 12 Installing or updating of Open VM Tools'
    debulx_config_virtualization
    echo '## Phase 8 - Step 10 of 12 Python compatible with lower versions'
    debulx_python_compatible
    echo '## Phase 8 - Step 11 of 12 Installing and configuration of Cockpit'
    debulx_install_cockpit_srv
    echo '## Phase 8 - Step 12 of 12 Installing Microsoft Powershell 7'
    debulx_install_pwrshell
    #
# Debian Ubuntu Nested OS Config
}
#
#
#
#
#   #################################
#   Blok 4E-5-2    Debian Ubuntu Nested 
#                  Container Engine 
#   #################################
#
#
#
#
function debulx_nested_conteng_complete () {
    #
    phase_ten_time=$(date)
    echo "Phase 10 $phase_ten_time $USER $SUDO_USER" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    # ##########################################################################
    #
    echo "## Phase 10 - Step 1 of 10 Installation and configuration of Container Engine"
    if [[ $actie == "docker" || $actie == "podman" || $actie == "minikube" ]]; then
        debulx_install_conteng
    fi 
    #
    # ##########################################################################
    #
    echo '## Phase 10 - Step 2 of 10 Pull most commonly used Images from Docker Hub'
    if [[ $actie == "docker" || $actie == "minikube" ]]; then
        debulx_conteng_images_pull "docker"
    fi
    if [[ $actie == "podman" ]]; then
        debulx_conteng_images_pull "podman"
    fi
    #
    # ##########################################################################
    #
    echo "## Phase 10 - Step 3 of 10 Starting Jenkins CI CD CD Server as container on $actie"
    if [[ $actie == "docker" ]]; then
        debulx_conteng_jenkins_run "docker"
    fi
    if [[ $actie == "podman" ]]; then
        debulx_conteng_jenkins_run "podman"
    fi
    if [[ $actie == "minikube" ]]; then
        echo 'Skipping this step for Minikube'
    fi
    #
    # ##########################################################################
    #
    echo '## Phase 10 - Step 4 of 10 Starting Portainer as container'
    if [[ $actie == "docker" || $actie == "minikube" ]]; then
        debulx_conteng_portainer_run "docker"
    fi
    if [[ $actie == "podman" ]]; then
        debulx_conteng_portainer_run "podman"
    fi
    #
    # ##########################################################################
    #
    echo '## Phase 10 - Step 5 of 10 Starting Yacht as container'
    if [[ $actie == "docker" || $actie == "minikube" ]]; then
        debulx_conteng_yacht_run "docker"
    fi
    if [[ $actie == "podman" ]]; then
        debulx_conteng_yacht_run "podman"
    fi
    #
    # ##########################################################################
    #
    echo '## Phase 10 - Step 6 of 10 Starting Visual Studio Code Server as container'
    if [[ $actie == "docker" || $actie == "minikube" ]]; then
        debulx_conteng_vscsrv_run "docker"
    fi
    if [[ $actie == "podman" ]]; then
        debulx_conteng_vscsrv_run "podman"
    fi
    #
    # ##########################################################################
    #
    echo '## Phase 10 - Step 7 of 10 Starting Registry as container'
    if [[ $actie == "docker" || $actie == "minikube" ]]; then
        debulx_conteng_registry_run "docker"
    fi
    if [[ $actie == "podman" ]]; then
        debulx_conteng_registry_run "podman"
    fi
    #
    # ##########################################################################
    #
    echo '## Phase 10 - Step 8 of 10 Starting WatchTower as container'
    if [[ $actie == "docker" || $actie == "minikube" ]]; then
        debulx_conteng_watchtower_run "docker"
    fi
    if [[ $actie == "podman" ]]; then
        debulx_conteng_watchtower_run "podman"
    fi
    #
    # ##########################################################################
    #
    echo "## Phase 10 - Step 9 of 10 Installing Container Engine Management tools"
    if [[ $actie == "docker" ]]; then
        debulx_conteng_install_run_mgmt_tools "docker"
    fi
    if [[ $actie == "podman" ]]; then
        debulx_conteng_install_run_mgmt_tools "podman"
    fi
    if [[ $actie == "minikube" ]]; then
        if [[ $modus == "docker" || $modus = "test" || $modus = "leeg" ]]; then
            debulx_conteng_install_run_mgmt_tools "docker"
        fi
        if [[ $modus == "podman" ]]; then
            debulx_conteng_install_run_mgmt_tools "podman"
        fi
    fi
    #
    # ##########################################################################
    #
    echo "## Phase 10 - Step 10 of 10 Saving Jenkins initialAdminPassword to file"
    if [[ $actie == "docker" ]]; then
        docker cp LUCT_Jenkins:/var/jenkins_home/secrets/initialAdminPassword /home/$SUDO_USER/Jenkins_Initial_Password.txt
    fi
    if [[ $actie == "podman" ]]; then
        podman cp LUCT_Jenkins:/var/jenkins_home/secrets/initialAdminPassword /home/$SUDO_USER/Jenkins_Initial_Password.txt
    fi
    #
    echo '22   SSH' >> /home/$SUDO_USER/port_list.txt
    echo '80   Apache' >> /home/$SUDO_USER/port_list.txt
    echo '8101 Cockpit' >> /home/$SUDO_USER/port_list.txt
    echo '9101 Portainer' >> /home/$SUDO_USER/port_list.txt
    echo '9102 Yacht' >> /home/$SUDO_USER/port_list.txt
    echo '9103 Visual Studio Code Server' >> /home/$SUDO_USER/port_list.txt
    echo '9104 Jenkins' >> /home/$SUDO_USER/port_list.txt
    echo '9105 Registry' >> /home/$SUDO_USER/port_list.txt
    echo '9106 WatchTower' >> /home/$SUDO_USER/port_list.txt
    #
}
#
#
#
#
# ################################################################################
#
# Blok 4F                                                #########
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES             #
# Fedora RHEL                                            #
#                                                        #######
#                                                        #
#                                                        #
#                                                        #
#
# ################################################################################
#
#
#
#
# Blok 4F-1 CATEGORIE 1 OS Functies
#
#
#
#
# Blok 4F-2 CATEGORIE 2 Install Software Functies
#
#
#
#
# ################################################################################
#
# Blok 4G                                                #       #
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES             #       #
# UBUNTU LINUX                                           #       #
#                                                        #       #
#                                                        #       #
#                                                        #       #
#                                                        #########
#
# ################################################################################
#
#
#
#
# Block 4G-1 CATEGORIE 1 OS Functies
#
#
#
#
# Blok 4G-2 CATEGORIE 2 Install Software Functies
#
#
#
#
#   #######################
#   Blok 4G-2-1    UBUNTU OS Install Software Functies
#                  Functie Installatie gnome desktop
#                  GUI
#   #######################
#
#
#
#
function ulx_os_gnome_install () {
    # Installate GNOME GUI (https://phoenixnap.com/kb/how-to-install-a-gui-on-ubuntu)
    #
    #
    # Functie bijwerken ubuntu 
    debulx_os_update_apt
    #
    # Installatie GNOME 
    apt install ubuntu-desktop -y
    shutdown -r now 
    #
    # # Check if GNOME is installed
    # if ! [ -x "$(command -v gnome-shell)" ]; the
    #  echo 'GNOME is not installed. Installing GNOME...' >&2
    #  sudo apt-get update
    #  sudo apt-get install gnome-shell
    # else
    #  echo 'GNOME is already installed.'
    # fi
    #
}
#
#
#
#
#   #######################
#   Blok 4G-2-2    UBUNTU OS Install Software Functies
#                  Functie Installatie Desktop Tools
#                  GUI
#   #######################
#
#
#
#
function ulx_it-funda_tooling () {
    # GNU Compiler C 
    apt install gcc -y
    # JAVA JDK 
    apt install openjdk-17-jdk -y
    # Image metadata tool 
    apt install exif -y
    # RAW files editor 
    apt install okteta -y
    # Data image hider 
    apt install steghide -y
}
#
#
#
#
# Block 4E CATEGORIE 3 Configuratie Functies
#
#
#
#   #######################
#   Blok 4E-3-1    UBUNTU Configuratie Functies
#                  Functie NIC Config OS
#              
#   #######################
#
#
#
#
function ulx_os_netplan_download () {
    #
    # ##################################################################
    # Deze functie alleen uitvoeren als VM is voorzien van meerdere NIC
    # ##################################################################
    #
    #
    # ####################
    # IP Plan NIC nummer 2
    # ####################
    #
    #
    # Ansible Controller
    # VMNet4
    # 10.1.10.50
    #
    # Slave 1 
    # VMNet4
    # 10.1.10.60
    #
    # Slave 2 
    # VMNet4
    # 10.1.10.61
    #
    # 
    # Docker Demo
    #
    # Controller 
    # VMNet 4
    # 10.1.10.70
    #
    # 
    # Kubernetes Demo
    #
    # Controller 
    # VMNet 4
    # 10.1.10.80
    #
    #
    # Introductie Infrastructuren
    # DBMS
    #
    # if [ $hostname == "u24-lts-s-dbms-001" ] ; then
    if [[ $HOSTNAME =~ "u24-lts-s-dbms" ]] ; then
        curl -s -o /home/$SUDO_USER/netplan/dbms-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/OSTicket/Guest/Ubuntu/Netplan/Databaseserver/eth/eth-sec-nic-01-netcfg-dbms.yaml
    fi
    #
    # Introductie Infrastructuren
    # WebServer
    #
    # if [ $hostname == "u24-lts-s-wsrv-001" ] ; then
    if [[ $HOSTNAME =~ "u24-lts-s-wsrv" ]] ; then
        curl -s -o /home/$SUDO_USER/netplan/wsrv-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/OSTicket/Guest/Ubuntu/Netplan/Webserver/eth/eth-sec-nic-01-netcfg-wsrv.yaml
    fi
    #
    # Maken Script NIC uitzetten
    #
    # echo '# /bin/bash' > /home/$SUDO_USER/netplan/eth0-off.sh
    # echo 'sudo ip link set eth0 down' >> /home/$SUDO_USER/netplan/eth0-off.sh
    # chmod +x /home/$SUDO_USER/netplan/eth0-off.sh
    echo '# /bin/bash' > /home/$SUDO_USER/netplan/eth1-off.sh
    echo 'sudo ip link set eth1 down' >> /home/$SUDO_USER/netplan/eth1-off.sh
    chmod +x /home/$SUDO_USER/netplan/eth1-off.sh
    #
    # Maken Script NIC aanzetten
    #
    # echo '# /bin/bash' > /home/$SUDO_USER/netplan/eth0-on.sh
    # echo 'sudo ip link set eth0 up' >> /home/$SUDO_USER/netplan/eth0-on.sh
    # chmod +x /home/$SUDO_USER/netplan/eth0-on.sh
    echo '# /bin/bash' > /home/$SUDO_USER/netplan/eth1-on.sh
    echo 'sudo ip link set eth1 up' >> /home/$SUDO_USER/netplan/eth1-on.sh
    chmod +x /home/$SUDO_USER/netplan/eth1-on.sh
}
#
#
#
#
#   #######################
#   Blok 4E-3-2    UBUNTU Configuratie Functies
#                  Functie Change DNS OS
#       
#   #######################
#
#
#
#
function ulx_os_config_dns () {
#
#
#   #########################################################
#   Stap 1: Detecteer actieve netwerkinterface (eth* of ens*)
#   #########################################################
#
#
interface=$(ip -o link show | awk -F': ' '/^[0-9]+: (eth|ens)/ {print $2}' | head -n 1)
#
#
if [[ -n "$interface" ]]; then
    #
    #
    #
    #   #########################################################
    #   Stap 2: Zoek Netplan-configuratiebestand
    #   ##########################################################
    #
    #
    netplan_dir="/etc/netplan"
    yaml_file=$(find "$netplan_dir" -maxdepth 1 -name "*.yaml" -o -name "*.yml" | head -n 1)
    #
    #    if [ -z "$yaml_file" ]; then
    #        echo "Geen Netplan YAML-bestand gevonden in $netplan_dir"
    #        exit 1
    #    fi
    #
    #    echo "Gevonden Netplan-configuratiebestand: $yaml_file"
    #
    #
    #   #########################################################
    #   Stap 3: Maak een backup huidige bestand 
    #   #########################################################
    #
    #
    backup_file="${yaml_file}.bak.$(date +%Y%m%d%H%M%S)"
    cp "$yaml_file" "$backup_file"
    #   echo "Backup gemaakt: $backup_file"
    #
    #
    #   #########################################################
    #   Stap 4: Genereer nieuwe configuratie
    #   #########################################################
    #
    #
    #   Inhoud nieuwe bestand
    #
cat <<EOF > "$yaml_file"
network:
  version: 2
  renderer: networkd
  ethernets:
    $interface:
      dhcp4: true
      nameservers:
        addresses: [145.2.14.10, 145.2.14.11, 8.8.8.8, 8.8.4.4]
EOF
    #
    #   echo "Nieuwe Netplan-configuratie geschreven naar $yaml_file"
    #
    #
    #   #########################################################
    #   Stap 5: Pas Netplan toe
    #   ##########################################################
    #
    #
    netplan apply > /home/$SUDO_USER/luct-logs/ulx_os_config_dns.log 2>&1
#
#
else
    echo 'No valid netwerkinterface found (eth* or ens*)'
fi
}
#
#
#
#
#
#   ################################################################################
#   ################################################################################
#
#   Blok 5
#
#   Linux Distributie Onafhankelijke Functies 
#
#   ################################################################################
#   ################################################################################
#
#
#   Blok 5-1 Categorie 1 OOBE
#
#
#
#  ####################################
#  Blok 5-1-1
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function Linux OOBE
#  ####################################
#
#
#
function luct_linux_oobe () {
    #
    echo '## Phase 6 - Changing Hostname'
    verander_machinenaam
    #
    # Directories maken
    # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
    echo '## Phase 7 - Creating LUCT environment'
    maak_directories
    #
    # Operating System zo instellen zoals gewenst
    # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
    echo '## Phase 8 - Configure Operating System'
    if [[ $distro == "debian" || $distro == "ubuntu" ]]; then
        debulx_nested_os_config
    fi
    #
    # GitHub Clones maken
    echo '## Phase 9 - Cloning GitHub Repositories'
    git_clone_demos
    #
} 
#
#
# Blok 5 Categorie 2 Verander Machinenaam
#
#
#
#  ####################################
#  Blok 5-2-1
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function Verander Machinenaam
#  ####################################
#
#  PHASE 6
#
#
function verander_machinenaam () {
    #
    phase_six_time=$(date)
    echo "Phase 6 $phase_six_time $USER $SUDO_USER" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    if [[ "$SUDO_USER" != "vagrant" ]]; then
        if [[ $distro == "debian" ]] ; then
            . /etc/os-release
            versiehostnaam=${VERSION_ID:0:2}
            if [[ $actie == "docker" ]] ; then
                NEW_HOSTNAME="D$versiehostnaam-LTS-D-DKR-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "iacmaster" ]] ; then
                NEW_HOSTNAME="D$versiehostnaam-LTS-D-IAC-M01"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "iacslave" ]] ; then
                NEW_HOSTNAME="D$versiehostnaam-LTS-D-IAC-S01"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "omv" ]] ; then
                NEW_HOSTNAME="D$versiehostnaam-LTS-D-OMV-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "podman" ]] ; then
                NEW_HOSTNAME="D$versiehostnaam-LTS-D-PMN-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "minikube" ]] ; then
                NEW_HOSTNAME="D$versiehostnaam-LTS-D-MKB-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
        fi
        if [[ $distro == "linuxmint" ]] ; then
            if [[ $actie == "docker" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-DKR-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "iacmaster" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-IAC-M01"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "iacslave" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-IAC-S01"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "podman" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-PMN-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "minikube" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-MKB-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
        fi
        if [[ $distro == "lmde" ]] ; then
            if [[ $actie == "docker" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-DKR-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "iacmaster" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-IAC-M01"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "iacslave" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-IAC-S01"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "podman" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-PMN-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "minikube" ]] ; then
                NEW_HOSTNAME="U24-LTS-S-MKB-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
        fi
        if [[ $distro == "ubuntu" ]] ; then
            . /etc/os-release
            versiehostnaam=${VERSION_ID:0:2}
            if [[ $actie == "docker" ]] ; then
                NEW_HOSTNAME="U$versiehostnaam-LTS-S-DKR-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "iacmaster" ]] ; then
                NEW_HOSTNAME="U$versiehostnaam-LTS-S-IAC-M01"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "iacslave" ]] ; then
                NEW_HOSTNAME="U$versiehostnaam-LTS-S-IAC-S01"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "podman" ]] ; then
                NEW_HOSTNAME="U$versiehostnaam-LTS-S-PMN-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
            if [[ $actie == "minikube" ]] ; then
                NEW_HOSTNAME="U$versiehostnaam-LTS-S-MKB-001"
                hostnamectl set-hostname "$NEW_HOSTNAME"
                sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
            fi
        fi
    fi
# Verander machinenaam
}
#
#
# Blok 5 Categorie 3 Maak Directories
#
#
#
#  ####################################
#  Blok 5-3-1
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function maak directories
#  ####################################
#
#
# PHASE 7
#
#
#
function maak_directories () {
    #
    phase_seven_time=$(date)
    echo "Phase 7 $phase_seven_time $USER $SUDO_USER" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    #
    # Temporary
    #
    #
    echo '## Phase 7 - Step 1 Creating TMP directory in home directory of this user'
    if [ ! -d "/home/$SUDO_USER/tmp" ]; then
        mkdir -p /home/$SUDO_USER/tmp
        chown -f -R $SUDO_USER /home/$SUDO_USER/tmp
    fi
    #
    #
    # LUCT Loggings 
    #
    #
    echo '## Phase 7 - Step 2 Creating LUCT logging directory'
    if [ ! -d "/home/$SUDO_USER/luct-logs" ]; then
        mkdir -p /home/$SUDO_USER/luct-logs
        chown -f -R $SUDO_USER /home/$SUDO_USER/luct-logs
    fi
    #
    #
    # Docker Scripts
    #
    #
    if [[ $actie == "docker" || $actie == "podman" || $actie == "minikube" ]]; then
        echo '## Phase 7 - Step 3 Creating Container Engine scripts directory'
        if [[ $actie == "docker" || $actie == "minikube" ]]; then
            if [ ! -d "/home/$SUDO_USER/dkr-scripts" ]; then
                mkdir -p /home/$SUDO_USER/dkr-scripts
                chown -f -R $SUDO_USER /home/$SUDO_USER/dkr-scripts
            fi
        fi
        if [[ $actie == "podman" ]]; then
            if [ ! -d "/home/$SUDO_USER/pmn-scripts" ]; then
                mkdir -p /home/$SUDO_USER/pdm-scripts
                chown -f -R $SUDO_USER /home/$SUDO_USER/pdm-scripts
            fi
        fi
    fi
# Maak Directories
}
#
#
# Blok 5 Categorie 4 Git Clone functies
#
#
#
#  ####################################
#  Blok 5-4-1
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function git clone 
#  ####################################
#
#
# PHASE 9
#
#
#
function git_clone_demos () {
    #
    phase_nine_time=$(date)
    echo "Phase 9 $phase_nine_time $USER $SUDO_USER" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    # Demos
    echo '## Phase 9 - Clone GitHub JATUTERT Demos'
    if [ -d "/home/$SUDO_USER/demos" ]; then
        rm -rf "/home/ubuntu/demos"
    fi
    git clone --quiet https://github.com/jatutert/demos.git /home/$SUDO_USER/demos
    #
    # Awesome Compose
    if [[ $actie == "docker" ]] ; then
        echo '## Phase 9 - Clone GitHub Docker Awesome Compose'
        if [ -d "/home/$SUDO_USER/demos" ]; then
            rm -rf "/home/ubuntu/demos/Docker/Compose/Awesome-compose"
        fi
        git clone --quiet https://github.com/docker/awesome-compose.git /home/$SUDO_USER/demos/Docker/Compose/Awesome-compose
    fi
    #
    # Onderwijs
    if [[ $actie == "omv" || $actie == "osticket" ]] ; then
        echo '## Phase 9 - Clone GitHub MSiekmans'
        if [ -d "/home/$SUDO_USER/onderwijs" ]; then
            rm -rf "/home/ubuntu/onderwijs"
        fi
        git clone --quiet https://github.com/msiekmans/linux-server-scripts.git /home/$SUDO_USER/onderwijs
    fi
    #
    # PowerShell
    echo '## Phase 9 - Clone GitHub Powershell is fun'
    if [ -d "/home/$SUDO_USER/powershell" ]; then
        rm -rf "/home/$SUDO_USER/powershell"
    fi
    git clone --quiet https://github.com/HarmVeenstra/Powershellisfun.git /home/$SUDO_USER/powershellisfun
    #
    # Ansible 
    if [[ $actie == "iacmaster" ]] ; then
        echo '## Phase 9 - Clone GitHub Ansible for DevOps'
        if [ -d "/home/$SUDO_USER/ansible_devops" ]; then
            rm -rf "/home/$SUDO_USER/ansible_devops"
        fi
        git clone --quiet https://github.com/geerlingguy/ansible-for-devops.git /home/$SUDO_USER/ansible_devops
    fi 
    #
    # Shell Scripts
    echo '## Phase 9 - Make all Shell Scriptfiles Executable'
    find /home/$SUDO_USER/demos -type f -name "*.sh" -exec chmod +x {} \;
# Git Clone
} 
#
#
# Blok 5 Categorie 5 Progress Bar functies
#
#
#
#  ####################################
#  Blok 5-5-1
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function progress bar 
#  ####################################
#
#
#
#
draw_progress_bar() {
  #
  local percentage=$1
  local bar_length=50
  local filled_length=$((percentage * bar_length / 100))
  local empty_length=$((bar_length - filled_length))
  local filled_bar=$(printf "%${filled_length}s")
  local empty_bar=$(printf "%${empty_length}s")
  filled_bar=${filled_bar// /#}
  empty_bar=${empty_bar// /.}
  #
  # Use carriage return to move the cursor back to the start of the line
  # -n prevents a new line, -e enables interpretation of backslash escapes
  echo -ne "\r[${filled_bar}${empty_bar}] ${percentage}%"
  #
  # Add a new line when the progress is complete to prevent the next output from overwriting the bar
  if [ "$percentage" -eq 100 ]; then
    echo ""
  fi
# Draw Progress Bar
}
#
#
# Blok 5 Categorie 6 Finish Script functies
#
#
#
#  ####################################
#  Blok 5-6-1
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function Actie Klaar
#  ####################################
#
#
#
#
function luct_finish_script () {
    #
    echo "Eindtijd" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    timedatectl status | sudo tee -a /var/log/luct.log > /dev/null 2>&1
    #
    clear
    luct_display_header
    echo ''
    echo 'All phases and steps have been completed. All that remains is a reboot ...'
    echo ''
    echo "Found a bug ? Let me know by emailing me at j.a.tutert@saxion.nl"
    echo ''
    # Test modus 
    if [[ $modus == "test" ]]; then
        echo '## Normally I would reboot now ##'
        echo ''
        echo 'Docker only can be used by doing sudo docker and not just docker'
        echo ''
        exit 1 
    else
        echo "Herstart uitvoeren" | sudo tee -a /var/log/luct.log > /dev/null 2>&1
        shutdown -r now
    fi
# Actie klaar
}
#
#
# Blok 5 Categorie 7 Interactief menu functies
#
#
#
#  ####################################
#  Blok 5-7-1
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function Menu
#  ####################################
#
#
#  WERK IN UITVOERING
#
#
function config_menu () {
    #
    #
    while true; do
        clear
        echo 'Configuratie' $NAME $VERSION 'HoofdMenu'
        echo 'Script wordt uitgevoerd als user' $USER
        echo 'Gestart vanuit user' $SUDO_USER
        echo " "
        echo "Maak een keuze:"
        echo " " 
        echo "1. Linux bijwerken en configureren"
        echo "2. Docker-CE met Compose plugin installeren"
        echo "3. Minikube met Docker als provider installeren"
        echo "4. Ansible installeren en configureren"
        echo "5. x"
        echo "6. GNOME Grafische omgeving installeren"
        echo "7. x"
        echo "9. Verlaat het menu"
        # Keuze opvragen 
        read -p "Voer uw keuze in: " keuze
        # keuze verwerken 
        case $keuze in
        1)
            #
            # Menu keuze 1 
            #
            if [[ $distro == "alpine" ]]; then
                maak_directories
                alx_os_upgrade_full
            fi
            if [[ $distro == "buildroot" ]]; then
                maak_directories
            fi
            if [[ $distro == "debian" || $distro == "ubuntu" ]]; then
                luct_linux_oobe
            fi
            ;;
        2)
            #
            # Menu keuze 2
            #
            if [[ $distro == "alpine" ]]; then
                maak_directories
                alx_os_upgrade_full
            fi
            if [[ $distro == "buildroot" ]]; then
                maak_directories
            fi
            if [[ $distro == "debian" || $distro == "ubuntu" ]]; then
                #
                #
                # Debian Ubuntu LinuxMint Debian LinuxMint Ubuntu Optie 4
                # Installeren en Configureren Docker Podman en Minikube op Docker
                #
                # Phase 6 tot en met 9
                luct_linux_oobe
                # Phase 10
                debulx_nested_conteng_complete
                # Phase 11
                debulx_install_minikube_and_k8stools
                # Phase 12
                if [[ $actie == "docker" || $actie == "minikube" || $modus == "docker" || $modus = "test" || $modus = "leeg" ]] ; then
                    debulx_config_minikube_driver "docker"
                fi
                if [[ $actie == "podman" || $modus == "podman" ]] ; then
                    debulx_config_minikube_driver "podman"
                fi
                # Phase 11
                luct_finish_script
            fi
            ;;
        3)
            #
            # Menu keuze 3
            #
            # Configuratie 
            debulx_config_taal_nl
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            debulx_os_update_apt
            # Bijwerken 
            debulx_os_upgrade_packages
            # Installatie 
            debulx_config_virtualization
            ulx_install_pwrshell
            debulx_install_cockpit_srv
            # DOCKER
            debulx_install_docker_ce
            debulx_docker_portainer_run
            debulx_docker_images_pull
            # 
            # DEMO omgeving maken 
            maak_directories
            ulx_maak_docker_scripts
            ulx_maak_docker_voorbeelden
            ulx_maak_compose_scripts
            ulx_maak_compose_voorbeelden
            # MiniKube 
            debulx_install_minikube_and_k8stools
            debulx_config_minikube_driver
            ulx_maak_minikube_voorbeelden
            ;;
        4)
            #
            # Menu keuze 4
            #
            # Configuratie
            debulx_config_taal_nl
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            debulx_os_update_apt
            # Bijwerken
            debulx_os_upgrade_packages
            # Installatie 
            debulx_config_virtualization
            ulx_install_pwrshell
            debulx_install_cockpit_srv
            # Ansible
            ulx_install_ansible
            ;;
        5)
            clear
            echo "Optie 5 - Gekozen ..." 
            ;;
        6)
            clear
            echo "Optie 6 - Gekozen ..."
            ;;
        7)
            clear
            echo "Optie 7 - Gekozen ..."
            #
            ;;
        9)
            echo "U heeft gekozen om het menu te verlaten."
            exit 0
            ;;
        *)
            echo "Ongeldige keuze. Probeer opnieuw."
            ;;
        esac
    done
#
}
#
#
#
#
#
#   ################################################################################
#   ################################################################################
#
#   Blok 6 Main functies
#   Fase 4 
#
#   ################################################################################
#   ################################################################################
#
#
#
#
#   ################################################################################
#   ################################################################################
#   Blok 6-1 ALPINE
#   PLANNED FOR 2026
#   ################################################################################
#   ################################################################################
#
#
#
#
if [[ $distro == "alpine" ]]; then
    #
    # Bepaal de actie op basis van de parameter
    actie=$1
    #
    #
    if [[ $actie == "upgrade" ]]; then
        #
        # ALPINE OPTIE 1
        #
        alx_os_upgrade_full
        luct_finish_script
        exit 1
        elif [[ $actie == "docker" || $actie == "podman" || $actie == "minikube" ]]; then
            #
            # ALPINE OPTIE 2
            #
            exit 1
        elif [[ $actie == "iacmaster" || $actie == "iacslave" ]]; then
            #
            # ALPINE OPTIE 3
            #
             exit 1
        elif [[ $actie == "scripts" ]]; then
            #
            # ALPINE OPTIE 4
            # 
            exit 1
        elif [[ $actie == "scripts" ]]; then
            #
            # ALPINE OPTIE 5
            #
            exit 1
        elif [[ $actie == "scripts" ]]; then
            #
            # ALPINE OPTIE 6
            #
            exit 1
       elif [[ $actie == "scripts" ]]; then
            #
            # ALPINE OPTIE 7
            #
            exit 1
       elif [[ $actie == "scripts" ]]; then
            #
            # ALPINE OPTIE 8
            #
            exit 1
        elif [[ $actie == "menu" ]]; then
            #
            # ALPINE OPTIE 9
            #
            config_menu
            exit 1
    else
        echo "Onjuiste parameter: $actie. Gebruik 'upgrade' 'docker' 'minikube' 'ansible'."
        echo "Beschikbare parameters:"
        echo "upgrade    voor bijwerken naar laatste versie van distro"
        echo "docker     voor installatie docker met demo omgeving"
        echo "minikube   voor installatie minikube met worker nodes op docker"
        echo "ansible    voor demo omgeving Ansible"
        echo "onderwijs  voor demo omgeving onderwijs"
        exit 1
    fi
fi
#
#
#
#
#   ################################################################################
#   ################################################################################
#   Blok 6-2
#   BuildRoot 
#   ################################################################################
#   ################################################################################
#
#
#
#
if [[ $distro == "buildroot" ]]; then
    #
    # Bepaal de actie op basis van de parameter
    actie=$1
    #
    if [[ $actie == "compose" ]]; then
        #
        # BUILDROOT OPTIE 1
        #
        debulx_config_bash_shell
        #
        build_install_docker_compose_plugin
        #
        echo "Correctie rechten voor Docker Build"
        # https://stackoverflow.com/questions/57653021/permission-denied-in-docker-build
        chown root:docker /var/run/docker.sock
        chown -R "docker":"docker" /home/docker/.docker
        # chown -R "$USER":"$USER" $HOME/.docker
        sudo chmod -R g+rw "/home/docker/.docker"
        # sudo chmod -R g+rw "$HOME/.docker"
        echo ""
        echo "Configuratie Buildroot omgeving is gereed"
        exit 1
    elif [[ $actie == "script" ]]; then
        #
        # BUILDROOT OPTIE 2
        #
         exit 1
    elif [[ $actie == "script" ]]; then
        #
        # BUILDROOT OPTIE 3
        #
        exit 1
    elif [[ $actie == "script" ]]; then
        #
        # BUILDROOT OPTIE 4
        #
         exit 1
    elif [[ $actie == "script" ]]; then
        #
        # BUILDROOT OPTIE 5
        #
         exit 1
    elif [[ $actie == "script" ]]; then
        #
        # BUILDROOT OPTIE 6
        #
         exit 1
    elif [[ $actie == "script" ]]; then
        #
        # BUILDROOT OPTIE 7
        #
         exit 1
    elif [[ $actie == "script" ]]; then
        #
        # BUILDROOT OPTIE 8
        #
         exit 1
    else
        #
        # BUILDROOT OPTIE 9
        #
        exit 1
    fi
fi
#
#
#
#
#   ################################################################################
#   ################################################################################
#   Blok 6-3 
#   Debian Ubuntu LinuxMint Debian LinuxMint Ubuntu
#   ################################################################################
#   ################################################################################
#
#
#
#
if [[ $distro == "debian" || $distro == "linuxmint" || $distro == "lmde" || $distro == "ubuntu" ]]; then
    #
    if [[ $actie == "upgrade" ]]; then
        #
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint Ubuntu optie 1
        # Besturingssysteem en standaard applicaties bijwerken naar laatste stand
        #
        #
        # Phase 6 tot en met 9
        luct_linux_oobe
        # Phase 10
        luct_finish_script
        exit 1
    elif [[ $actie == "normal" ]]; then
        #
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint Ubuntu optie 2
        # Upgrade naar normale versie in plaats van LTS versie
        #
        #
        if [[ $distro == "ubuntu" ]] ; then 
            sed -i 's/Prompt=lts/Prompt=normal/g' /etc/update-manager/release-upgrades
            do-release-upgrade
        fi
        exit 1
    elif [[ $actie == "network" ]]; then
        #
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint Ubuntu optie 3
        # Aanpassen netwerkinstellingen zoals dns en nic2
        #
        #
        # Phase 6 tot en met 9
        luct_linux_oobe
        # Phase 10
        debulx_config_network_settings
        # Phase 11
        luct_finish_script
        exit 1
    elif [[ $actie == "docker" || $actie == "podman" || $actie == "minikube" ]]; then
        #
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint Ubuntu Optie 4
        # Installeren en Configureren Docker Podman en Minikube op Docker
        #
        # Phase 6 tot en met 9
        luct_linux_oobe
        # Phase 10
        debulx_nested_conteng_complete
        # Phase 11
        debulx_install_minikube_and_k8stools
        # Phase 12
        if [[ $actie == "docker" || $actie == "minikube" || $modus == "docker" || $modus = "test" || $modus = "leeg" ]] ; then
            debulx_config_minikube_driver "docker"
        fi
        if [[ $actie == "podman" || $modus == "podman" ]] ; then
            debulx_config_minikube_driver "podman"
        fi
        # Phase 11
        luct_finish_script
        exit 1
    elif [[ $actie == "iacmaster" || $actie == "iaslave" ]]; then
        #
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint Ubuntu Optie 5
        # Installeren en Configureren Ansible
        #
        #
        # Phase 4 tot en met 7
        luct_linux_oobe
        # Phase 8
        if [[ $actie == "iacmaster" ]] ; then
            debulx_install_ansible_master_slave "master"
        fi
        if [[ $actie == "iacslave" ]] ; then
            debulx_install_ansible_master_slave "slave"
        fi
        # Phase 9
        luct_finish_script
        exit 1
    elif [[ $actie == "omv" ]]; then
        #
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint Ubuntu Optie 6
        # Installeren en Configureren
        # Open Media Vault
        #
        # Phase 4 tot en met 7
        luct_linux_oobe
        if [[ $distro == "debian" ||  $distro == "lmde" ]] ; then
            deb_install_omv
            luct_finish_script
        fi
        if [[ $distro == "ubuntu" || $distro == "linuxmint" ]] ; then
            echo 'Installing Open Media Vault is NOT supported'
        fi 
        exit 1
    elif [[ $actie == "osticket" ]]; then
        #
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint optie 7
        # OS Ticket Native Install
        #
        #
        luct_linux_oobe
        ulx_intro_infra_install
        luct_finish_script
        exit 1
    elif [[ $actie == "itfunda" ]]; then
        #
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint optie 8
        #
        #
        # Directories maken
        maak_directories
        #
        # Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        # IT Fundamentals 
        ulx_it-funda_tooling
        #
        exit 1
    elif [[ $actie == "scripts" ]]; then
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint optie 9
        #
        exit 1
    elif [[ $actie == "scripts" ]]; then
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint optie 10
        #
        exit 1
    elif [[ $actie == "menu" ]]; then
        #
        # Debian Ubuntu LinuxMint Debian LinuxMint optie 11
        #
        config_menu
        exit 1
    else
        echo "Onjuiste parameter: $actie. Gebruik 'upgrade' 'docker' 'minikube' 'ansible'."
        echo "Beschikbare parameters:"
        echo "upgrade    voor bijwerken naar laatste versie van distro"
        echo "docker     voor installatie docker met demo omgeving"
        echo "minikube   voor installatie minikube met worker nodes op docker"
        echo "ansible    voor demo omgeving Ansible"
        echo "onderwijs  voor demo omgeving onderwijs"
        exit 1
    fi
    # Einde Debian Ubuntu LinuxMint Debian LinuxMint
fi
#
#
#
#
#   ################################################################################
#   ################################################################################
#   Blok 8
#   THATS ALL FOLKS
#   ################################################################################
#   ################################################################################
#
#
#   This is the end
#   Hold your breath and count to ten
#   Feel the Earth move and then
#   Hear my heart burst again
#   For this is the end
#   I've drowned and dreamt this moment
#   So overdue, I owe them
#   Swept away, I'm stolen
#
#   Adelle
#