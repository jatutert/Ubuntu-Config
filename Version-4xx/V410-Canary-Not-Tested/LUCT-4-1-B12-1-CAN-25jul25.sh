#! /bin/bash
#
#
#
#   #    #  # #### #####  #   #      ####  #####
#   #    #  # #      #    #   #         #  #
#   #    #  # #      #    #####         #  #
#   #    #  # #      #        #         #  #
#   #### #### ####   #        #  ##     #  #####
#
#
#
# Ophalen van Canary Latest versie van dit script in externe omgeving
# 
# curl -L -o $HOME/luctv4.sh https://edu.nl/treah
#
# Hierna
#
# chmod +x $HOME/luctv4.sh 
# sudo $HOME/luctv4.sh docker 
# sudo $HOME/luctv4.sh minikube 
#
#
#
# ################################################################################
# ################################################################################
# DEVELOPER
# ################################################################################
# ################################################################################
#
#
# Versienummer Major.Minor.Build.Patch
#
# A major version increment (e.g., from 1.0 to 2.0) usually means there have been significant changes, potentially breaking compatibility with previous versions.
# A minor version increment (e.g., from 1.2 to 1.3) indicates the addition of new features or functionality in a backward-compatible way
# A patch or build number increment (e.g., from 1.2.1 to 1.2.2) usually signifies bug fixes, minor updates, or performance improvements
#
#
# Canary Channel
# Try the latest NOT TESTED features
# 
# Dev Channel
# Try the latest TESTED features # Tested by a few people
#
# Stable Channel
# Try the latest TESTED features # Tested by a large group of people 
# 
#
Major="4"
Minor="1"
Build="12"
Patch="1"
Channel="Canary"
#
#
#
# ################################################################################
# ################################################################################
# Informatieblok
# ################################################################################
# ################################################################################
#
#
#
#
clear
echo 'Linux Universal Configuration Tool (LUCT)'
echo "Version $Major.$Minor.$Build.$Patch"
echo "Channel $Channel"
echo ''
echo "Created by John Tutert(TutSOFT) for Bachelor IT Saxion UAS"
echo ''
echo 'For Personal or Educational use only !'
echo ''
echo 'Supported Linux distributions are'
echo '- BuildRoot (Virtual Machine used by Minikube)'
echo '- Debian'
echo '- Ubuntu'
echo '- Ubuntu on Windows Subsystem for Linux (WSL) version 2'
echo ''
echo 'Alpine Linux support is planned for 2026'
echo ''
echo '##### Not extensively tested ######'
echo ''
#
#
#
#
# ######################
# Overzicht TCP Poorten
# ######################
#
#
# Inkomende Poorten
# #####################################################
# 22   Inkomende poort Ansible host vanuit Controller 
# 9001 Inkomende poort voor Portainer Agent naar Portainer Server
#
#
# Uitgaande Poorten
# #####################################################
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
#
#    sudo lsof -i -P -n | grep LISTEN
#
#
#
#
#
# ######################
# TO DO
# ######################
#
# Netplan
# Ansible DEMO aanpassen
#
#
#
#
# ################################################################################
# ################################################################################
# CHANGELOG
# ################################################################################
# ################################################################################
#
#
#
#
# ######################
# Version 1
# ######################
# Unix LF ipv Windows CRLF (1.1.0)
# Bugfixes (1.1.1)
# Onderverdeling (1.1.2)
# Bugfixes (1.1.4)
# Bugfixes (1.1.5)
# chown (1.1.7)
# containers intro infra dockerfile demo (1.1.8) 
# bugfixes (1.1.9)
# minikube en bugfixes (1.2.1) 
# bugfixes (1.2.2) 
# portainer (1.2.4) 
# portainer remove en KubeADM (1.2.5)
# Ubuntu Desktop IT Fundamentals Docker als Script MiniKube als Script (1.2.6)
#
#
#
#
# #######################
# Version 2 
# #######################
# Hoofdmenu met keuzes en check sources.list (2.0.0.161123 DEVELOP) 
# Functies (2.0.0.181123 DEVELOP) 
# flask demo en minikube(2.0.0.241123 DEVELOP)
# meerdere talen flash demo (2.0.0.301123 DEVELOP) 
# ubuntu update repo als functie (2.0.0.301123 DEVELOP)
# hosts bestand aanpassen (2.0.0.02122023 DEVELOP)
# ansible (2.0.0.x) 
# vagrantfile 6.x (08122023) 
# bugfiles (09122023)
# Nieuwe GitHub Structuur verwerkt (29dec2023)
# Semaphore Ansible Management installatie opgenomen binnen Ansible 
#
#
#
#
# #######################
# Version 3
# #######################
# Opdelen script in compomenten in plaats van keuzes via menu
# Opdelen script in functies die aangeroepen kunnen worden 
#
# 02aug24 Eerst uitvoerbare versie script
# 03aug24 parameters aanpassen en uitbreiden 
# 07aug24 DNS 
# 08aug24 Powershell 
# 12aug24 IP Settings VM
# 14aug24 Netplan en Maak Directories
# 17aug24 Minikube voorbeelden opgenomen uit V2 script
# 24aug24 Buildroot en nieuwe manier om distro op te halen (NAME)
# 27aug24 S L en Xl implementatie van introductie Infrastructuren
# 29aug24 Docker Compose Buildroot bugfixes
# 26okt24 Images pull Docker aangepast
# 22mrt25 Podman en aangepaste installatie Powershell 
# 14apr25 Status naar BETA gezet en Hostnamen aangepast demo VM
# 26apr25 Github links herstel 
# 23mei25 Minikube VM BuildRoot uitbreiding opties
# 24mei25 Nieuwe manier sourcelist aanpassing # Nieuwe functie Docker Compose Ubuntu
# 26mei25 Jenkins
# 18juni25 Configuratie Open VM Tools Share richting VMware Worksstation of Fusion Hypervisor 
# 18juni25 Introductie Ubuntu Basis config functie
# 25juni25 Ubuntu Repository instellingen  
# 25juni25 testrun Docker op Ubuntu
#
#
#
#
# #######################
# Version 4
# #######################
# 27juni25 Eerste Implementatie Git Clone in plaats van directories aan te maken in dit script
# 01juli25 Jenkins repo toevoegen aangepast en Java installatie van jdk naar jre en versie 17 naar 21
# 03juli25 Installatie OpenMediaVault binnen Debian op nieuwe manier 
# 03juli25 nieuwe functie ulx_os_default_apps
# 04juli25 Nested Functies Docker en GitHub Clone 
# 05juli25 Van Canary Channel naar Dev Channel 
# 05juli25 Menu nieuwe manier van werken opzetje gemaakt
# 05juli25 Nested Podman functie 
# 05juli25 Podman functies aangemaakt gelijk aan Docker Behalve Compose
# 05juli25 Comments Ubuntu Nested OOBE bij functies 
# 06juli25 Build 20 Developer blok toegevoegd 
# 06juli25 Powershell installatie stil gemaakt 
# 06juli25 Docker installatie stil gemaakt 
# 06juli25 Jenkins installatie stil gemaakt 
# 07juli25 Logging functie naar bestanden voor aantal onderdelen
# 07juli25 Melding OOBE stap 2 aangepast 
# 07juli25 Netplan DNS settings functie gemaakt
# 07juli25 TCP poorten 
# 07juli25 Docker Compose if then lus aangepast
# 07juli25 Minikube Docker configuratie functie weer actief gemaakt en voorzien van check op aanwezigheid Docker
# 07juli25 if then lus bij mount vmware voor foutmelding 107
# 08juli25 EduRoam getest Script werkt DNS settings staan goed 
# 08juli25 Minikube configuratie
# 09juli25 NeoFetch SuperFetch
# 09juli25 Snap Curl ipv Curl
# 11juli25 Yacht Container Management zie https://www.youtube.com/watch?v=bsB2dvpdBYg van 6 minuten 
# 12juli25 Docker Management Tools functie 
# 12juli25 Visual Studio Code Server native en Docker 
# 12juli25 Visual Studio Code Server sed bug fixed 
# 18juli25 Build 32 Jenkins als Container in plaats van native install
# 18juli25 Build 32 Visual Studio Code Server als Container in plaats van native install 
# 19juli25 Edu link naar Canary latest opgenomen in kop van het script
#
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
#
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
# xxjuli25 Bxx Jenkins Wachtwoord bestand aanmaak fixen
#
#
# ################################################################################
# ################################################################################
# FASEN
# ################################################################################
# ################################################################################
#
#
#
#
# ################################################################################
# Fase 1 
# Controle van de omstandigheden bij de start van het script 
# Alle Distributies
# ################################################################################
#
#
#
#
# Controleer execute als sudo
if [ $(id -u) -ne 0 ]; then
    echo 'Script NIET gestart met sudo. Start dit script met sudo LUCT-V4-latest.sh [parameter]'
    echo 'Script NOT started with sudo. Start this script with sudo LUCT-V4-latest.sh [parameter]'
    exit 1
fi
#
#
# Controleer of er een parameter is meegegeven
#
#
if [ $# -eq 0 ]; then
    echo 'No parameter specified !' 
    echo 'Available parameters:'
    echo 'upgrade    to update to latest version of distro'
    echo 'docker     for installation docker with demo environment'
    echo 'minikube   for installation minikube with worker nodes on docker'
    echo 'ansible    for demo environment Ansible'
    echo 'onderwijs  for demo environment Saxion HBO ICT'
    exit 1
fi
#
#
#
#
#
# ################################################################################
# Fase 2
# Vullen van de variabelen noodzakelijk voor het uitvoeren van dit script
# Alle distributies 
# ################################################################################
#
#
#
#
# Onderstaande variabelen krijgen ook inhoud door source /etc/os-release te doen
# Source kan alleen als gewone gebruiker gedaan worden dus niet als sudo 
PRETTY_NAME=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
NAME=$(grep '^NAME=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
VERSION=$(grep '^VERSION=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
VERSION_ID=$(grep '^VERSION_ID=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
VERSION_CODENAME=$(grep '^VERSION_CODENAME=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
#
#
#
#
hostname=$(hostname)
#
#
#
#
GH_JATUTERT_RAW="raw.githubusercontent.com/jatutert"
GH_JATUTERT_DEMO_ANSIBLE_VM="demos/main/Ansible/Guest"
#
#
#
#
# ################################################################################
# Fase 3
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES
# ################################################################################
#
#
#
#
# ################################################################################
# Fase 3A
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES
# ALPINE LINUX
#
# Planned for 2026 
#
# ################################################################################
#
#
#
#
#   #######################
#   3A  Function Alpine 
#       Bijwerken
#   #######################
#
#
#
#
function alx_update_os () {
    apk update -q
    apk upgrade -q
    apk fix -d -q
    apk add open-vm-tools 
}
#
#
#
#
#   #######################
#   3A  Function Alpine 
#       VM Tools Installatie 
#   #######################
#
#
#
#
function alx_vm_tools () {
    apk add open-vm-tools 
}
#
#
#
#
# ################################################################################
# Fase 3B
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES
# BuildRoot (Minikube VM) LINUX
# ################################################################################
#
#
#
#
#   #######################
#   3B  Function BuildRoot 
#       Docker Compose Installation 
#   #######################
#
#
#
#
function build_install_compose () {
    #
    mkdir -p /home/$SUDO_USER/.docker/cli-plugins
    /snap/bin/curl -s -SL https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-linux-x86_64 -o /home/$SUDO_USER/.docker/cli-plugins/docker-compose
    chmod a+x /home/$SUDO_USER/.docker/cli-plugins/docker-compose
    #
}
#
#
#
#
#  #######################
#  3B   Function BuildRoot 
#       BASH Configuratie Settings
#  #######################
#
#
#
#
function build_bash_config () {
    #
    # Downloaden settings bestand
    /snap/bin/curl -s -o /home/docker/.bashrc https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/.bashrc
    # Downloaden bestand dat settings bestand automatisch activeert
    /snap/bin/curl -s -o /home/docker/.bash_profile https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/.bash_profile
    # 
    # echo '#! /bin/bash' > /home/docker/bash_config.sh
    # echo 'source /etc/bash.bashrc' >> /home/docker/bash_config.sh
    # chmod a+x /home/docker/bash_config.sh
}
#
#
#
#
# ################################################################################
# Fase 3D
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES
# Debian LINUX
# ################################################################################
#
#
#
#
# 3D1 CATEGORIE Debian OS FUNCTIES
#
#
#
#
# 3D11 Debian OS FUNCTIES ## Functie Change Repo Debian
#      Ubuntu Basis Config wordt gebruikt
#
#
#
#
# 3D12 Debian OS FUNCTIES ## Functie Update Debian Repo
#      Ubuntu Basis Config wordt gebruikt
#
#
#
#
# 3D13 Debian OS FUNCTIES ## Functie Upgrade Debian
#      Ubuntu Basis Config wordt gebruikt
#
#
#
#
# 3U2 CATEGORIE Debian OS Install Software Functies
#
#
#
#
# 3U21 Debian OS Install Software Functies ## Functie Installatie OS Open VM Tools
#      Ubuntu functie wordt gebruikt
#
#
#
#
#   #######################
#   3U21 Debian OS Install Software Functies 
#        Functie Installatie OS OpenMediaVault
#   #######################
#
#
#
#
function dbn_install_omv () {
    #
    wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash
    #
}
#
#
#
#
# ################################################################################
# Fase 3U
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES
# UBUNTU LINUX
# ################################################################################
#
#
# 3U1 CATEGORIE UBUNTU OS FUNCTIES
#
#
#   #######################
#   3U11 UBUNTU OS FUNCTIES
#        Functie Change Repo Ubuntu
#        Onderdeel van Ubuntu Nested OOBE Functie 
#   #######################
#
#
#
#
function ulx_os_change_repo_nl () {
    #
    VERSION_ID=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
    #
    if [ $VERSION_ID == "22.04" ] ; then
        if grep -q "mirrors.edge.kernel.org" /etc/apt/sources.list; then
            sed "s@mirrors.edge.kernel.org@nl.archive.ubuntu.com@" -i /etc/apt/sources.list
        else
            # Replace the value with nl.archive.ubuntu.com
            echo "Mirrors.edge.kernel.org is not an active repository and thus no action taken"
        fi
        #
        if grep -q "nl.archive.ubuntu.com" /etc/apt/sources.list; then
            echo "Ubuntu Repository is set up correctly"
        else
            # Replace the value with nl.archive.ubuntu.com
            sed "s@archive.ubuntu.com@nl.archive.ubuntu.com@" -i /etc/apt/sources.list
        fi
    fi
    #
    if [ $VERSION_ID == "24.04" ] ; then
        # Vervang tweede tekstregel door nieuwe inhoud 
        sed -i '2c\URIs: http://mirror.ams.macarne.com/ubuntu/' /etc/apt/sources.list.d/ubuntu.sources > /home/$SUDO_USER/luct_logs/add-apt-repository.log
        # Voeg nieuwe repo toe 
        add-apt-repository http://mirror.nl.datapacket.com/ubuntu/ -s -y >> /home/$SUDO_USER/luct_logs/add-apt-repository.log
        #
    fi
}
#
#
#
#
#   #######################
#   3U12 UBUNTU OS FUNCTIES
#        Functie Update Ubuntu OS
#        Onderdeel van Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function ulx_os_update_apt () {
    apt update -qq > /dev/null 2>&1
}
#
#
#
#
#   #######################
#   3U13 UBUNTU OS FUNCTIES
#        Functie Upgrade Ubuntu OS 
#        Onderdeel van Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function ulx_os_upgrade_os () {
    apt update -qq > /dev/null 2>&1
    apt upgrade -qq -y > /dev/null 2>&1
    apt autoremove -qq -y > /dev/null 2>&1
}
#
#
#
#
#   #######################
#   3U14 UBUNTU OS FUNCTIES
#        Standaard applicaties Ubuntu OS
#        Onderdeel van Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function ulx_os_default_apps () {
    #
    # APT
    #
    apt install 7zip -y > /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install apt-transport-https -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install dmidecode -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install dpkg -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install git -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install gzip -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install mc -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install nano -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install neofetch -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install php libapache2-mod-php -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install php-{gd,imap,xml,json,mbstring,mysql,intl,apcu,zip} -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install python3 -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install screenfetch -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install software-properties-common -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install tar -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install ubuntu-drivers-common -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install wget -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    apt install wget2 -y >> /home/$SUDO_USER/luct_logs/ulx_os_default_apps.log 2>&1
    #
    # SNAP
    #
    snap install curl >> /home/$SUDO_USER/luct_logs/ulx_os_default_snap_apps.log 2>&1
    #
}
#
#
#
#
#   #######################
#   3U15 UBUNTU OS FUNCTIES
#        Functie Change Timezone OS 
#        Onderdeel van Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function ulx_os_config_timezone () {
    timedatectl set-timezone Europe/Amsterdam > /home/$SUDO_USER/luct_logs/ulx_os_config_timezone.log 2>&1
}
#
#
#
#
#   #######################
#   3U16 UBUNTU OS FUNCTIES 
#        Functie NIC Config OS
#        Onderdeel van Ubuntu Nested OOBE Functie
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
    if [[ $hostname =~ "u24-lts-s-dbms" ]] ; then
        curl -s -o /home/$SUDO_USER/netplan/dbms-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/OSTicket/Guest/Ubuntu/Netplan/Databaseserver/eth/eth-sec-nic-01-netcfg-dbms.yaml
    fi
    #
    # Introductie Infrastructuren
    # WebServer
    #
    # if [ $hostname == "u24-lts-s-wsrv-001" ] ; then
    if [[ $hostname =~ "u24-lts-s-wsrv" ]] ; then
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
#   3U17 UBUNTU OS FUNCTIES
#        Functie Change DNS OS
#        Onderdeel van Ubuntu Nested OOBE Functie
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
    netplan apply > /home/$SUDO_USER/luct_logs/ulx_os_config_dns.log 2>&1
#
#
else
    echo 'Geen geldige netwerkinterface gevonden (eth* of ens*)'
fi
#
}
#
#
#
#
#   #######################
#   3U18 UBUNTU OS FUNCTIES
#        GNOME GUI Install
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
    ulx_os_update_apt
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
# 3U2 CATEGORIE UBUNTU OS Install Software Functies
#
#
#
#
#   #######################
#   3U21 UBUNTU OS Install Software Functies
#        Functie Installatie OS Open VM Tools
#        Onderdeel van Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function ulx_install_vm_tools () {
    #
    if sudo dmidecode | grep -iq vmware; then
        echo 'Virtualized by VMware detected'
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
        else
            echo "Mount successful"
        fi
    else
        echo 'No virtualization by VMware detected'
    fi
    #
}
#
#
#   #######################
#   3U22 UBUNTU OS Install Software Functies
#        Functie Installatie OS Powershell
#        Onderdeel van Ubuntu Nested OOBE Functie
#   #######################
#
#
#   Powershell 7 is te starten met pwsh commando
#
#
function ulx_install_pwrshell () {
    #    # Vullen variable Version ID
    #    source /etc/os-release
    #    #
    #    /snap/bin/curl -s -SL "https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb" -o "/tmp/packages-microsoft-prod.deb"
    #    # wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
    #    dpkg -i /tmp/packages-microsoft-prod.deb > /home/$SUDO_USER/luct_logs/luct_pwsh.log 2>&1
    #    apt update -qq >> /home/$SUDO_USER/luct_logs/luct_pwsh.log 2>&1
    #    apt install powershell -y >> /home/$SUDO_USER/luct_logs/luct_pwsh.log 2>&1
    #    rm /tmp/packages-microsoft-prod.deb >> /home/$SUDO_USER/luct_logs/luct_pwsh.log 2>&1
    #
    snap install powershell --classic > /home/$SUDO_USER/luct_logs/ulx_install_pwrshell.log 2>&1
    #
}
#
#
#   #######################
#   3U23 UBUNTU OS Install Software Functies
#        Functie Installatie OS Python
#        Onderdeel van Ubuntu Nested OOBE Functie
#   #######################
#
#
function ulx_install_python3 () {
    #
    ln -s /usr/bin/python3 /usr/local/bin/python
    #
}
#
#
#   #######################
#   3U24 UBUNTU OS Install Software Functies
#        Functie Installatie OS Cockpit
#        Onderdeel van Ubuntu Nested OOBE Functie
#   #######################
#
#
function ulx_install_cockpit () {
    #
    apt install -qq -y cockpit > /home/$SUDO_USER/luct_logs/ulx_install_cockpit.log 2>&1
    # Aanmaken Cockpit Service
    systemctl enable --now cockpit.socket >> /home/$SUDO_USER/luct_logs/ulx_install_cockpit.log 2>&1
    # Aanpassen Poort 
    rm -f /tmp/listen.conf
    echo '[Socket]' > /tmp/listen.conf
    echo 'ListenStream=' >> /tmp/listen.conf
    echo 'ListenStream=8101' >> /tmp/listen.conf
    mkdir -p /etc/systemd/system/cockpit.socket.d/
    cp /tmp/listen.conf /etc/systemd/system/cockpit.socket.d
    #
    systemctl daemon-reload >> /home/$SUDO_USER/luct_logs/ulx_install_cockpit.log 2>&1
    systemctl restart cockpit.socket >> /home/$SUDO_USER/luct_logs/ulx_install_cockpit.log 2>&1
}
#
#
# 3U25 UBUNTU OS Install Software Functies ## Functie Installatie Docker
#
#
function ulx_install_docker () {
    #
    # Check aanwezigheid Podman
    #
    if ! [ -x "$(command -v podman)" ]; then
        #
        # Podman is niet aanwezig 
        #
        # Check aanwezigheid Docker
        #
        if ! [ -x "$(command -v docker)" ]; then
            #
            # Podman is niet aanwezig
            # Docker is niet aanwezig
            # Installeer Docker
            #
            apt purge -qq -y lxc-docker* || true
            #
            /snap/bin/curl -sSL https://get.docker.com/ | sh > /home/$SUDO_USER/luct_logs/ulx_install_docker.log 2>&1
            #
            service docker start >> /home/$SUDO_USER/luct_logs/ulx_install_docker.log 2>&1
            #
            usermod -a -G docker $SUDO_USER >> /home/$SUDO_USER/luct_logs/ulx_install_docker.log 2>&1
            #
        else
            #
            # Podman is niet aanwezig
            # Docker is wel aanwezig 
            # 
            echo 'Docker is already installed.'
        fi
    else
        #
        # Podman is aanwezig
        # Installatie Docker wordt overgeslagen
        # 
        echo 'Podman is installed. Skipping installation of Docker.'
        #
    fi
    #
}
#
#
# 3U26 UBUNTU OS Install Software Functies ## Functie Installatie Docker Compose Nieuwste versie  
#
#
# Overbodig want Docker doet al installatie van nieuwste versie van Docker Compose Plugin
#
#
# 20 juli 2025 Docker Compose staat op heel andere locatie dan Plugin dir hieronder
#
#
function ulx_install_docker_compose () {
    #
    # echo "Controleren of Docker is geïnstalleerd..."
    #
    if command -v docker &> /dev/null; then
        #
        # Maak de plugin directory aan als die nog niet bestaat
        PLUGIN_DIR="/usr/local/lib/docker/cli-plugins"
        mkdir -p "$PLUGIN_DIR"
        #
        # echo "Downloaden van Docker Compose plugin..."
        /snap/bin/curl -s -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64" -o "$PLUGIN_DIR/docker-compose"
        #
        # echo "Rechten instellen..."
        chmod +x "$PLUGIN_DIR/docker-compose"
        # echo "Docker Compose plugin geïnstalleerd op: $PLUGIN_DIR/docker-compose"
        #
        # echo "Controleren of Docker Compose werkt..."
        # docker compose version
    else
        echo "Docker is niet geïnstalleerd. Installeer Docker om verder te gaan."
    fi
    #
}
#
#
# 3U27 UBUNTU OS Install Software Functies ## Functie Installatie Podman
#
#
function ulx_install_podman () {
    #
    # Check aanwezigheid Docker 
    #
    if ! [ -x "$(command -v docker)" ]; then
        #
        # Docker is NIET aanwezig 
        #
        # Check aanwezigheid Podman
        #
        if ! [ -x "$(command -v podman)" ]; then
            #
            # Docker is niet aanwezig
            # Podman is niet aanwezig 
            # Installeer Podman
            #
            apt update -qq
            apt install -y podman > /home/$SUDO_USER/luct_logs/ulx_install_podman.log 2>&1
            service podman start 
            # sudo systemctl start podman.socket = alternatief voor service podman start
            #
            # Omdat PodMan rootless werkt is toevoegen aan groep NIET noodzakelijk 
            #
        else
            #
            # Podman is reeds aanwezig
            #
            echo 'Podman is already installed.'
            #
        fi
    else
        # Docker is aanwezig
        echo 'Docker is installed. Skipping installation of Podman.'
        #
    fi
    #
}
#
#
# 3U28 UBUNTU OS Install Software Functies ## Functie Installatie IAC Ansible
#
#
function ulx_install_ansible_master () {
    #
    #
    # ###########################
    # ## Ansible               ##
    # ## Automation Controller ##
    # ###########################
    #
    #
    # Ansible Automation Controller step 1
    # Ansible toevoegen aan repository
    #
    # 1A Ansible Repo toevoegen 
    apt-add-repository ppa:ansible/ansible -y > /home/$SUDO_USER/luct_logs/ulx_install_ansible_master.log 2>&1
    # 1B Updaten APT
    apt update -qq >> /home/$SUDO_USER/luct_logs/ulx_install_ansible_master.log 2>&1
    #
    # Ansible Automation Controller step 2
    # Installatie Ansible Controller
    #
    apt install ansible -y >> /home/$SUDO_USER/luct_logs/ulx_install_ansible_master.log 2>&1
    #
    # Ansible Automation Controller step 3
    # Installatie SSHPASS
    # 
    apt update -qq >> /home/$SUDO_USER/luct_logs/ulx_install_ansible_master.log 2>&1
    apt install sshpass -y >> /home/$SUDO_USER/luct_logs/ulx_install_ansible_master.log 2>&1
    #
    # Ansible Automation Controller step 4
    # Aanpassen etc hosts bestand
    #
    hostname=$(hostname)
    #
    if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
        eth_interface=$(ip -o link show | awk '$2 ~ /^eth[0-9]+:/ {print $2}' | sed 's/:$//' | head -n 1)
        if [ -n "$ens_interface" ]; then
            eth_ip=$(ip -o -4 addr show dev "$eth_interface" | awk '{print $4}' | cut -d/ -f1)
            IFS=. read -r a b c d <<< "$eth_ip"
            eth_plus1_ip="$a.$b.$c.$((d+1))"
            # Sla de IP-adressen op in afzonderlijke variabelen
            eth_ip_var="eth_ip=$eth_ip"
            eth_plus1_ip_var="eth_plus1_ip=$eth_plus1_ip"
            # Aanpassen hosts bestand 
            if grep -q "$eth1_ip" /etc/hosts; then
                echo "$hostname already exists in /etc/hosts"
            else
                # Add the hostname and IP address to /etc/hosts
                echo "$eth_ip ansible_demo_ctrl_001" | sudo tee -a /etc/hosts > /dev/null
                echo "$eth_plus1_ip ansible_demo_host_001" | sudo tee -a /etc/hosts > /dev/null
                echo "Hostname $hostname added to /etc/hosts"
            fi
        fi
    fi
    #
    if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
        ens_interface=$(ip -o link show | awk '$2 ~ /^ens[0-9]+:/ {print $2}' | sed 's/:$//' | head -n 1)
        if [ -n "$ens_interface" ]; then
            ens_ip=$(ip -o -4 addr show dev "$ens_interface" | awk '{print $4}' | cut -d/ -f1)
            IFS=. read -r a b c d <<< "$ens_ip"
            ens_plus1_ip="$a.$b.$c.$((d+1))"
            # Sla de IP-adressen op in afzonderlijke variabelen
            ens_ip_var="ens_ip=$ens_ip"
            ens_plus1_ip_var="ens_plus1_ip=$ens_plus1_ip"
            # Aanpassen hosts bestand 
            if grep -q "$eth1_ip" /etc/hosts; then
                echo "$hostname already exists in /etc/hosts"
            else
                # Add the hostname and IP address to /etc/hosts
                echo "$ens_ip ansible_demo_ctrl_001" | sudo tee -a /etc/hosts > /dev/null
                echo "$ens_plus1_ip ansible_demo_host_001" | sudo tee -a /etc/hosts > /dev/null
                echo "Hostname $hostname added to /etc/hosts"
            fi
        fi
    fi
    #
    # Ansible Automation Controller step 5
    #
    # geen vagrant omgeving
    if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
        mkdir -p /etc/ansible/inventory 
        cp /demos/Ansible/Guest/Inventory/ansible-demo-inventory-LUCT-4 /etc/ansible/inventory
        sed "s@gebruikersnaam@nl.archive.ubuntu.com@" -i /etc/ansible/inventory/ansible-demo-inventory-LUCT-4


    WORD_TO_REPLACE="gebruikersnaam"
    sed -i "s/$WORD_TO_REPLACE/$SUDO_USER/g" /etc/ansible/inventory/ansible-demo-inventory-LUCT-4


    fi
    #
    # vagrant omgeving 
    #
    #
    #
    #
    # Ansible Automation Controller step 6
    # Aanpassen ansible config met Inventory
    if grep -q "defaults" /etc/ansible/ansible.cfg; then
        echo "Ansible Configuratiebestand reeds voorzien van Inventory"
    else
        # Add the hostname and IP address to /etc/hosts
        echo "[defaults]" | sudo tee -a /etc/ansible/ansible.cfg > /dev/null
        echo "inventory = inventory/" | sudo tee -a /etc/ansible/ansible.cfg > /dev/null
        echo "Ansible Configuratiebestand voorzien van Inventory"
    fi
    #
    # STAP 8
    # Playbooks overzetten van Git Clone naar juiste locatie
    mkdir -p /home/$SUDO_USER/playbooks >> /home/$SUDO_USER/luct_logs/ulx_install_ansible_master.log 2>&1
    chown -f -R $SUDO_USER /home/$SUDO_USER/playbooks >> /home/$SUDO_USER/luct_logs/ulx_install_ansible_master.log 2>&1
    #
    #
    # cp x y 
    #
    #
    # STAP 9
    # SSH verbinden script maken 
    # Uitvoeren als user Vagrant en niet als Root anders krijg je SSH foutmelding bij Ansible 
    echo "Stap 7 - SSH Verbindingsscript maken gestart ..."
    echo 'echo Uitvoeren als user Vagrant en niet als Root' > /home/$SUDO_USER/ansible_host_ssh.sh
    echo 'sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@ulx-s-2204-l-a-010' > /home/$SUDO_USER/ansible_host_ssh.sh 
    chmod +x /home/$SUDO_USER/ansible_host_ssh.sh
    #
} 

function ulx_install_ansible_slave () {
    #
    #
    # ###########################
    # ## Ansible               ##
    # ## Automation Slave      ##
    # ###########################
    #
    #
    #
    # Stap 1 Installatie SSHPASS
    # 
    # Starten installatie sshpass
    apt update -qq
    apt install sshpass -y
    #
    # Stap 2 Aanpassen etc hosts bestand
    #
    # vullen variable hostname
    hostname=$(hostname)
    # Haal het IP-adres van eth1 op
    eth1_ip=$(ip addr show eth1 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
    # Voeg 1 toe aan het IP-adres van eth1
    IFS=. read -r a b c d <<< "$eth1_ip"
    eth1_min1_ip="$a.$b.$c.$((d-1))"
    # Sla de IP-adressen op in afzonderlijke variabelen
    eth1_ip_var="eth1_ip=$eth1_ip"
    eth1_min1_ip_var="eth1_min1_ip=$eth1_min1_ip"
    if grep -q "$eth1_ip" /etc/hosts; then
        echo "$hostname already exists in /etc/hosts"
    else
        # Add the hostname and IP address to /etc/hosts
        echo "$eth1_ip ansible_demo_host_001" | sudo tee -a /etc/hosts > /dev/null
        echo "$eth1_min1_ip ansible_demo_ctrl_001" | sudo tee -a /etc/hosts > /dev/null
        echo "Hostname $hostname added to /etc/hosts"
    fi
    #
    # Stap 3 SSH verbinden script maken 
    echo 'echo Uitvoeren als user Vagrant en niet als Root' > /home/$SUDO_USER/ansible_cntrl_ssh.sh 
    echo 'sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@ulx-s-2204-l-a-001' > /home/$SUDO_USER/ansible_cntrl_ssh.sh 
    chmod +x /home/$SUDO_USER/ansible_cntrl_ssh.sh 
    #
    # Stap x
    #
}
#
#
# 3U29 UBUNTU OS Install Software Functies ## Functie Installatie IAC Ansible Semaphore
#
#
function ulx_install_ansible_semaphore () {
    # Installatie semaphore 
    # https://docs.semui.co/administration-guide/installations
    #
    echo "Installatie SemaPhore gestart ..."
    snap install semaphore
    snap stop semaphore
    semaphore user add --admin --login labadmin --name=labadmin --email=labadmin@mail.local --password=labadmin
    semaphore user add --admin --login vagrant --name=vagrant --email=vagrant@mail.local --password=vagrant
    semaphore user add --admin --login ubuntu --name=ubuntu --email=ubuntu@mail.local --password=ubuntu
    semaphore user add --admin --login osboxes --name=osboxes --email=osboxes@mail.local --password=osboxes
    snap start semaphore
    # Aanpassen standaard poort 3000 naar 8301
    snap set semaphore port=8301
    # Herstarten com nieuwe poort actief te maken
    snap restart semaphore
}
#
#
# 3U30 UBUNTU OS Install Software Functies ## Functie JAVA 
#
# ##########################
# ## NIET MEER IN GEBRUIK ##
# ##########################
#
function ulx_install_java_jdk () {
    #
    apt install fontconfig -y > /dev/null 2>&1
    apt install openjdk-21-jre -y > /home/$SUDO_USER/luct_logs/luct_java_21_jre.log 2>&1
    #    apt install openjdk-17-jdk -y
    #
}
#
#
# 3U31 UBUNTU OS Install Software Functies ## Functie Jenkins
#
# ##########################
# ## NIET MEER IN GEBRUIK ##
# ##########################
#
function ulx_install_jenkins () {
    #
    #
    #
    #
    wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key > /dev/null 2>&1
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    #    
    #
    #    # Add Jenkins repository key
    #    curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    #    #
    #    # Add Jenkins repository
    #    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    #
    #
    # Install Jenkins
    apt update -qq > /dev/null 2>&1
    apt install jenkins -y > /home/$SUDO_USER/luct_logs/luct_jenkins.log 2>&1
    #
    # Poortnummer aanpassen van 8080 naar 8201
    sed "s/^HTTP_PORT=.*/HTTP_PORT=8201/" -i /etc/default/jenkins
    #
    # Start and enable Jenkins
    systemctl enable jenkins > /dev/null 2>&1
    systemctl start jenkins > /dev/null 2>&1
    #
    # UWF poort openzetten indien van toepassing 
    # ufw allow $JENKINS_PORT
    #
    # Get initial admin password
    # cat /var/lib/jenkins/secrets/initialAdminPassword
    #
    #
    # Jenkins is hierna bereikbaar via ip adres van de vm met ip poort 8201 standaard poort 8080
    # Als wachtwoord moet je wachtwoord uit initialAdminPassword zoals hierboven invoeren 
} 
#
#
# 3U32 UBUNTU OS Install Software Functies ## Visual Studio Code Server
#
# ##########################
# ## NIET MEER IN GEBRUIK ##
# ##########################
#
function ulx_install_vscode_server () {
    # Installatie van code-server 
    /snap/bin/curl -fsSL https://code-server.dev/install.sh | sh
    #
    # Service aanmaken 
    systemctl enable --now code-server@$USER
    # Service starten 
    systemctl start code-server@$USER
    #
    # Wachtwoord uitzetten
    sed -i.bak 's/auth: password/auth: none/' /home/$SUDO_USER/.config/code-server/config.yaml
    # Bind adres aanpassen
    sed "s@:127.0.0.1@:0.0.0.0@" -i /home/$SUDO_USER/.config/code-server/config.yaml
    # Poort aanpassen naar eigen voorkeurspoort
    #
    # LET OP # Jenkins zit standaard ook op poort 8080
    #
    sed "s@:8080@:9103@" -i /home/$SUDO_USER/.config/code-server/config.yaml
    # Herstarten
    systemctl restart code-server@$USER
    # 
    # Visual Studio Code Server is nu beschikbaar op IP adres van VM met poort 9103
    #
#
#
# Foutmeldingen
# 
# [Fixed] sed: can't read /root/.config/code-server/config.yaml: Permission denied
# sed: can't read /home/ubuntu/.config/code-server/config.yaml: No such file or directory
# sed: can't read /home/ubuntu/.config/code-server/config.yaml: No such file or directory
#
#
}
#
#
# ################################### EINDE INSTALLATIE ###############################
#
#
#
#
# 3U4 CATEGORIE UBUNTU OS DOCKER Software Functies 
#
#
#
#
# 3U41 UBUNTU UBUNTU OS DOCKER Software Functies ## Images Pull
#
#
function ulx_docker_images_pull () {
    #
    # Script wordt uitgevoerd als sudo en daarom wordt functie ook gedaan sudo
    #
    # docker pull -q hello-world > /dev/null 2>&1
    #
    # ## Operating Systems
    #
    # ## Alpine
    docker pull -q alpine:latest > /dev/null 2>&1
    docker pull -q alpine:3.5 > /dev/null 2>&1
    # Bash is eigenlijk Alpine Linux Image 
    # docker pull -q bash:latest
    # 
    docker pull -q amazonlinux:latest > /dev/null 2>&1
    # 
    docker pull -q clearlinux:latest > /dev/null 2>&1
    # 
    docker pull -q debian:latest > /dev/null 2>&1
    # 
    docker pull -q photon:latest > /dev/null 2>&1
    # 
    # ## Ubuntu
    # docker pull -q ubuntu:20.04
    # docker pull -q ubuntu:22.04
    #
    # ## Middleware
    #
    # ### CMS
    # docker pull -q wordpress
    #
    # ### DBMS
    # docker pull -q mariadb:10.6
    # docker pull -q postgres:latest
    #
    # ### Storage
    # docker pull -q minio/minio
    # docker pull -q nextcloud
    #
    # ### Webservers
    # docker pull -q ubuntu/apache2:latest
    docker pull -q httpd:latest > /dev/null 2>&1
    docker pull -q nginx > /dev/null 2>&1
    docker pull -q prakhar1989/static-site > /dev/null 2>&1
    #
    # ## Management 
    docker pull -q portainer/portainer-ce:latest > /dev/null 2>&1
    docker pull -q selfhostedpro/yacht:latest > /dev/null 2>&1
    docker pull -q codercom/code-server:latest > /dev/null 2>&1
    docker pull -q jenkins/jenkins:latest-jdk21 > /dev/null 2>&1
    #
    # ## Registry
    docker pull -q registry > /dev/null 2>&1
    #
    docker images > /home/$SUDO_USER/luct_logs/ulx_docker_images_pull.log 2>&1
}
#
#
# 3U42 UBUNTU UBUNTU OS DOCKER Software Functies ## Portainer Create
#
#
function ulx_docker_portainer_create () {
    #
    # Pull Image
    # Wordt gedaan door de functie Pull Images
    # docker pull -q portainer/portainer-ce:latest > /dev/null 2>&1
    #
    # Docker Volume Aanmaken voor Portainer
    docker volume create portainer_data > /dev/null 2>&1
    #
    # Docker Run Portainer
    # HOST PORT / CONTAINER PORT
    # Poorten
    # Port 8000: Used for the TCP tunnel server, primarily for Edge Agent communication and is optional if not using Edge Compute features. 
    # Port 9443: Used by the Portainer Server for accessing the user interface (UI) and API. This is the default HTTPS port for Portainer
    # Port 9001: The default port used by the Portainer Agent to communicate with the Portainer Server. 
    docker run -d -p 8000:8000 -p 9101:9443 --name LUCT_portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
    #
    # Bash Shell Script maken Portainer
    echo '#! /bin/bash' > /home/$SUDO_USER/portainer_restart.sh
    #
    echo 'docker stop portainer' >> /home/$SUDO_USER/portainer_restart.sh
    echo 'docker start portainer' >> /home/$SUDO_USER/portainer_restart.sh
    #
    echo 'echo "Portainer is beschikbaar op"' >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo ""' >> /home/$SUDO_USER/portainer_restart.sh
    #
    if ip link show ens33 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show ens33 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/portainer_restart.sh
        echo 'echo "https://$IP:9101"' >> /home/$SUDO_USER/portainer_restart.sh
    fi
    #
    if ip link show eth0 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/portainer_restart.sh
        echo 'echo "https://$IP:9101"' >> /home/$SUDO_USER/portainer_restart.sh
    fi
    #
    echo 'echo ""' >> /home/$SUDO_USER/portainer_restart.sh
    #
    echo 'echo "Start Webbrowser op PC of Laptop en ga naar bovenstaand adres"'          >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo ""'          >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo "Gebruik onderstaande gegevens op het eerste scherm"'          >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo ""'          >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo "Gebruiker admin"' >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo "Wachtwoord password1234"' >> /home/$SUDO_USER/portainer_restart.sh
    #
    chmod +x /home/$SUDO_USER/portainer_restart.sh
    #
}
#
#
# 3U43 UBUNTU UBUNTU OS DOCKER Software Functies ## Portainer Remove
#
# ##########################
# ## NIET MEER IN GEBRUIK ##
# ##########################
#
function ulx_docker_portainer_remove () {
    docker stop portainer
    docker rm portainer
    docker rmi portainer/portainer-ce:latest
    docker volume rm portainer_data
    docker system prune
}
#
#
# 3U44 UBUNTU UBUNTU OS DOCKER Software Functies ## Yacht Create
#
#
function ulx_docker_yacht_create () {
    #
    # Docker Volume Aanmaken voor Yacht
    docker volume create yacht_data > /home/$SUDO_USER/luct_logs/ulx_docker_yacht_create.log 2>&1
    #
    # Docker Run Yacht
    docker run -d -p 9102:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht_data:/config --name LUCT_Yacht --restart=always selfhostedpro/yacht >> /home/$SUDO_USER/luct_logs/luct_start_Yacht.log 2>&1
    #
    # Bash Shell Script maken Yacht
    echo '#! /bin/bash' > /home/$SUDO_USER/yacht_restart.sh
    #
    echo 'docker stop yacht' >> /home/$SUDO_USER/yacht_restart.sh
    echo 'docker start yacht' >> /home/$SUDO_USER/yacht_restart.sh
    #
    echo 'echo "Yacht is beschikbaar op"' >> /home/$SUDO_USER/yacht_restart.sh
    echo 'echo ""' >> /home/$SUDO_USER/yacht_restart.sh
    #
    if ip link show ens33 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show ens33 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/yacht_restart.sh
        echo 'echo "https://$IP:9102"' >> /home/$SUDO_USER/yacht_restart.sh
    fi
    #
    if ip link show eth0 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/yacht_restart.sh
        echo 'echo "https://$IP:9102"' >> /home/$SUDO_USER/yacht_restart.sh
    fi
    #
    echo 'echo ""' >> /home/$SUDO_USER/yacht_restart.sh
    #
    echo 'echo "Start Webbrowser op PC of Laptop en ga naar bovenstaand adres"' >> /home/$SUDO_USER/yacht_restart.sh
    echo 'echo ""' >> /home/$SUDO_USER/yacht_restart.sh
    echo 'echo "Gebruik onderstaande gegevens op het eerste scherm"' >> /home/$SUDO_USER/yacht_restart.sh
    echo 'echo ""' >> /home/$SUDO_USER/yacht_restart.sh
    echo 'echo "Gebruiker admin@yacht.local"' >> /home/$SUDO_USER/yacht_restart.sh
    echo 'echo "Wachtwoord pass"' >> /home/$SUDO_USER/yacht_restart.sh
    #
    chmod +x /home/$SUDO_USER/yacht_restart.sh
    #
    # Aanmaken bestand met inloggegeven Yacht
    #
    echo "Gebruiker admin@yacht.local" > /home/$SUDO_USER/yacht_credentials.txt 
    echo "Wachtwoord pass" >> /home/$SUDO_USER/yacht_credentials.txt 
    #
}
#
#
# 3U45 UBUNTU UBUNTU OS DOCKER Software Functies ## VS Code Server Create
#
#
function ulx_docker_vscodesrv_create () {
   #
   # Definitie Configuratie Variabelen
   # 
   CONTAINER_NAME="LUCT_VSC_Server"
   PROJECT_DIR="/home/$SUDO_USER/demos"
   DOCKER_IMAGE="codercom/code-server:latest"
   #
   # Start Visual Studio Code Server als Container
   #
   docker run -d -p 9103:8080 -v "$PROJECT_DIR:/home/coder/project" --name "$CONTAINER_NAME" --restart=always "$DOCKER_IMAGE" --auth=none >> /home/$SUDO_USER/luct_logs/luct_start_vsc_srv.log 2>&1
   #
   # In Visual Studio Code Server is lokale omgeving zichtbaar onder Project
   #
}
#
#
# 3U46 UBUNTU UBUNTU OS DOCKER Software Functies ## Jenkins Create
#
#
function ulx_docker_jenkins_create () {
    #
    # Docker Volume Aanmaken voor Yacht
    docker volume create jenkins_data > /home/$SUDO_USER/luct_logs/ulx_docker_jenkins_create.log 2>&1
    #
    # Docker Run Jenkins
    docker run -d --name LUCT_Jenkins -p 9104:8080 -p 50000:50000 --restart=always -v jenkins_data:/var/jenkins_home jenkins/jenkins:latest-jdk21 >> /home/$SUDO_USER/luct_logs/luct_start_jenkins.log 2>&1
    #
    # Kopie maken van Initieel Wachtwoord bestand vanaf Docker Volume naar lokale omgeving 
    docker cp LUCT_Jenkins:/var/lib/jenkins/secrets/initialAdminPassword /home/$SUDO_USER/Jenkins_Wachtwoord.txt
    #
}
#
#
# 3U47 UBUNTU UBUNTU OS DOCKER Software Functies ## Docker Management Tools
#
#
function ulx_docker_mgmt_tools () {
    #
    #
    # Overzicht tools
    # https://www.tecmint.com/docker-tools/
    #
    #
    # ###########
    # Dive
    # https://github.com/wagoodman/dive
    # ###########
    #
    # Alternatieve installatiewijze
    # snap install dive 
    #
    DIVE_VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
    DIVE_DWNLD_URL="https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb"
    wget -O /home/$SUDO_USER/tmp/dive.tar.gz $DIVE_DWNLD_URL > /home/$SUDO_USER/luct_logs/dive.log 2>&1
    7z x /home/$SUDO_USER/tmp/dive.tar.gz -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct_logs/dive.log 2>&1
    apt install /home/$SUDO_USER/tmp/dive_${DIVE_VERSION}_linux_amd64.deb >> /home/$SUDO_USER/luct_logs/dive.log 2>&1
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
    echo 'echo "Dockly wordt gestart als Container"' > /home/$SUDO_USER/run_dockly.sh
    echo 'echo "Druk op q toets om Dockly te verlaten"' >> /home/$SUDO_USER/run_dockly.sh
    echo 'echo read -p "Druk op Enter om verder te gaan..." dummy' >> /home/$SUDO_USER/run_dockly.sh
    echo "docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock lirantal/dockly" >> /home/$SUDO_USER/run_dockly.sh
    chmod +x /home/$SUDO_USER/run_dockly.sh
    #
    #
    # ###########
    # Dry
    # https://github.com/moncho/dry
    # ###########
    #
    echo "docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_HOST=$DOCKER_HOST moncho/dry" > /home/$SUDO_USER/run_dry.sh
    chmod +x /home/$SUDO_USER/run_dry.sh
    #
    #
    # ###########
    # LazyDocker
    # https://github.com/jesseduffield/lazydocker
    # ###########
    #
    # Haal de nieuwste Lazydocker versie op
    LDV_MET_V=$(/snap/bin/curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
    LDV_ZONDER_V="${LDV_MET_V#v}"
    #
    # Zet variabele Download URL met hulp van voorgaande variabelen
    LD_DWNLD_URL="https://github.com/jesseduffield/lazydocker/releases/download/${LDV_MET_V}/lazydocker_${LDV_ZONDER_V}_Linux_x86_64.tar.gz"
    #
    # download nieuwste versie van LazyDocker
    wget -O /home/$SUDO_USER/tmp/lazydocker.tar.gz $LD_DWNLD_URL > /home/$SUDO_USER/luct_logs/lazydocker.log 2>&1
    #
    # Uitpakken 
    7z x /home/$SUDO_USER/tmp/lazydocker.tar.gz -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct_logs/lazydocker.log 2>&1
    7z x /home/$SUDO_USER/tmp/lazydocker.tar -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct_logs/lazydocker.log 2>&1
    #
    # Overzetten
    mv /home/$SUDO_USER/tmp/lazydocker /usr/local/bin/lazydocker >> /home/$SUDO_USER/luct_logs/lazydocker.log 2>&1
    #
    # Uitvoerbaar maken 
    chmod +x /usr/local/bin/lazydocker >> /home/$SUDO_USER/luct_logs/lazydocker.log 2>&1
    #
    echo 'sudo lazydocker' > /home/$SUDO_USER/lazydocker_run.sh
    #
    # ###########
    # WatchTower
    # https://github.com/containrrr/watchtower
    # ###########
    #
    docker run -d -p 9106:8080 --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower
}
#
#
# 3Uxx UBUNTU OS Install Software Functies ## Functie Configuratie Jenkins voor Docker
#
# ##########################
# ## NIET MEER IN GEBRUIK ##
# ##########################
#
function ulx_jenkins_docker () {

    # Add jenkins user to docker group
    usermod -aG docker jenkins

    # Restart Jenkins
    systemctl restart jenkins > /dev/null 2>&1

}
#
#
# 3U5 CATEGORIE UBUNTU OS DOCKER Minikube Software Functies 
#
#
#
#
# 3U51 UBUNTU UBUNTU OS DOCKER Minikube Software Functies ## Minikube Init
#
#
function ulx_docker_minikube_init () {
    #
    #
    #
    #
    # DOCKER
    #
    #
    #
    #
    #    if ! [ -x "$(command -v docker)" ]; then
    #         echo 'Commando DOCKER geeft GEEN resultaat' >&2
    #         # Installatie DOCKER-CE 
    #         # Call the function to install Docker
    #         ulx_nested_docker
    #    fi
    #
    #
    #
    #
    # MINIKUBE
    #
    #
    #
    #
    if ! [ -x "$(command -v minikube)" ]; then
        echo 'Minikube niet aangetroffen. Installatie gestart ...' >&2
        /snap/bin/curl -s -o /tmp/minikube_latest_amd64.deb https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
        dpkg -i /tmp/minikube_latest_amd64.deb > /home/$SUDO_USER/luct_logs/luct_minikube.log 2>&1
        rm /tmp/minikube_latest_amd64.deb
    fi 
    #
    #
    #
    #
    # KUBEADM
    #
    #
    #
    #
    if ! [ -x "$(command -v kubeadm)" ]; then
        # snap install kubeadm --classic --channel=latest > /dev/null 2>&1
        snap install kubeadm --classic --channel=latest >> /home/$SUDO_USER/luct_logs/luct_kubeadm.log 2>&1
    fi
    #
    #
    #
    #
    # KUBECTL
    #
    #
    #
    #
    if ! [ -x "$(command -v kubectl)" ]; then
        /snap/bin/curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" > /home/$SUDO_USER/luct_logs/luct_kubectl.log 2>&1
        chmod +x kubectl >> /home/$SUDO_USER/luct_logs/luct_kubectl.log 2>&1
        mv kubectl /usr/local/bin/ >> /home/$SUDO_USER/luct_logs/luct_kubectl.log 2>&1
        kubectl version --client >> /home/$SUDO_USER/luct_logs/luct_kubectl.log 2>&1
        # # snap install kubectl --classic --channel=latest > /dev/null 2>&1
        # snap install kubectl --classic --channel=latest
    fi
    #
    #
    #
    #
}
#
#
# 3U52 UBUNTU UBUNTU OS DOCKER Minikube Software Functies ## Minikube Config
#
#
function ulx_docker_minikube_config () {
   #
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
    #
}
#
#
# 3U6 CATEGORIE UBUNTU OS Podman Software Functies 
#
#
#
#
#
# 3U61 UBUNTU UBUNTU OS Podman Software Functies ## Images Pull
#
#
function ulx_podman_images_pull () {
    #
    # Script wordt uitgevoerd als sudo en daarom wordt functie ook gedaan sudo
    #
    # podman pull -q hello-world > /dev/null 2>&1
    #
    # Operating Systems
    #
    # Alpine Linux
    podman pull -q alpine:latest
    podman pull -q alpine:3.5
    # Amazon Linux
    podman pull -q amazonlinux:latest
    # Bash is eigenlijk Alpine Linux Image 
    # podman pull -q bash:latest
    # Clearlinux
    podman pull -q clearlinux:latest
    # Debian
    podman pull -q debian:latest
    # Photon
    podman pull -q photon:latest
    # Ubuntu 
    # podman pull -q ubuntu:20.04
    # podman pull -q ubuntu:22.04
    #
    # Middleware
    #
    # Apache2
    # podman pull -q ubuntu/apache2:latest
    podman pull -q httpd:latest
    # MariaDB
    # podman pull -q mariadb:10.6
    # MinIO
    # podman pull -q minio/minio
    # NextCloud
    # podman pull -q nextcloud
    # NGINX
    podman pull -q nginx
    # Portainer
    podman pull -q portainer/portainer-ce:latest
    # PostGres
    # podman pull -q postgres:latest
    # Registry
    podman pull -q registry
    # WordPress
    # podman pull -q wordpress
    #
    # Demo
    #
    # Prakhar1989 Static Site 
    podman pull -q prakhar1989/static-site
}
#
#
# 3U62 UBUNTU UBUNTU OS Podman Software Functies ## Portainer Create
#
#
function ulx_podman_portainer_create () {
    #
    # Pull Image
    # Wordt gedaan door de functie Pull Images
    # docker pull -q portainer/portainer-ce:latest > /dev/null 2>&1
    #
    # Podman Volume Aanmaken voor Portainer
    podman volume create portainer_data > /dev/null 2>&1
    #
    # Podman Run Portainer
    podman run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
    #
    # Bash Shell Script maken Portainer
    echo '#! /bin/bash' > /home/$SUDO_USER/portainer_restart.sh
    #
    echo 'podman stop portainer' >> /home/$SUDO_USER/portainer_restart.sh
    echo 'podman start portainer' >> /home/$SUDO_USER/portainer_restart.sh
    #
    echo 'echo "Portainer is beschikbaar op"' >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo ""' >> /home/$SUDO_USER/portainer_restart.sh
    #
    if ip link show ens33 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show ens33 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/portainer_restart.sh
        echo 'echo "https://$IP:9443"' >> /home/$SUDO_USER/portainer_restart.sh
    fi
    #
    if ip link show eth0 > /dev/null 2>&1; then
        echo 'IP=$(ip -4 addr show eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> /home/$SUDO_USER/portainer_restart.sh
        echo 'echo "https://$IP:9443"' >> /home/$SUDO_USER/portainer_restart.sh
    fi
    #
    echo 'echo ""' >> /home/$SUDO_USER/portainer_restart.sh
    #
    echo 'echo "Start Webbrowser op PC of Laptop en ga naar bovenstaand adres"'          >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo ""'          >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo "Gebruik onderstaande gegevens op het eerste scherm"'          >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo ""'          >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo "Gebruiker admin"' >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo "Wachtwoord password1234"' >> /home/$SUDO_USER/portainer_restart.sh
    #
    chmod +x /home/$SUDO_USER/portainer_restart.sh
    #
}
#
#
# 3U63 UBUNTU UBUNTU OS Podman Software Functies ## Portainer Remove
#
# ##########################
# ## NIET MEER IN GEBRUIK ##
# ##########################
#
function ulx_podman_portainer_remove () {
    podman stop portainer
    podman rm portainer
    podman rmi portainer/portainer-ce:latest
    podman volume rm portainer_data
    podman system prune
}
#
#
# 3U7 CATEGORIE UBUNTU OS Maak Scripts Functies 
#
#
# 3U71 UBUNTU OS Maak Scripts Functies | Maak Docker Scripts functies
#
#
#
function ulx_maak_docker_scripts () {
    #
    # Overbodig sinds versie 4
    #
    # functie mag niet bestaan uit alleen comments
    # er MOET een commando in staan
    # daarom commando echo met melding lege functie 
    echo 'dit is een lege functie'
}
#
# 72 UBUNTU Maak Scripts DOCKER Voorbeelden
#
function ulx_maak_docker_voorbeelden () {
    #
    # Overbodig sinds versie 4
    #
    # functie mag niet bestaan uit alleen comments
    # er MOET een commando in staan
    # daarom commando echo met melding lege functie 
    echo 'dit is een lege functie'
}
#
# 73 UBUNTU Maak Scripts DOCKER COMPOSE
#
#
# UBUNTU Maak Scripts DOCKER COMPOSE Demos
#
#
#
#
function ulx_maak_compose_scripts () {
    #
    # Overbodig sinds versie 4
    #
    # functie mag niet bestaan uit alleen comments
    # er MOET een commando in staan
    # daarom commando echo met melding lege functie 
    echo 'dit is een lege functie'
}
#
# UBUNTU Maak Scripts DOCKER COMPOSE Demos Voorbeelden
#
function ulx_maak_compose_voorbeelden () {
    #
    # Overbodig sinds versie 4
    #
    # functie mag niet bestaan uit alleen comments
    # er MOET een commando in staan
    # daarom commando echo met melding lege functie 
    echo 'dit is een lege functie'
}
#
# UBUNTU Maak Scripts Minikube Demos Voorbeelden
#
function ulx_maak_minikube_voorbeelden () {
    #
    # Overbodig sinds versie 4
    #
    # functie mag niet bestaan uit alleen comments
    # er MOET een commando in staan
    # daarom commando echo met melding lege functie 
    echo 'dit is een lege functie'
    #
    #
    # TO DO
    #
    # OVERZETTEN NAAR GIT
    #
    # K8S IO website demos
    # MySQL 
    # curl -s -o /home/$SUDO_USER/yaml/kubernetes/mysql/mysql-pv.yml          https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/MySQL/mysql-pv.yml
    # curl -s -o /home/$SUDO_USER/yanl/kubernetes/mysql/mysql-deployment.yml  https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/MySQL/mysql-deployment.yml
    # NGINX
    # curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment.yml        https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/NGINX/deployment.yml
    # curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment-scale.yml  https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/NGINX/deployment-scale.yml
    # curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment-update.yml https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/NGINX/deployment-update.yml
    #
}
#
# 3U6 UBUNTU Maak Scripts Onderwijsmodules
#
#
# 3U61 UBUNTU Maak Scripts Onderwijsmodules Introductie Infrastructuren
#      Configuratie Netwerken
#
# ##########################
# ## NIET MEER IN GEBRUIK ##
# ##########################
#
function ulx_intro_infra_netcfg () {
    #
    # BUITEN GEBRUIK vanaf 12 augustus 2024 
    # Zit nu in download netplan functie 
    #
    if [ $hostname == "u24-lts-s-dbms-001" ] ; then
        curl -s -o /etc/netplan/01-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/OSTicket/Guest/Ubuntu/Netplan/Databaseserver/eth/eth-sec-nic-01-netcfg-dbms.yaml
        netplan apply 
    fi
    #
    if [ $hostname == "u24-lts-s-wsrv-001" ] ; then
        curl -s -o /etc/netplan/01-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/OSTicket/Guest/Ubuntu/Netplan/Webserver/eth/eth-sec-nic-01-netcfg-wsrv.yaml
        netplan apply 
    fi
}
#
#
# 3U62 UBUNTU Maak Scripts Onderwijsmodules Introductie Infrastructuren
#      Installatie Software
#
#
function ulx_intro_infra_install () {
    #
    hostname=$(hostname)
    #
    if [[ $hostname == u24-lts-s-dbms* ]]; then
       #
       # if [ $hostname == "u24-lts-s-dbms-001" ] ; then
       apt install mysql-server -y
       #setup mysql server
       #accept sql queries from all hosts (0.0.0.0)
       sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d
       # create database for osticket
       mysql -e "CREATE DATABASE osticket;"
       mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'password';"
       mysql -e "GRANT ALL PRIVILEGES ON osticket.* TO 'admin'@'%';"
       mysql -e "FLUSH PRIVILEGES;"
       systemctl restart mysql
    fi
    #
    #
    hostname=$(hostname)
    #
    if [[ $hostname == u24-lts-s-wsrv* ]]; then
       #
       # if [ $hostname == "u24-lts-s-wsrv-001" ] ; then
       # apt install git -y
       apt install apache2 -y
       # Installatie PHP 8.3
       apt install php libapache2-mod-php -y
       apt install php-{gd,imap,xml,json,mbstring,mysql,intl,apcu,zip} -y
       #install and setup osTicket
       #for ubuntu 22.04 and higher
       mkdir /var/tmp/osticket
       git clone https://github.com/osTicket/osTicket /var/tmp/osticket > /dev/null 2>&1
       #
       php /var/tmp/osticket/manage.php deploy --setup /var/www/html/osticket
       #
       cp /var/www/html/osticket/include/ost-sampleconfig.php /var/www/html/osticket/include/ost-config.php
       chmod 0666 /var/www/html/osticket/include/ost-config.php
       #enable user websites
       mkdir -p -v /etc/skel/public_html
       a2enmod userdir
       systemctl restart apache2
    fi
    #
    curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-mysqlserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-mysqlserver.sh
    curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-webserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-webserver.sh
    curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-webserver-v2.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-webserver-v2.sh
    curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-sftpserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-sftpserver.sh
    #
    chmod +x /home/$SUDO_USER/scripts/intro_infra/install-mysqlserver.sh
    chmod +x /home/$SUDO_USER/scripts/intro_infra/install-webserver.sh
    chmod +x /home/$SUDO_USER/scripts/intro_infra/install-webserver-v2.sh
    chmod +x /home/$SUDO_USER/scripts/intro_infra/install-sftpserver.sh
}
#
#
# 3U63 UBUNTU Maak Scripts Onderwijsmodules IT Fundamentals
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
# 3U63 UBUNTU Maak Scripts Onderwijsmodules Virtualisatie
#
# 
# Geen inhoud 
#
# #############################################################
#
#
# 3U7 CATEGORIE UBUNTU OS Nested Functions
#
#
# 3U71 UBUNTU OS Nested Functions Basis Configuratie
#
#
#
function ulx_nested_oobe () {
    echo 'DEBIAN/UBUNTU - Step 1 of 10 Set Timezone to Europe Amsterdam'
    ulx_os_config_timezone
    echo 'DEBIAN/UBUNTU - Step 2 of 10 Configure APT Package Manager'
    ulx_os_change_repo_nl
    ulx_os_update_apt
    echo 'DEBIAN/UBUNTU - Step 3 of 10 Upgrading Operating System (Please be patient ... takes a while)'
    ulx_os_upgrade_os
    echo 'DEBIAN/UBUNTU - Step 4 of 10 Changing Domain Name Service (DNS) settings'
    ulx_os_config_dns
    echo 'DEBIAN/UBUNTU - Step 5 of 10 Configure Network Interface Card 2'
    # ulx_os_netplan_download
    echo 'DEBIAN/UBUNTU - Step 6 of 10 Installing Default Apps'
    ulx_os_default_apps
    echo 'DEBIAN/UBUNTU - Step 7 of 10 Installing or updating of Open VM Tools'
    ulx_install_vm_tools
    echo 'DEBIAN/UBUNTU - Step 8 of 10 Installing and configuration of Cockpit'
    ulx_install_cockpit
    echo 'DEBIAN/UBUNTU - Step 9 of 10 Installing Microsoft Powershell 7 (latest version)'
    ulx_install_pwrshell
    echo 'DEBIAN/UBUNTU - Step 10 of 10 Installing Python 3'
    ulx_install_python3
    echo '##################################################'
    echo ''
}
#
#
#
#
# 3U8 CATEGORIE UBUNTU APPS Nested Functions
#
#
#
#
#   #################################
#   3U81 UBUNTU Nested 
#        Docker
#   #################################
#
#
#
#
function ulx_nested_docker () {
    echo 'DOCKER - Step 1 of 5 Installation and configuration Docker CE with Compose plugin'
    ulx_install_docker
    echo 'DOCKER - Step 2 of 5 Pull most commonly used Docker images from Docker Hub'
    ulx_docker_images_pull
    echo 'DOCKER - Step 3 of 8 Starting Registry'
    docker run -d -p 9105:5000 --restart always --name registry registry > /home/$SUDO_USER/luct_logs/luct_start_registry.log 2>&1
    echo 'DOCKER - Step 4 of 8 Starting Portainer Container Management'
    ulx_docker_portainer_create
    echo 'DOCKER - Step 5 of 8 Starting Yacht Container Management'
    ulx_docker_yacht_create
    echo 'DOCKER - Step 6 of 8 Starting Jenkins'
    ulx_docker_jenkins_create
    echo 'DOCKER - Step 7 of 8 Starting Visual Studio Code Server'
    ulx_docker_vscodesrv_create
    echo 'DOCKER - Step 8 of 8 Installing Docker Management tools'
    ulx_docker_mgmt_tools
    echo '##################################################'
    echo ''
}
#
#
#
#
#   #################################
#   3U82 UBUNTU Nested 
#        Podman
#   #################################
#
#
#
#
function ulx_nested_podman () {
    echo 'PODMAN - Step 1 of 5 Installation and configuration Podman'
    ulx_install_podman
    echo 'PODMAN - Step 2 of 5 Installation and configuration Docker Compose Plugin'
    #    ulx_install_docker_compose
    echo 'PODMAN - Step 3 of 5 Pull Images from Docker Hub'
    ulx_podman_images_pull
    echo 'PODMAN - Step 4 of 5 Starting Portainer Container Management on Podman'
    ulx_podman_portainer_create
    echo 'PODMAN - Step 5 of 5 Starting Registry Container on Podman'
    podman run -d -p 9105:5000 --restart always --name registry registry
    echo '##################################################'
    echo ''
}
#
#
#
#
#   #################################
#   3U82 UBUNTU Nested 
#        Jenkins 
#   #################################
#
#
#
#
function ulx_nested_jenkins () {
        #
        # Jenkins klaarmaken voor gebruik 
        echo 'JENKINS - Step 1 of 3 Installing JAVA (needed for Jenkins)'
        ulx_install_java_jdk
        echo 'JENKINS - Step 2 of 3 Installing Jenkins'
        ulx_install_jenkins
        echo 'JENKINS - Step 3 of 3 Configuring Jenkins'
        ulx_jenkins_docker
        #
}
#
#
#
#
# ################################################################################
#
# FUNCTIONS
#
# LINUX DISTRO ONAFHANKELIJK
#
# ################################################################################
#
#
#
#
# Function maak directories 
#
#
function maak_directories () {
    #
    # Temporary
    #
    if [ ! -d "/home/$SUDO_USER/tmp" ]; then
        mkdir -p /home/$SUDO_USER/tmp
        chown -f -R $SUDO_USER /home/$SUDO_USER/tmp
    fi
    #
    # LUCT Loggings 
    #
    if [ ! -d "/home/$SUDO_USER/luct_logs" ]; then
        mkdir -p /home/$SUDO_USER/luct_logs
        chown -f -R $SUDO_USER /home/$SUDO_USER/luct_logs
    fi
}
#
#
# Functie GIT Clone
#
#
function git_clone_demos () {
    # Demos
    echo 'GIT CLONE - Step 1 of 4 GitHub JATUTERT Demos'
    if [ -d "/home/$SUDO_USER/demos" ]; then
        rm -rf "/home/ubuntu/demos"
    fi
    git clone --quiet https://github.com/jatutert/demos.git /home/$SUDO_USER/demos
    # Awesome Compose 
    echo 'GIT CLONE - Step 2 of 4 GitHub Docker Awesome Compose'
    if [ -d "/home/$SUDO_USER/demos" ]; then
        rm -rf "/home/ubuntu/demos/Docker/Compose/Awesome-compose"
    fi
    git clone --quiet https://github.com/docker/awesome-compose.git /home/$SUDO_USER/demos/Docker/Compose/Awesome-compose
    # Onderwijs
    echo 'GIT CLONE - Step 3 of 4 GitHub MSiekmans (Onderwijs)'
    if [ -d "/home/$SUDO_USER/onderwijs" ]; then
        rm -rf "/home/ubuntu/demos"
    fi
    git clone --quiet https://github.com/msiekmans/linux-server-scripts.git /home/$SUDO_USER/onderwijs
    # Shell Scripts
    echo 'GIT CLONE - Step 4 of 4 Make all Shell Scriptfiles Executable'
    find /home/$SUDO_USER/demos -type f -name "*.sh" -exec chmod +x {} \;
    echo '##################################################'
    echo ''
} 
#
#
# Functie Gebruikersmenu 
#
#
function config_menu () {
#
#
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
            distro=$(echo "$NAME" | tr '[:upper:]' '[:lower:]')
            if [ $distro == "alpine" ]; then
                #
                # Alpine zo instellen zoals gewenst
                # ulx_nested_oobe
                #
                # Directories maken
                maak_directories
                #
            fi
            #
            if [ $distro == "buildroot" ]; then
                #
                # Buildroot zo instellen zoals gewenst
                # ulx_nested_oobe
                #
                # Directories maken
                maak_directories
                #
            fi
            #
            if [ $distro == "debian" ]; then
                #
                # Debian zo instellen zoals gewenst
                ulx_nested_oobe
                #
                # Directories maken
                maak_directories
                #
            fi
            #
            if [ $distro == "ubuntu" ]; then
                #
                # Ubuntu zo instellen zoals gewenst
                ulx_nested_oobe
                #
                # Directories maken
                maak_directories
                #
            fi
            #
            ;;
        2)
            #
            # Menu keuze 2
            #
            # Configuratie 
            echo "Step 1 of 5 Making Preperations"
            ulx_os_config_timezone
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            ulx_os_update_apt
            # Bijwerken 
            echo "Step 2 of 5 Upgrading OS"
            ulx_os_upgrade_os
            # Installatie 
            echo "Step 3 of 5 Installing OS Tools"
            ulx_install_vm_tools
            ulx_install_pwrshell
            ulx_install_cockpit
            # DOCKER
            echo "Step 4 of 5 Installation and configuration Docker CE"
            ulx_install_docker
            ulx_docker_portainer_create
            ulx_docker_images_pull
            # 
            # DEMO omgeving maken 
            echo "Step 5 of 5 Creating demo environment"
            maak_directories
            ulx_maak_docker_scripts
            ulx_maak_docker_voorbeelden
            ulx_maak_compose_scripts
            ulx_maak_compose_voorbeelden
            ;;
        3)
            #
            # Menu keuze 3
            #
            # Configuratie 
            ulx_os_config_timezone
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            ulx_os_update_apt
            # Bijwerken 
            ulx_os_upgrade_os
            # Installatie 
            ulx_install_vm_tools
            ulx_install_pwrshell
            ulx_install_cockpit
            # DOCKER
            ulx_install_docker
            ulx_docker_portainer_create
            ulx_docker_images_pull
            # 
            # DEMO omgeving maken 
            maak_directories
            ulx_maak_docker_scripts
            ulx_maak_docker_voorbeelden
            ulx_maak_compose_scripts
            ulx_maak_compose_voorbeelden
            # MiniKube 
            ulx_docker_minikube_init
            ulx_docker_minikube_config
            ulx_maak_minikube_voorbeelden
            ;;
        4)
            #
            # Menu keuze 4
            #
            # Configuratie
            ulx_os_config_timezone
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            ulx_os_update_apt
            # Bijwerken
            ulx_os_upgrade_os
            # Installatie 
            ulx_install_vm_tools
            ulx_install_pwrshell
            ulx_install_cockpit
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
#   ################################################################################
#   ################################################################################
#   MAIN
#   DISTRO BEPALEN
#   ################################################################################
#   ################################################################################
#
#
#
#
distro=$(echo "$NAME" | tr '[:upper:]' '[:lower:]')
#
#
#
#
#   ################################################################################
#   ################################################################################
#   MAIN
#   ALPINE
#   PLANNED FOR 2026
#   ################################################################################
#   ################################################################################
#
#
#
#
if [ $distro == "alpine" ]; then
    #
    # Bepaal de actie op basis van de parameter
    actie=$1
    #
    #
    if [ $actie == "upgrade" ]; then
        #
        # ALPINE OPTIE 1
        #
        # Configuratie 
        echo "ALPINE Step 1 of 3 Making Preperations"
        ulx_os_config_timezone
        maak_directories
        # ulx_os_netplan_download
        # ulx_os_change_repo_nl
        # ulx_os_update_apt
        # Bijwerken 
        echo "ALPINE Step 2 of 3 Upgrading OS"
        alx_update_os
        # Installatie 
        echo "ALPINE Step 3 of 3 Installing OS Tools"
        alx_vm_tools
        # ulx_install_pwrshell
        # ulx_install_cockpit
        exit 1
        elif [ $actie == "docker" ]; then
            #
            # ALPINE OPTIE 2
            #
            # Configuratie 
            echo "ALPINE Step 1 of 5 Making Preperations"
            ulx_os_config_timezone
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            ulx_os_update_apt
            # Bijwerken 
            echo "ALPINE Step 2 of 5 Upgrading OS"
            ulx_os_upgrade_os
            # Installatie 
            echo "ALPINE Step 3 of 5 Installing OS Tools"
            ulx_install_vm_tools
            ulx_install_pwrshell
            ulx_install_cockpit
            # DOCKER
            echo "ALPINE Step 4 of 5 Installation and configuration Docker CE"
            ulx_install_docker
            ulx_docker_portainer_create
            ulx_docker_images_pull
            # 
            # DEMO omgeving maken 
            echo "ALPINE Step 5 of 5 Creating demo environment"
            maak_directories
            ulx_maak_docker_scripts
            ulx_maak_docker_voorbeelden
            ulx_maak_compose_scripts
            ulx_maak_compose_voorbeelden
            exit 1
        elif [ $actie == "minikube" ]; then
            #
            # ALPINE OPTIE 3
            #
            # Configuratie 
            echo "Step 1 of 5 Making Preperations"
            ulx_os_config_timezone
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            ulx_os_update_apt
            # Bijwerken 
            echo "Step 2 of 5 Upgrading OS"
            ulx_os_upgrade_os
            # Installatie 
            ulx_install_vm_tools
            ulx_install_pwrshell
            ulx_install_cockpit
            # DOCKER
            ulx_install_docker
            ulx_docker_portainer_create
            ulx_docker_images_pull
            # 
            # DEMO omgeving maken 
            maak_directories
            ulx_maak_docker_scripts
            ulx_maak_docker_voorbeelden
            ulx_maak_compose_scripts
            ulx_maak_compose_voorbeelden
            # MiniKube 
            ulx_docker_minikube_init
            ulx_docker_minikube_config
            ulx_maak_minikube_voorbeelden
            exit 1
        elif [ $actie == "ansible" ]; then
            #
            # ALPINE OPTIE 4
            #
            # Configuratie
            ulx_os_config_timezone
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            ulx_os_update_apt
            # Bijwerken
            ulx_os_upgrade_os
            # Installatie 
            ulx_install_vm_tools
            ulx_install_pwrshell
            ulx_install_cockpit
            # Ansible
            ulx_install_ansible
            exit 1
        elif [ $actie == "introinfra" ]; then
            #
            # ALPINE OPTIE 5
            #
            # Configuratie
            echo "Step 1 of 4 Configure Ubuntu"
            ulx_os_config_timezone
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            ulx_os_update_apt
            # Bijwerken
            echo "Step 2 of 4 Upgrading Ubuntu"
            ulx_os_upgrade_os
            # Installatie
            echo "Step 3 of 4 Installing Tools"
            ulx_install_vm_tools
            ulx_install_pwrshell
            ulx_install_cockpit
            # OSTicket
            echo "Step 4 of 4 Installing OSTicket Environment"
            ulx_intro_infra_install
            exit 1
        elif [ $actie == "itfunda" ]; then
            #
            # ALPINE OPTIE 6
            # 
            # Configuratie
            ulx_os_config_timezone
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            ulx_os_update_apt
            # Bijwerken
            ulx_os_upgrade_os
            # Installatie
            ulx_install_vm_tools
            ulx_install_pwrshell
            ulx_install_cockpit
            # IT Fundamentals 
            ulx_it-funda_tooling
            exit 1
        elif [ $actie == "scripts" ]; then
            #
            # ALPINE OPTIE 7
            #
            exit 1
        elif [ $actie == "scripts" ]; then
            #
            # ALPINE OPTIE 8
            #
            exit 1
        elif [ $actie == "menu" ]; then
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
#   MAIN
#   BUILDROOT
#   ################################################################################
#   ################################################################################
#
#
#
#
if [ $distro == "buildroot" ]; then
    #
    # Bepaal de actie op basis van de parameter
    actie=$1
    #
    if [ $actie == "minikube" ]; then
        #
        # BUILDROOT OPTIE 1
        #
        # 1
        echo "Step 1 of 6 Configure Operating System"
        ulx_os_config_timezone
        build_bash_config
        # 2
        echo "Step 2 of 6 Creating Directories"
        maak_directories
        # 3
        echo "Step 3a of 6 Starting Portainer Container Engine management"
        ulx_docker_portainer_create
        echo "Step 3b of 6 Starting Yacht Container Engine management"
        ulx_docker_yacht_create
        # 4
        echo "Step 4 of 6 Getting Docker Images"
        ulx_docker_images_pull
        # 5
        echo "Step 5 of 6 Installing Docker Compose plugin"
        build_install_compose
        # 6
        echo "Step 6 of 6 Creating demo environment"
        echo ""
        echo "Stap 6a Create Docker scripts"
        ulx_maak_docker_scripts
        echo "Stap 6b Create Docker examples"
        ulx_maak_docker_voorbeelden
        echo "Stap 6c Create Docker Compose scripts"
        ulx_maak_compose_scripts
        echo "Stap 6d Create Docker Compose examples"
        ulx_maak_compose_voorbeelden
        echo "Stap 6e Create Minikube examples"
        ulx_maak_minikube_voorbeelden
        echo ""
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
    elif [ $actie == "examples" ]; then
        echo "Step 2 of 6 Creating Directories"
        maak_directories
        echo "Stap 6a Maak Docker scripts"
        ulx_maak_docker_scripts
        echo "Stap 6b Maak Docker voorbeelden"
        ulx_maak_docker_voorbeelden
        echo "Stap 6c Maak Docker Compose scripts"
        ulx_maak_compose_scripts
        echo "Stap 6d Maak Docker Compose voorbeelden"
        ulx_maak_compose_voorbeelden
        echo "Stap 6e Maak Minikube voorbeelden"
        ulx_maak_minikube_voorbeelden
        exit 1
    elif [ $actie == "compose" ]; then
        echo "Step 5 of 6 Installing Docker Compose plugin"
        build_install_compose
        exit 1
    elif [ $actie == "portainer" ]; then
        echo "Step 3 of 6 Starting Portainer Container Engine management"
        ulx_docker_portainer_create
        exit 1
    else
        exit 1
    fi
fi
#
#
#
#
#   ################################################################################
#   ################################################################################
#   MAIN
#   DEBIAN
#   ################################################################################
#   ################################################################################
#
#
#
#
if [ $distro == "debian" ]; then
    #
    # Bepaal de actie op basis van de parameter
    actie=$1 
    #
    #
    if [ $actie == "upgrade" ]; then
        #
        #
        # DEBIAN OPTIE 1
        #
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        exit 1
    elif [ $actie == "docker" ]; then
        #
        #
        # DEBIAN OPTIE 2
        #
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        # Docker
        # Docker Compose 
        ulx_nested_docker
        #
        # Jenkins 
        ulx_nested_jenkins 
        #
        # GitHub Clones maken
        git_clone_demos
        #
        #
        # Functies die eerder gebruikt werden maar nu buiten gebruik zijn 
        # ulx_maak_docker_scripts
        # ulx_maak_docker_voorbeelden
        # ulx_maak_compose_scripts
        # ulx_maak_compose_voorbeelden
        #
        #
        clear
        echo ''
        echo 'Linux Universal Configuration Tool (LUCT) Version 4'
        echo ''
        #
        shutdown -r now
        #
        exit 1
    elif [ $actie == "podman" ]; then
        #
        #
        # Debian OPTIE 3
        #
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        # PodMan
        ulx_install_podman
        # ulx_install_docker
        # ulx_docker_portainer_create
        # ulx_docker_images_pull
        ulx_podman_images_pull
        #
        # GitHub Clones maken
        git_clone_demos
        #
        #
        # Functies die eerder gebruikt werden maar nu buiten gebruik zijn 
        # ulx_maak_docker_scripts
        # ulx_maak_docker_voorbeelden
        # ulx_maak_compose_scripts
        # ulx_maak_compose_voorbeelden
        #
        #
        clear
        echo ''
        echo 'Linux Universal Configuration Tool (LUCT) Version 4'
        echo ''
        #
        shutdown -r now
        #
        exit 1
    elif [ $actie == "minikube" ]; then
        #
        #
        # Debian OPTIE 4
        #
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        # Docker
        ulx_nested_docker
        #
        # Jenkins 
        ulx_nested_jenkins 
        #
        # GitHub Clones maken
        git_clone_demos
        #
        #
        # Functies die eerder gebruikt werden maar nu buiten gebruik zijn 
        # maak_directories
        # ulx_maak_docker_scripts
        # ulx_maak_docker_voorbeelden
        # ulx_maak_compose_scripts
        # ulx_maak_compose_voorbeelden
        #
        #
        #
        # MiniKube 
        ulx_docker_minikube_init
        ulx_docker_minikube_config
        #
        #
        # Functies die eerder gebruikt werden maar nu buiten gebruik zijn
        # ulx_maak_minikube_voorbeelden
        #
        #
        clear
        echo ''
        echo 'Linux Universal Configuration Tool (LUCT) Version 4'
        echo ''
        #
        shutdown -r now
        #
        exit 1
    elif [ $actie == "ansible" ]; then
        #
        #
        # Debian OPTIE 5
        #
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        # Ansible
        ulx_install_ansible
        #
        #
        clear
        echo ''
        echo 'Linux Universal Configuration Tool (LUCT) Version 4'
        echo ''
        #
        shutdown -r now
        #
        exit 1
    elif [ $actie == "introinfra" ]; then
        #
        # DEBIAN OPTIE 5
        #
        #
        # Directories maken
        maak_directories
        #
        # Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        # OSTicket
        echo "Step 4 of 4 Installing OSTicket Environment"
        ulx_intro_infra_install
        exit 1
    elif [ $actie == "itfunda" ]; then
        #
        # DEBIAN OPTIE 6
        # 
        #
        ulx_basis_config
        #
        # IT Fundamentals 
        ulx_it-funda_tooling
        exit 1
    elif [ $actie == "scripts" ]; then
        #
        # DEBIAN OPTIE 7
        #
        exit 1
    elif [ $actie == "scripts" ]; then
        #
        # DEBIAN OPTIE 8
        #
        exit 1
    elif [ $actie == "menu" ]; then
        #
        # DEBIAN OPTIE 9
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
    # Einde Debian
fi
#
#
#
#
#   ################################################################################
#   ################################################################################
#   MAIN
#   UBUNTU
#   ################################################################################
#   ################################################################################
#
#
#
#
if [ $distro == "ubuntu" ]; then
    #
    # Bepaal de actie op basis van de parameter
    actie=$1 
    #
    #
    if [ $actie == "upgrade" ]; then
        #
        #
        # Ubuntu OPTIE 1
        # Alleen upgraden Ubuntu OS
        #
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        ulx_nested_oobe
        #
        clear
        echo 'Linux Universal Configuration Tool (LUCT)'
        echo "Version $Major.$Minor.$Build.$Patch"
        echo "Channel $Channel"
        echo ''
        echo ''
        echo "I have finished my work. Just need to do a restart of the virtual machine."
        echo ''
        echo ''
        echo "Found a bug ? Let me know by emailing me at j.a.tutert@saxion.nl"
        echo ''
        echo ''
        #
        shutdown -r now
        #
        exit 1
    elif [ $actie == "docker" ]; then
        #
        #
        # Ubuntu OPTIE 2
        # Installeren en Configureren Docker demo omgeving 
        #
        #
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="U24-LTS-S-DKR-001"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        ulx_nested_oobe
        #
        # GitHub Clones maken
        git_clone_demos
        #
        # Docker en Docker omgeving inrichten
        # Moet na de git clone omdat Visual Studio Code Server gebruikt maakt van demos directory
        ulx_nested_docker
        #
        #
        # Functies die eerder gebruikt werden maar nu buiten gebruik zijn 
        # ulx_maak_docker_scripts
        # ulx_maak_docker_voorbeelden
        # ulx_maak_compose_scripts
        # ulx_maak_compose_voorbeelden
        #
        #
        # clear
        echo 'Linux Universal Configuration Tool (LUCT)'
        echo "Version $Major.$Minor.$Build.$Patch"
        echo "Channel $Channel"
        echo ''
        echo ''
        echo "I have finished my work. Just need to do a restart of the virtual machine."
        echo ''
        echo ''
        echo "Found a bug ? Let me know by emailing me at j.a.tutert@saxion.nl"
        echo ''
        echo ''
        #
        echo 'Een reboot slaan we vandaag even over'
        # shutdown -r now
        #
        exit 1
    elif [ $actie == "podman" ]; then
        #
        #
        # Ubuntu OPTIE 3
        # Installeren en Configureren Podman demo omgeving 
        #
        #
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="U24-LTS-S-PMN-001"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        ulx_nested_oobe
        #
        # GitHub Clones maken
        git_clone_demos
        #
        # Podman en Podman omgeving inrichten
        # Moet na de git clone omdat Visual Studio Code Server gebruikt maakt van demos directory
        ulx_nested_podman
        #
        #
        # Functies die eerder gebruikt werden maar nu buiten gebruik zijn 
        # ulx_maak_docker_scripts
        # ulx_maak_docker_voorbeelden
        # ulx_maak_compose_scripts
        # ulx_maak_compose_voorbeelden
        #
        #
        clear
        echo 'Linux Universal Configuration Tool (LUCT)'
        echo "Version $Major.$Minor.$Build.$Patch"
        echo "Channel $Channel"
        echo ''
        echo ''
        echo "I have finished my work. Just need to do a restart of the virtual machine."
        echo ''
        echo ''
        echo "Found a bug ? Let me know by emailing me at j.a.tutert@saxion.nl"
        echo ''
        echo ''
        #
        shutdown -r now
        #
        exit 1
    elif [ $actie == "minikube" ]; then
        #
        #
        # Ubuntu OPTIE 4
        # Installeren en Configureren Minikube op Docker demo omgeving 
        #
        #
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="U24-LTS-S-MKC-001"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        ulx_nested_oobe
        #
        # GitHub Clones maken
        git_clone_demos
        #
        # Docker en Docker omgeving inrichten
        # Moet na de git clone omdat Visual Studio Code Server gebruikt maakt van demos directory
        ulx_nested_docker
        #
        # MiniKube 
        ulx_docker_minikube_init
        ulx_docker_minikube_config
        #
        #
        # Functies die eerder gebruikt werden maar nu buiten gebruik zijn 
        # maak_directories
        # ulx_maak_docker_scripts
        # ulx_maak_docker_voorbeelden
        # ulx_maak_compose_scripts
        # ulx_maak_compose_voorbeelden
        #
        # ulx_maak_minikube_voorbeelden
        #
        #
        clear
        echo 'Linux Universal Configuration Tool (LUCT)'
        echo "Version $Major.$Minor.$Build.$Patch"
        echo "Channel $Channel"
        echo ''
        echo ''
        echo "I have finished my work. Just need to do a restart of the virtual machine."
        echo ''
        echo ''
        echo "Found a bug ? Let me know by emailing me at j.a.tutert@saxion.nl"
        echo ''
        echo ''
        #
        shutdown -r now
        #
        exit 1
    elif [ $actie == "iacmaster" ]; then
        #
        #
        # Ubuntu OPTIE 5
        # Ansible Demo Master Controller 
        #
        #
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="U24-LTS-S-IAC-M01"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        # Ansible
        ulx_install_ansible_master
        #
        #
        clear
        echo 'Linux Universal Configuration Tool (LUCT)'
        echo "Version $Major.$Minor.$Build.$Patch"
        echo "Channel $Channel"
        echo ''
        echo ''
        echo "I have finished my work. Just need to do a restart of the virtual machine."
        echo ''
        echo ''
        echo "Found a bug ? Let me know by emailing me at j.a.tutert@saxion.nl"
        echo ''
        echo ''
        #
        shutdown -r now
        #
        exit 1
    elif [ $actie == "iacslave" ]; then
        #
        #
        # Ubuntu OPTIE 6
        # Ansible Demo Slave
        #
        #
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="U24-LTS-S-IAC-S01"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        # Ansible
        ulx_install_ansible_slave
        #
        #
        clear
        echo 'Linux Universal Configuration Tool (LUCT)'
        echo "Version $Major.$Minor.$Build.$Patch"
        echo "Channel $Channel"
        echo ''
        echo ''
        echo "I have finished my work. Just need to do a restart of the virtual machine."
        echo ''
        echo ''
        echo "Found a bug ? Let me know by emailing me at j.a.tutert@saxion.nl"
        echo ''
        echo ''
        #
        shutdown -r now
        #
        exit 1
    elif [ $actie == "introinfra" ]; then
        #
        #
        # UBUNTU OPTIE 7
        #
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        ulx_nested_oobe
        #
        # OSTicket
        ulx_intro_infra_install
        #
        exit 1
    elif [ $actie == "itfunda" ]; then
        #
        #
        # UBUNTU OPTIE 8
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
    elif [ $actie == "scripts" ]; then
        #
        # UBUNTU OPTIE 9
        #
        exit 1
    elif [ $actie == "scripts" ]; then
        #
        # UBUNTU OPTIE 10
        #
        exit 1
    elif [ $actie == "menu" ]; then
        #
        # UBUNTU OPTIE 11
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
    # Einde Ubuntu
fi
#
#
#
#
#   ################################################################################
#   ################################################################################
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