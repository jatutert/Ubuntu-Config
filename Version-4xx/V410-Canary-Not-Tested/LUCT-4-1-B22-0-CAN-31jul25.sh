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
# sudo curl -L -o $HOME/luctv4.sh https://edu.nl/treah
# sudo wget -O $HOME/luctv4.sh https://edu.nl/treah
#
# Hierna
#
# sudo chmod +x $HOME/luctv4.sh 
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
# Canary Channel ## Try the latest NOT TESTED features
# Dev Channel ## Try the latest TESTED features # Tested by a few people
# Stable Channel ## Try the latest TESTED features # Tested by a large group of people 
#
#
Major="4"
Minor="1"
Build="22"
Patch="0"
Channel="Canary"
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
echo "Version $Major.$Minor Build $Build Patch $Patch"
echo "Channel $Channel"
echo ''
echo "Created by John Tutert(TutSOFT) for Bachelor IT Saxion UAS"
echo ''
echo 'For Personal or Educational use only !'
echo ''
echo 'Supported Linux distributions are:'
echo '- BuildRoot (Virtual Machine used by Minikube)'
echo '- Debian 12.00 (Stable) Bookworm'
echo '- Ubuntu 24.04 (LTS) Noble Numbat'
echo '- Ubuntu 24.04 (LTS) on Windows Subsystem for Linux (WSL) version 2'
echo ''
echo 'Not supported Linux distributions are:'
echo '- Alpine (planned for version 4.5 in 2026)'
echo '- Fedora and RHEL'
echo '- Slackware'
echo ''
echo 'Running this script takes about 15 minutes (With slower internet connection it takes longer)'
echo ''
echo 'Deze versie bevat containerengine in plaats van docker of podman voor pull en portainer'
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
#
#    Overzicht openstaande poorten in Ubuntu
#    sudo lsof -i -P -n | grep LISTEN
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
# #######################
# Version 4.1
# #######################
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
#
# xxaug25 Bxx Ansible Master Controller en Ansible Slave Demo omgeving 
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
    echo 'upgrade    Upgrade operating system and applications'
    echo 'docker     Docker with demo environment'
    echo 'podman     Podman with demo environment'
    echo 'minikube   Minikube with demo environment'
    echo 'iacmaster  Ansible master with demo environment'
    echo 'iacslave   Configure Ansible slave'
    echo 'omv        Open Media Vault on Debian'
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
# ############################
# ## Script actie en modus vullen 
# ## Op basis van gegeven parameters bij de start van het script
# ## Dit MOET op deze manier omdat parameters NIET mee gaan naar functies binnen het script
# ############################
#
#
# Eerste parameter bijvoorbeeld docker
actie=$1
# Tweede parameter bijvoorbeeld test
modus=$2
#
#
if [ ! "$modus" ];then
    modus="leeg"
fi
#
#
# ############################
# ## Variable distro vullen 
# ## Op basis van source /etc/os-release of kortweg . /etc/os-release
# ############################
#
#
if [ -f /etc/os-release ]; then
    . /etc/os-release
    distro=$(echo "$ID" | tr '[:upper:]' '[:lower:]')
    versie=$(echo "$VERSION_ID" | tr '[:upper:]' '[:lower:]')
    #
    if [ $distro == "debian" ]; then
        deb_vers_oud=$(cat /etc/debian_version | tr '[:upper:]' '[:lower:]')
    fi
    #
fi
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
#
# Fase 3A                                                  #####
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
#
# Fase 3B                                                #########
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
    curl -s -SL https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-linux-x86_64 -o /home/$SUDO_USER/.docker/cli-plugins/docker-compose
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
    curl -s -o /home/docker/.bashrc https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/.bashrc
    # Downloaden bestand dat settings bestand automatisch activeert
    curl -s -o /home/docker/.bash_profile https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/.bash_profile
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
#
# Fase 3D                                                        #
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
# 3D1 CATEGORIE Debian OS Functies
#
#
#
#
#   #######################
#   3D10 Debian OS FUNCTIES
#        Functie Laden BASH shell settings
#        Onderdeel van Debian Nested OOBE Functie 
#   #######################
#
#
#
#
function deb_os_bash_config () {
    #
    # Downloaden settings bestand
    curl -s -o /home/docker/.bashrc https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/.bashrc
    # Downloaden bestand dat settings bestand automatisch activeert
    curl -s -o /home/docker/.bash_profile https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/.bash_profile
    # 
    # echo '#! /bin/bash' > /home/docker/bash_config.sh
    # echo 'source /etc/bash.bashrc' >> /home/docker/bash_config.sh
    # chmod a+x /home/docker/bash_config.sh
    #
    # LET OP
    #
    # Wordt pas actief na uitloggen
    #
}
#
#
#
#
#   #######################
#   3D11 Debian OS FUNCTIES
#        Functie Change Repo Debian
#        Onderdeel van Debian Nested OOBE Functie 
#   #######################
#
#
#
#
function deb_os_change_repo_nl () {
    #
    if [ $versie == "12" ] ; then
        # Vervang tweede tekstregel door nieuwe inhoud 
        sed -i '1c\deb http://mirror.ams.macarne.com/debian/ bookworm main non-free-firmware' /etc/apt/sources.list
        sed -i '2c\deb-src http://mirror.ams.macarne.com/debian/ bookworm main non-free-firmware' /etc/apt/sources.list
    fi
}
#
#
#
#
#   #######################
#   3D12 Debian OS FUNCTIES
#        Functie Add Repo Debian
#        Onderdeel van Debian Nested OOBE Functie 
#   #######################
#
#
#
#
function deb_os_add_repo_nl () {
    add-apt-repository http://mirror.nl.datapacket.com/debian/ -s -y > /dev/null 2>&1
}
#
#
#
#
# 3D2 CATEGORIE Debian OS Install Software Functies
#
#
#
#
#   #######################
#   3D20 Debian OS Install Software Functies
#        Functie Installatie Open Media Vault 
#        Debian OMV
#   #######################
#
#
function deb_install_omv () {
    #
    wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash
    #
}
#
#
#
#
# 3D3 CATEGORIE Debian Configuratie Functies
#
#
#
#
#   #######################
#   3D30 Debian Configuratie Functies
#        Functie Change DNS OS
#        Onderdeel van Debian Nested OOBE Functie
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
        echo 'Geen geldige netwerkinterface gevonden (eth* of ens*)'
    fi
}
#
#
#
#
# 3D4 CATEGORIE Debian Nested Functies
#
#
#
#
# 3D40 Debian OS Nested Functions Basis Configuratie
#
#
#
function deb_nested_oobe () {
    # Operating System Updating #
    echo 'DEBIAN/UBUNTU - Step 1 of 13 Set Timezone to Europe Amsterdam'
    debulx_config_timezone_ams
    echo 'DEBIAN        - Step 2 of 13 Change Debian Repository Settings'
    deb_os_change_repo_nl
    echo 'DEBIAN/UBUNTU - Step 3 of 13 Updating APT Package Manager'
    debulx_os_update_apt
    echo 'DEBIAN/UBUNTU - Step 4 of 13 Upgrading Operating System (Please be patient ... takes a while)'
    debulx_os_upgrade_packages
    echo "Version before upgrade $deb_vers_oud"
    deb_vers_nw=$(cat /etc/debian_version | tr '[:upper:]' '[:lower:]')
    echo "Version after upgrade $deb_vers_nw"
    # Installatie #
    echo 'DEBIAN/UBUNTU - Step 5 of 13 Installing Default Apps'
    debulx_install_default_apps
    echo 'DEBIAN/UBUNTU - Step 6 of 13 Installing and configuration of Cockpit'
    debulx_install_cockpit_srv
    echo 'DEBIAN/UBUNTU - Step 7 of 13 Installing Microsoft Powershell 7 (latest version)'
    debulx_install_pwrshell
    # Configuratie #
    echo 'DEBIAN        - Step 8 of 13 Adding Debian Repository'
    deb_os_add_repo_nl
    echo 'DEBIAN        - Step 9 of 13 Changing Domain Name Service (DNS) settings'
    deb_config_dns_settings
    echo 'DEBIAN/UBUNTU - Step 10 of 13 Installing or updating of Open VM Tools'
    debulx_config_virtualization
    echo 'DEBIAN        - Step 11 of 13 Configure Network Interface Card 2'
    # ulx_os_netplan_download
    echo 'DEBIAN        - Step 12 of 13 Configure BASH shell'
    deb_os_bash_config
    echo 'DEBIAN/UBUNTU - Step 13 of 13 Python compatible with lower versions'
    debulx_python_compatible
    echo '##################################################'
    echo ''
}
#
#
#
#
# ################################################################################
#
# Fase 3DU                                                       # #       #
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
# 3DU1 CATEGORIE Debian Ubuntu OS FUNCTIES
#
#
#
#
#   #######################
#   3DU10 Debian Ubuntu OS FUNCTIES
#        Functie debulx os update apt
#        Onderdeel van Debian Ubuntu Nested OOBE Functie
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
#   3DU11 Debian Ubuntu OS FUNCTIES
#        Functie debulx os upgrade packages 
#        Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_os_upgrade_packages () {
    #
    if [ $modus == "test" ]; then
        apt upgrade -y
        apt autoremove -y
    else
        apt upgrade -qq -y > /dev/null 2>&1
        apt autoremove -qq -y > /dev/null 2>&1
    fi 
    #
}

#
#
#
# 3DU2 CATEGORIE Debian Ubuntu OS Install Software Functies
#
#
#
#
#   #######################
#   3DU20 Debian Ubuntu OS Install Software Functies
#        Functie Installatie Default Apps
#        Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_install_default_apps () {

APT_INSTALL_ARRAY=(
    "7zip"
    "apt-transport-https"
    "curl"
    "dmidecode"
    "dpkg"
    "git"
    "gzip"
    "mc"
    "nano"
    "neofetch"
    "nmap"
    "openjdk-21-jdk"
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
    "software-properties-common"
    "tar"
    "wget"
    "wget2"
)
#
#
TOTAL_APT_INSTALL=${#APT_INSTALL_ARRAY[@]}
CURRENT_APT_INSTALL_COUNT=0
#
#
#
#
for apt_install in "${APT_INSTALL_ARRAY[@]}"; do
    CURRENT_APT_INSTALL_COUNT=$((CURRENT_APT_INSTALL_COUNT + 1))
    
    # Bereken de voortgang in percentage
    PROGRESS=$((CURRENT_APT_INSTALL_COUNT * 100 / TOTAL_APT_INSTALL))
    
    # Update de progressiebalk
    draw_progress_bar "$PROGRESS"

    echo " " # Nieuwe lijn voor de status van de huidige pull
    # echo "Laden van: $image"
    apt install "$apt_install" -y >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps_pb.log 2>&1
    if [ $? -ne 0 ]; then
        echo "Fout bij installatie van $apt_install. Gaat verder met de volgende..."
    fi
done

echo " "

    if [ $distro == "debian" ]; then
        #
        # Install Ubuntu Snap on Debian
        #
        apt install snapd -y >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps_snap.log 2>&1
        snap install core >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps_snap.log 2>&1
        #
    fi

    if [ $distro == "ubuntu" ]; then
        #
        # Ubuntu APT Package Manager
        #
        apt install ubuntu-drivers-common -y >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps.log 2>&1
        #
    fi

snap install curl >> /home/$SUDO_USER/luct-logs/debulx_install_default_apps_snap.log 2>&1

}
#
#
#
#
#   #######################
#   3DU21 Debian Ubuntu OS Install Software Functies
#        Functie Native Installatie Cockpit Management Server
#        Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_install_cockpit_srv () {
    #
    apt install -qq -y cockpit > /home/$SUDO_USER/luct-logs/debulx_install_cockpit_srv.log 2>&1
    # Aanmaken Cockpit Service
    systemctl enable --now cockpit.socket >> /home/$SUDO_USER/luct-logs/debulx_install_cockpit_srv.log 2>&1
    # Aanpassen Poort 
    rm -f /tmp/listen.conf
    echo '[Socket]' > /tmp/listen.conf
    echo 'ListenStream=' >> /tmp/listen.conf
    echo 'ListenStream=8101' >> /tmp/listen.conf
    mkdir -p /etc/systemd/system/cockpit.socket.d/
    cp /tmp/listen.conf /etc/systemd/system/cockpit.socket.d
    #
    systemctl daemon-reload >> /home/$SUDO_USER/luct-logs/debulx_install_cockpit_srv.log 2>&1
    systemctl restart cockpit.socket >> /home/$SUDO_USER/luct-logs/debulx_install_cockpit_srv.log 2>&1
}
#
#
#
#
#   #######################
#   3DU22 Debian Ubuntu OS Install Software Functies
#        Functie Installatie Docker en Docker Compose
#        Onderdeel van Debian Ubuntu Docker Nested Functie
#   #######################
#
#
#
#
function debulx_install_docker_ce () {
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
            if [ $distro == "debian" ]; then
                echo 'Package lxc-docker is not installed so not removed is NO problem'
                echo 'Package lxc-docker-virtual-package is not installed so not removed is NO problem'
            fi
            #
            if [ $distro == "ubuntu" ]; then
                echo 'E: Unable to locate package lxc-docker* is NO problem'
                echo 'E: Couldnt find any package by glob lxc-docker* is NO problem'
            fi
            #
            apt purge -qq -y lxc-docker* || true
            #
            curl -sSL https://get.docker.com/ | sh > /home/$SUDO_USER/luct-logs/debulx_install_docker_ce.log 2>&1
            #
            service docker start >> /home/$SUDO_USER/luct-logs/debulx_install_docker_ce.log 2>&1
            #
            usermod -a -G docker $SUDO_USER >> /home/$SUDO_USER/luct-logs/debulx_install_docker_ce.log 2>&1
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
#
#
#   #######################
#   3DU23 Debian Ubuntu OS Install Software Functies
#        Functie Installatie Podman
#        Onderdeel van Debian Ubuntu Podman Nested Functie
#   #######################
#
#
#
#
function debulx_install_podman () {
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
            apt install -y podman > /home/$SUDO_USER/luct-logs/debulx_install_podman.log 2>&1
            service podman start >> /home/$SUDO_USER/luct-logs/debulx_install_podman.log 2>&1
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
#
#
#   #######################
#   3DU24 Debian Ubuntu OS Install Software Functies
#        Functie Installatie OS Powershell
#        Onderdeel van Debian Nested OOBE Functie
#   #######################
#
#
#   Powershell 7 is te starten met pwsh commando
#
#
function debulx_install_pwrshell () {
    #
    curl -s -SL "https://packages.microsoft.com/config/$distro/$versie/packages-microsoft-prod.deb" -o "/tmp/packages-microsoft-prod.deb"
    dpkg -i /tmp/packages-microsoft-prod.deb > /home/$SUDO_USER/luct-logs/luct_pwsh.log 2>&1
    apt update -qq >> /home/$SUDO_USER/luct-logs/luct_pwsh.log 2>&1
    apt install powershell -y >> /home/$SUDO_USER/luct-logs/luct_pwsh.log 2>&1
    rm /tmp/packages-microsoft-prod.deb >> /home/$SUDO_USER/luct-logs/luct_pwsh.log 2>&1
    #
    if [ $modus == "test" ]; then
        pwsh --command get-host
    fi
    #
}

#
#
#
#   #######################
#   3DU24 Debian Ubuntu OS Install Software Functies
#        Functie Installatie Minikube
#        Minikube Kubeadm Kubectl
#   #######################
#
#
#
#
function debulx_install_minikube_compleet () {
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
        curl -s -o /tmp/minikube_latest_amd64.deb https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
        dpkg -i /tmp/minikube_latest_amd64.deb > /home/$SUDO_USER/luct-logs/luct_minikube.log 2>&1
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
        snap install kubeadm --classic --channel=latest >> /home/$SUDO_USER/luct-logs/luct_kubeadm.log 2>&1
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
        curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" > /home/$SUDO_USER/luct-logs/luct_kubectl.log 2>&1
        chmod +x kubectl >> /home/$SUDO_USER/luct-logs/luct_kubectl.log 2>&1
        mv kubectl /usr/local/bin/ >> /home/$SUDO_USER/luct-logs/luct_kubectl.log 2>&1
        kubectl version --client >> /home/$SUDO_USER/luct-logs/luct_kubectl.log 2>&1
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
#
#
# 3DU3 CATEGORIE Debian Ubuntu OS DOCKER Software Functies 
#
#
#
#
# 3DU30 Debian UBUNTU OS DOCKER Software Functies ## Images Pull
#
#
# Build 22 Deze functie kan weg als de container engine functie goed werkt
#
#
function debulx_docker_images_pull () {
    #
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
    #
    #
    TOTAL_IMAGES=${#DOCKER_IMAGES[@]}
    CURRENT_IMAGE_COUNT=0
    #
    #
    for image in "${DOCKER_IMAGES[@]}"; do
        CURRENT_IMAGE_COUNT=$((CURRENT_IMAGE_COUNT + 1))
        # Bereken de voortgang in percentage
        PROGRESS=$((CURRENT_IMAGE_COUNT * 100 / TOTAL_IMAGES))
        # Update de progressiebalk
        draw_progress_bar "$PROGRESS"
        echo " "
        docker pull -q "$image" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "Fout bij het laden van $image. Gaat verder met de volgende..."
        fi
    done
    #
    echo " "
    #
    if [ $modus == "test" ]; then
        docker images
    else
        docker images > /home/$SUDO_USER/luct-logs/debulx_docker_images_pull.log 2>&1
    fi
    #
}
#
#
#
#
# 3DU31 Debian UBUNTU OS DOCKER Software Functies ## Portainer Create
#
#
# Build 22 Deze functie kan weg als de container engine functie goed werkt
#
#
function debulx_docker_portainer_run () {
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
    docker run -d -p 8000:8000 -p 9101:9443 --name LUCT_portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest >> /home/$SUDO_USER/luct-logs/luct_start_Portainer.log 2>&1
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
#
#
# 3DU32 Debian UBUNTU OS DOCKER Software Functies ## Yacht Create
#
#
#
#
function debulx_docker_yacht_run () {
    #
    # Docker Volume Aanmaken voor Yacht
    docker volume create yacht_data > /home/$SUDO_USER/luct-logs/debulx_docker_yacht_run.log 2>&1
    #
    # Docker Run Yacht
    docker run -d -p 9102:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht_data:/config --name LUCT_Yacht --restart=always selfhostedpro/yacht >> /home/$SUDO_USER/luct-logs/luct_start_Yacht.log 2>&1
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
#
#
# 3DU33 Debian UBUNTU OS DOCKER Software Functies ## VS Code Server Create
#
#
#
#
function debulx_docker_vscsrv_run () {
   #
   # Definitie Configuratie Variabelen
   # 
   CONTAINER_NAME="LUCT_VSC_Server"
   PROJECT_DIR="/home/$SUDO_USER/demos"
   DOCKER_IMAGE="codercom/code-server:latest"
   #
   # Start Visual Studio Code Server als Container
   #
   docker run -d -p 9103:8080 -v "$PROJECT_DIR:/home/coder/project" --name "$CONTAINER_NAME" --restart=always "$DOCKER_IMAGE" --auth=none >> /home/$SUDO_USER/luct-logs/luct_start_vsc_srv.log 2>&1
   #
   # In Visual Studio Code Server is lokale omgeving zichtbaar onder Project
   #
}
#
#
#
#
# 3DU34 Debian UBUNTU OS DOCKER Software Functies ## Jenkins Create
#
#
#
#
function debulx_docker_jenkins_run () {
    #
    # Docker Volume Aanmaken voor Yacht
    docker volume create jenkins_data > /home/$SUDO_USER/luct-logs/debulx_docker_jenkins_run.log 2>&1
    #
    # Docker Run Jenkins
    docker run -d --name LUCT_Jenkins -p 9104:8080 -p 50000:50000 --restart=always -v jenkins_data:/var/jenkins_home jenkins/jenkins:latest-jdk21 >> /home/$SUDO_USER/luct-logs/luct_start_jenkins.log 2>&1
    #
    # Kopie maken van Initieel Wachtwoord bestand vanaf Docker Volume naar lokale omgeving 
    # 25 juli 25 check gedaan
    # sudo docker exec -it 82d3e48892f5 ls /var/jenkins_home/secrets
    # Bestandsnaam is initialAdminPassword
    #
    # Wordt later gedaan in nested docker lus
    # Zodat container eerst rustig op kan starten
    #     docker cp LUCT_Jenkins:/var/jenkins_home/secrets/initialAdminPassword /home/$SUDO_USER/Jenkins_Wachtwoord.txt
    #
}
#
#
#
#
# 3DU35 Debian UBUNTU OS DOCKER Software Functies ## Docker Management Tools
#
#
#
#
function debulx_docker_mgmt_tools () {
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
    # snap install dive   niet aan te bevelen omdat deze manier vernieling doet van docker 
    #
    DIVE_VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
    DIVE_DWNLD_URL="https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb"
    wget -O /home/$SUDO_USER/tmp/dive_linux_amd64.deb $DIVE_DWNLD_URL > /home/$SUDO_USER/luct-logs/dive.log 2>&1
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
    echo "docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_HOST=$DOCKER_HOST moncho/dry" > /home/$SUDO_USER/dkr-scripts/dkr-run_dry.sh
    chmod +x /home/$SUDO_USER/dkr-scripts/dkr_run_dry.sh
    #
    #
    # ###########
    # LazyDocker
    # https://github.com/jesseduffield/lazydocker
    # ###########
    #
    # Haal de nieuwste Lazydocker versie op
    LDV_MET_V=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
    LDV_ZONDER_V="${LDV_MET_V#v}"
    #
    # Zet variabele Download URL met hulp van voorgaande variabelen
    LD_DWNLD_URL="https://github.com/jesseduffield/lazydocker/releases/download/${LDV_MET_V}/lazydocker_${LDV_ZONDER_V}_Linux_x86_64.tar.gz"
    #
    # download nieuwste versie van LazyDocker
    wget -O /home/$SUDO_USER/tmp/lazydocker.tar.gz $LD_DWNLD_URL > /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
    #
    # Uitpakken 
    if [ $distro == "debian" ]; then
        7zz x /home/$SUDO_USER/tmp/lazydocker.tar.gz -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
        7zz x /home/$SUDO_USER/tmp/lazydocker.tar -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
    fi
    #
    if [ $distro == "ubuntu" ]; then
        7z x /home/$SUDO_USER/tmp/lazydocker.tar.gz -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
        7z x /home/$SUDO_USER/tmp/lazydocker.tar -o/home/$SUDO_USER/tmp -y >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
    fi
    #
    # Op Debian is 7z ineens 7zz 
    # Is dit op Ubuntu ook zo 
    # Uitzoeken
    #
    # Overzetten
    mv /home/$SUDO_USER/tmp/lazydocker /usr/local/bin/lazydocker >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
    #
    # Uitvoerbaar maken 
    chmod +x /usr/local/bin/lazydocker >> /home/$SUDO_USER/luct-logs/lazydocker.log 2>&1
    #
    echo 'sudo lazydocker' > /home/$SUDO_USER/dkr-scripts/dkr_lazydocker_run.sh
    #
    # ###########
    # WatchTower
    # https://github.com/containrrr/watchtower
    # ###########
    #
    docker run -d -p 9106:8080 --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower >> /home/$SUDO_USER/luct-logs/luct_start_WachTower.log 2>&1
}
#
#
#
#
# 3DU4 CATEGORIE Debian UBUNTU OS Podman Software Functies 
#
#
#
#
#
# 3DU40 Debian UBUNTU OS Podman Software Functies ## Images Pull
#
#
#
#
function debulx_podman_images_pull () {
    #
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
    #
    #
    TOTAL_IMAGES=${#DOCKER_IMAGES[@]}
    CURRENT_IMAGE_COUNT=0
    #
    #
    for image in "${DOCKER_IMAGES[@]}"; do
        CURRENT_IMAGE_COUNT=$((CURRENT_IMAGE_COUNT + 1))
        # Bereken de voortgang in percentage
        PROGRESS=$((CURRENT_IMAGE_COUNT * 100 / TOTAL_IMAGES))
        # Update de progressiebalk
        draw_progress_bar "$PROGRESS"
        echo " "
        podman pull -q "$image" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "Fout bij het laden van $image. Gaat verder met de volgende..."
        fi
    done
    #
    echo " "
    #
    if [ $modus == "test" ]; then
        podman images
    else
        podman images > /home/$SUDO_USER/luct-logs/debulx_docker_images_pull.log 2>&1
    fi
    #
}
#
#
#
#
# 3DU41 Debian UBUNTU OS Podman Software Functies ## Portainer Create
#
#
#
#
function debulx_podman_portainer_run () {
    #
    # Pull Image
    # Wordt gedaan door de functie Pull Images
    # docker pull -q portainer/portainer-ce:latest > /dev/null 2>&1
    #
    # Docker Volume Aanmaken voor Portainer
    podman volume create portainer_data > /dev/null 2>&1
    #
    # Docker Run Portainer
    # HOST PORT / CONTAINER PORT
    # Poorten
    # Port 8000: Used for the TCP tunnel server, primarily for Edge Agent communication and is optional if not using Edge Compute features. 
    # Port 9443: Used by the Portainer Server for accessing the user interface (UI) and API. This is the default HTTPS port for Portainer
    # Port 9001: The default port used by the Portainer Agent to communicate with the Portainer Server. 
    podman run -d -p 8000:8000 -p 9101:9443 --name LUCT_portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest >> /home/$SUDO_USER/luct-logs/luct_start_Portainer.log 2>&1
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
#
#
# 3DU42 Debian UBUNTU OS Podman Software Functies ## Yacht Create
#
#
#
#
function debulx_podman_yacht_run () {
    #
    # Docker Volume Aanmaken voor Yacht
    podman volume create yacht_data > /home/$SUDO_USER/luct-logs/debulx_docker_yacht_run.log 2>&1
    #
    # Docker Run Yacht
    podman run -d -p 9102:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht_data:/config --name LUCT_Yacht --restart=always selfhostedpro/yacht >> /home/$SUDO_USER/luct-logs/luct_start_Yacht.log 2>&1
    #
    # Bash Shell Script maken Yacht
    echo '#! /bin/bash' > /home/$SUDO_USER/yacht_restart.sh
    #
    echo 'podman stop yacht' >> /home/$SUDO_USER/yacht_restart.sh
    echo 'podman start yacht' >> /home/$SUDO_USER/yacht_restart.sh
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
#
#
# 3DU43 Debian UBUNTU OS Podman Software Functies ## VS Code Server Create
#
#
#
#
function debulx_podman_vscsrv_run () {
   #
   # Definitie Configuratie Variabelen
   # 
   CONTAINER_NAME="LUCT_VSC_Server"
   PROJECT_DIR="/home/$SUDO_USER/demos"
   DOCKER_IMAGE="codercom/code-server:latest"
   #
   # Start Visual Studio Code Server als Container
   #
   podman run -d -p 9103:8080 -v "$PROJECT_DIR:/home/coder/project" --name "$CONTAINER_NAME" --restart=always "$DOCKER_IMAGE" --auth=none >> /home/$SUDO_USER/luct-logs/luct_start_vsc_srv.log 2>&1
   #
   # In Visual Studio Code Server is lokale omgeving zichtbaar onder Project
   #
}
#
#
#
#
# 3DU44 Debian UBUNTU OS Podman Software Functies ## Jenkins Create
#
#
#
#
function debulx_podman_jenkins_run () {
    #
    # Docker Volume Aanmaken voor Yacht
    podman volume create jenkins_data > /home/$SUDO_USER/luct-logs/debulx_docker_jenkins_run.log 2>&1
    #
    # Docker Run Jenkins
    podman run -d --name LUCT_Jenkins -p 9104:8080 -p 50000:50000 --restart=always -v jenkins_data:/var/jenkins_home jenkins/jenkins:latest-jdk21 >> /home/$SUDO_USER/luct-logs/luct_start_jenkins.log 2>&1
    #
    # Kopie maken van Initieel Wachtwoord bestand vanaf Docker Volume naar lokale omgeving 
    # 25 juli 25 check gedaan
    # sudo docker exec -it 82d3e48892f5 ls /var/jenkins_home/secrets
    # Bestandsnaam is initialAdminPassword
    #
    # Wordt later gedaan in nested docker lus
    # Zodat container eerst rustig op kan starten
    #     docker cp LUCT_Jenkins:/var/jenkins_home/secrets/initialAdminPassword /home/$SUDO_USER/Jenkins_Wachtwoord.txt
    #
}
#
#
#
#
# 3DU5 CATEGORIE Debian UBUNTU OS Container Engine Software Functies 
#
#
#
#
#
# 3DU50 ## Debian Ubuntu ## Container Engine Functies ## Images Pull
#
#
#
#
function debulx_conteng_images_pull () {
    #
    local containerengine=$1
    #
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
    #
    #
    TOTAL_IMAGES=${#DOCKER_IMAGES[@]}
    CURRENT_IMAGE_COUNT=0
    #
    #
    for image in "${DOCKER_IMAGES[@]}"; do
        CURRENT_IMAGE_COUNT=$((CURRENT_IMAGE_COUNT + 1))
        # Bereken de voortgang in percentage
        PROGRESS=$((CURRENT_IMAGE_COUNT * 100 / TOTAL_IMAGES))
        # Update de progressiebalk
        draw_progress_bar "$PROGRESS"
        echo " "
        $containerengine pull -q "$image" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "Fout bij het laden van $image. Gaat verder met de volgende..."
        fi
    done
    #
    echo " "
    #
    if [ $modus == "test" ]; then
        $containerengine images
    else
        $containerengine images > /home/$SUDO_USER/luct-logs/debulx_docker_images_pull.log 2>&1
    fi
    #
}
#
#
#
#
# 3DU51 ## Debian Ubuntu ## Container Engine Functies ## Portainer Create
#
#
#
#
function debulx_conteng_portainer_run () {
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
    if [ $containerengine == "docker" ]; then
        $containerengine run -d -p 8000:8000 -p 9101:9443 --name LUCT_portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest >> /home/$SUDO_USER/luct-logs/luct_start_Portainer.log 2>&1
    fi
    #
    if [ $containerengine == "podman" ]; then
        $containerengine run -d -p 8000:8000 -p 9101:9443 --name LUCT_portainer --restart=always -v /var/run/podman/podman.sock:/var/run/podman/podman.sock -v portainer_data:/data portainer/portainer-ce:latest >> /home/$SUDO_USER/luct-logs/luct_start_Portainer.log 2>&1
    fi
    #
    #
    # Bash Shell Script maken Portainer
    echo '#! /bin/bash' > /home/$SUDO_USER/portainer_restart.sh
    #
    echo "$containerengine stop portainer" >> /home/$SUDO_USER/portainer_restart.sh
    echo "$containerengine start portainer" >> /home/$SUDO_USER/portainer_restart.sh
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
#
#
# 3DU6 CATEGORIE Debian UBUNTU Configuratie Functies
#
#
#
#
#
#   #######################
#   3DU60 Debian UBUNTU Configuratie Functies
#        Functie Config Timezone Amsterdam Europa 
#        Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_config_timezone_ams () {
    #
    timedatectl set-timezone Europe/Amsterdam > /home/$SUDO_USER/luct-logs/debulx_config_timezone_ams.log 2>&1
    #
    if [ $modus == "test" ]; then
        timedatectl show
    fi
    #
}
#
#
#
#
#   #######################
#   3DU61 Debian UBUNTU Configuratie Functies
#         Functie Configuratie Virtualisatie
#         Onderdeel van Debian Ubuntu Nested OOBE Functie
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
#
#
#   #######################
#   3DU62 Debian UBUNTU Configuratie Functies
#         Functie Python Compatible
#         Onderdeel van Debian Ubuntu Nested OOBE Functie
#   #######################
#
#
#
#
function debulx_python_compatible () {
    #
    ln -s /usr/bin/python3 /usr/local/bin/python
    #
}
#
#
#
#   #######################
#   3DU63 Debian UBUNTU Configuratie Functies
#         Functie Minikube
#         Minikube met Docker als driver
#   #######################
#
#
#
#
function debulx_config_minikube_docker () {
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
#
#
# 3DU7 CATEGORIE Debian UBUNTU APPS Nested Functions
#
#
#
#
#   #################################
#   3DU70 Debian Ubuntu Nested 
#         Docker
#   #################################
#
#
#
#
function debulx_nested_docker_complete () {
    echo 'DEBIAN/UBUNTU - Step 1 of 9 Installation and configuration Docker CE with Compose plugin'
    debulx_install_docker_ce
    if [ $modus == "test" ]; then
        docker -v
        docker compose version
    fi
    echo 'DEBIAN/UBUNTU - Step 2 of 9 Pull most commonly used Docker images from Docker Hub'
    # debulx_docker_images_pull
    debulx_conteng_images_pull "docker"
    echo 'DEBIAN/UBUNTU - Step 3 of 9 Starting Local Registry Container'
    docker run -d -p 9105:5000 --restart always --name registry registry > /home/$SUDO_USER/luct-logs/luct_start_registry.log 2>&1
    echo 'DEBIAN/UBUNTU - Step 4 of 9 Starting Portainer Container Management Container'
    # debulx_docker_portainer_run
    debulx_conteng_portainer_run "docker"
    echo 'DEBIAN/UBUNTU - Step 5 of 9 Starting Yacht Container Management Container'
    debulx_docker_yacht_run
    echo 'DEBIAN/UBUNTU - Step 6 of 9 Starting Jenkins Container'
    debulx_docker_jenkins_run
    echo 'DEBIAN/UBUNTU - Step 7 of 9 Starting Visual Studio Code Server Container'
    debulx_docker_vscsrv_run
    echo 'DEBIAN/UBUNTU - Step 8 of 9 Installing Docker Management tools'
    debulx_docker_mgmt_tools
    echo 'DEBIAN/UBUNTU - Step 9 of 9 Saving Jenkins initialAdminPassword to file'
    docker cp LUCT_Jenkins:/var/jenkins_home/secrets/initialAdminPassword /home/$SUDO_USER/Jenkins_Wachtwoord.txt

# Uitgaande Containerpoorten 9100 Docker Management Tools
echo '9101 Portainer' >> /home/$SUDO_USER/port_list.txt
echo '9102 Yacht' >> /home/$SUDO_USER/port_list.txt
echo '9103 Visual Studio Code Server' >> /home/$SUDO_USER/port_list.txt
echo '9104 Jenkins' >> /home/$SUDO_USER/port_list.txt
echo '9105 Registry' >> /home/$SUDO_USER/port_list.txt
echo '9106 WatchTower' >> /home/$SUDO_USER/port_list.txt

}
#
#
#
#
#   #################################
#   3DU71 Debian Ubuntu Nested 
#         Podman
#   #################################
#
#
#
#
function debulx_nested_podman_complete () {
    echo 'DEBIAN/UBUNTU - Step 1 of 9 Installation and configuration Podman'
    debulx_install_podman
    if [ $modus == "test" ]; then
        podman -v
    fi
    echo 'DEBIAN/UBUNTU - Step 2 of 9 Pull most commonly used Docker images from Docker Hub'
    # debulx_podman_images_pull
    debulx_conteng_images_pull "podman"
    echo 'DEBIAN/UBUNTU - Step 3 of 9 Starting Local Registry Container'
    podman run -d -p 9105:5000 --restart always --name registry registry > /home/$SUDO_USER/luct-logs/luct_start_registry.log 2>&1
    echo 'DEBIAN/UBUNTU - Step 4 of 9 Starting Portainer Container Management Container'
    # debulx_podman_portainer_run
    debulx_conteng_portainer_run "podman"
    echo 'DEBIAN/UBUNTU - Step 5 of 9 Starting Yacht Container Management Container'
    debulx_podman_yacht_run
    echo 'DEBIAN/UBUNTU - Step 6 of 9 Starting Jenkins Container'
    debulx_podman_jenkins_run
    echo 'DEBIAN/UBUNTU - Step 7 of 9 Starting Visual Studio Code Server Container'
    debulx_podman_vscsrv_run
    echo 'DEBIAN/UBUNTU - Step 8 of 9 Installing Docker Management tools'
    debulx_docker_mgmt_tools
    echo 'DEBIAN/UBUNTU - Step 9 of 9 Saving Jenkins initialAdminPassword to file'
    podman cp LUCT_Jenkins:/var/jenkins_home/secrets/initialAdminPassword /home/$SUDO_USER/Jenkins_Wachtwoord.txt
}
#
#
#
#
# ################################################################################
#
# Fase 3U                                                #       #
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
# 3U1 CATEGORIE UBUNTU OS Functies
#
#
#
#
#   #######################
#   3U10 UBUNTU OS FUNCTIES
#        Functie Change Repo Ubuntu
#        Onderdeel van Ubuntu Nested OOBE Functie 
#   #######################
#
#
#
#
function ulx_os_change_repo_nl () {
    #
    if [ $versie == "22.04" ] ; then
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
    if [ $versie == "24.04" ] ; then
        # Vervang tweede tekstregel door nieuwe inhoud 
        sed -i '2c\URIs: http://mirror.ams.macarne.com/ubuntu/' /etc/apt/sources.list.d/ubuntu.sources > /home/$SUDO_USER/luct-logs/add-apt-repository.log
        # Voeg nieuwe repo toe 
        add-apt-repository http://mirror.nl.datapacket.com/ubuntu/ -s -y >> /home/$SUDO_USER/luct-logs/add-apt-repository.log
        #
    fi
}
#
#
#
#
# 3U2 CATEGORIE UBUNTU OS Install Software Functies
#
#
#
#
#   #######################
#   3U20 UBUNTU OS Install Software Functies
#        Functie Installatie Ansible Master
#        Alleen beschikbaar maken en houden voor Ubuntu Linux 
#   #######################
#
#
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
    if [ $distro == "ubuntu" ]; then
        apt-add-repository ppa:ansible/ansible -y > /home/$SUDO_USER/luct-logs/ulx_install_ansible_master.log 2>&1
    fi
    #
    #
    apt install ansible -y >> /home/$SUDO_USER/luct-logs/ulx_install_ansible_master.log 2>&1
    apt install sshpass -y >> /home/$SUDO_USER/luct-logs/ulx_install_ansible_master.log 2>&1
    #
    # Ansible Automation Controller step 4
    # Aanpassen etc hosts bestand
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
                echo "$HOSTNAME already exists in /etc/hosts"
            else
                # Add the hostname and IP address to /etc/hosts
                echo "$eth_ip ansible_demo_ctrl_001" | sudo tee -a /etc/hosts > /dev/null
                echo "$eth_plus1_ip ansible_demo_host_001" | sudo tee -a /etc/hosts > /dev/null
                echo "Hostname $HOSTNAME added to /etc/hosts"
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
                echo "$HOSTNAME already exists in /etc/hosts"
            else
                # Add the hostname and IP address to /etc/hosts
                echo "$ens_ip ansible_demo_ctrl_001" | sudo tee -a /etc/hosts > /dev/null
                echo "$ens_plus1_ip ansible_demo_host_001" | sudo tee -a /etc/hosts > /dev/null
                echo "Hostname $HOSTNAME added to /etc/hosts"
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

        WORD_TO_REPLACE="gebruikersnaam"
        sed -i "s/$WORD_TO_REPLACE/$SUDO_USER/g" /etc/ansible/inventory/ansible-demo-inventory-LUCT-4
        #
        WORD_TO_REPLACE="wachtwoord"
        sed -i "s/$WORD_TO_REPLACE/$SUDO_USER/g" /etc/ansible/inventory/ansible-demo-inventory-LUCT-4
        #
        WORD_TO_REPLACE="machinenaam"
        sed -i "s/$WORD_TO_REPLACE/$HOSTNAME/g" /etc/ansible/inventory/ansible-demo-inventory-LUCT-4
        #
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
    mkdir -p /home/$SUDO_USER/playbooks >> /home/$SUDO_USER/luct-logs/ulx_install_ansible_master.log 2>&1
    chown -f -R $SUDO_USER /home/$SUDO_USER/playbooks >> /home/$SUDO_USER/luct-logs/ulx_install_ansible_master.log 2>&1
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
    #
    echo 'GIT CLONE - Step 1 of 1 GitHub Ansible DevOps'
    if [ -d "/home/$SUDO_USER/ansible_devops" ]; then
        rm -rf "/home/ubuntu/ansible_devops"
    fi
    git clone --quiet https://github.com/geerlingguy/ansible-for-devops.git /home/$SUDO_USER/ansible_devops
    #
} 
#
#
#
#
#   #######################
#   3U21 UBUNTU OS Install Software Functies
#        Functie Installatie Ansible Slave
#        Ansible
#   #######################
#
#
#
#
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
    # Haal het IP-adres van eth1 op
    eth1_ip=$(ip addr show eth1 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
    # Voeg 1 toe aan het IP-adres van eth1
    IFS=. read -r a b c d <<< "$eth1_ip"
    eth1_min1_ip="$a.$b.$c.$((d-1))"
    # Sla de IP-adressen op in afzonderlijke variabelen
    eth1_ip_var="eth1_ip=$eth1_ip"
    eth1_min1_ip_var="eth1_min1_ip=$eth1_min1_ip"
    if grep -q "$eth1_ip" /etc/hosts; then
        echo "$HOSTNAME already exists in /etc/hosts"
    else
        # Add the hostname and IP address to /etc/hosts
        echo "$eth1_ip ansible_demo_host_001" | sudo tee -a /etc/hosts > /dev/null
        echo "$eth1_min1_ip ansible_demo_ctrl_001" | sudo tee -a /etc/hosts > /dev/null
        echo "Hostname $HOSTNAME added to /etc/hosts"
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
#
#
#   #######################
#   3U22 UBUNTU OS Install Software Functies
#        Functie Installatie Ansible Semaphore
#        Alleen beschikbaar maken en houden voor Ubuntu Linux
#   #######################
#
#
#
#
function ulx_install_ansible_semaphore () {
    #
    # Debian Ubuntu functie en niet meer alleen Ubuntu functie
    # Omdat Snap nu ook beschikbaar is binnen Debian door dit script
    #
    # Installatie semaphore 
    # https://docs.semui.co/administration-guide/installations
    #
    # 
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
#
#
#   #######################
#   3U23 UBUNTU OS Install Software Functies
#        Functie Installatie gnome desktop
#        GUI
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
#   3U24 UBUNTU OS Install Software Functies
#        Functie Installatie Desktop Tools
#        GUI
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
# 3U3 CATEGORIE UBUNTU Configuratie Functies
#
#
#
#   #######################
#   3U30 UBUNTU Configuratie Functies
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
#   3U31 UBUNTU Configuratie Functies
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
    netplan apply > /home/$SUDO_USER/luct-logs/ulx_os_config_dns.log 2>&1
#
#
else
    echo 'Geen geldige netwerkinterface gevonden (eth* of ens*)'
fi
}
#
#
#
# 3U4 CATEGORIE UBUNTU OS Nested Functions
#
#
# 3U40 UBUNTU OS Nested Functions Basis Configuratie
#
#
#
function ulx_nested_oobe () {
    echo 'DEBIAN/UBUNTU - Step 1 of 11 Set Timezone to Europe Amsterdam'
    debulx_config_timezone_ams
    echo 'UBUNTU        - Step 2 of 11 Configure APT Package Manager'
    ulx_os_change_repo_nl
    echo 'DEBIAN/UBUNTU - Step 3 of 11 Configure APT Repository'
    debulx_os_update_apt
    echo 'DEBIAN/UBUNTU - Step 4 of 11 Upgrading Operating System (Please be patient ... takes a while)'
    debulx_os_upgrade_packages
    echo 'UBUNTU        - Step 5 of 11 Changing Domain Name Service (DNS) settings'
    ulx_os_config_dns
    echo 'UBUNTU        - Step 6 of 11 Configure Network Interface Card 2'
    # ulx_os_netplan_download
    echo 'DEBIAN/UBUNTU - Step 7 of 11 Installing Default Apps'
    debulx_install_default_apps
    echo 'DEBIAN/UBUNTU - Step 8 of 11 Installing or updating of Open VM Tools'
    debulx_config_virtualization
    echo 'DEBIAN/UBUNTU - Step 9 of 11 Installing and configuration of Cockpit'
    debulx_install_cockpit_srv
    echo 'DEBIAN/UBUNTU - Step 10 of 11 Installing Microsoft Powershell 7 (latest version)'
    debulx_install_pwrshell
    echo 'DEBIAN/UBUNTU - Step 11 of 11 Making Python 3 compatible to old versions'
    debulx_python_compatible
}
#
#
#
#
#
#   ################################################################################
#   ################################################################################
#   Linux Distributie
#   Onafhankelijke
#   Functies 
#   ################################################################################
#   ################################################################################
#
#
#
#
#
#  ####################################
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function maak directories
#  ####################################
#
#
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
    if [ ! -d "/home/$SUDO_USER/luct-logs" ]; then
        mkdir -p /home/$SUDO_USER/luct-logs
        chown -f -R $SUDO_USER /home/$SUDO_USER/luct-logs
    fi
    #
    # Docker Scripts
    #
    if [ ! -d "/home/$SUDO_USER/dkr-scripts" ]; then
        mkdir -p /home/$SUDO_USER/dkr-scripts
        chown -f -R $SUDO_USER /home/$SUDO_USER/dkr-scripts
    fi
}
#
#
#
#
#
#  ####################################
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function git clone 
#  ####################################
#
#
#
#
function git_clone_demos () {
    # Demos
    echo 'GIT CLONE - Step 1 of 5 GitHub JATUTERT Demos'
    if [ -d "/home/$SUDO_USER/demos" ]; then
        rm -rf "/home/ubuntu/demos"
    fi
    git clone --quiet https://github.com/jatutert/demos.git /home/$SUDO_USER/demos
    # Awesome Compose 
    echo 'GIT CLONE - Step 2 of 5 GitHub Docker Awesome Compose'
    if [ -d "/home/$SUDO_USER/demos" ]; then
        rm -rf "/home/ubuntu/demos/Docker/Compose/Awesome-compose"
    fi
    git clone --quiet https://github.com/docker/awesome-compose.git /home/$SUDO_USER/demos/Docker/Compose/Awesome-compose
    # Onderwijs
    echo 'GIT CLONE - Step 3 of 5 GitHub MSiekmans (Onderwijs)'
    if [ -d "/home/$SUDO_USER/onderwijs" ]; then
        rm -rf "/home/ubuntu/onderwijs"
    fi
    git clone --quiet https://github.com/msiekmans/linux-server-scripts.git /home/$SUDO_USER/onderwijs
    # PowerShell
    echo 'GIT CLONE - Step 4 of 5 GitHub Powershell is fun'
    if [ -d "/home/$SUDO_USER/powershell" ]; then
        rm -rf "/home/ubuntu/powershell"
    fi
    git clone --quiet https://github.com/HarmVeenstra/Powershellisfun.git /home/$SUDO_USER/powershell
    # Shell Scripts
    echo 'GIT CLONE - Step 5 of 5 Make all Shell Scriptfiles Executable'
    find /home/$SUDO_USER/demos -type f -name "*.sh" -exec chmod +x {} \;
} 
#
#
#
#
#
#  ####################################
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function progress bar 
#  ####################################
#
#
#
#
draw_progress_bar() {
    local progress=$1
    local bar_length=50
    local filled_length=$((progress * bar_length / 100))
    local empty_length=$((bar_length - filled_length))
    local filled_chars=$(printf "%${filled_length}s" | tr ' ' '#')
    local empty_chars=$(printf "%${empty_length}s" | tr ' ' '-')

    # Clear the current line and redraw the bar
    printf "\r[%s%s] %3d%%" "$filled_chars" "$empty_chars" "$progress"
}
#
#
#
#
#
#  ####################################
#  ## Linux Distributie Onafhankelijke Functies
#  ## Function Menu
#  ####################################
#
#
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
            debulx_config_timezone_ams
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            debulx_os_update_apt
            # Bijwerken 
            echo "Step 2 of 5 Upgrading OS"
            debulx_os_upgrade_packages
            # Installatie 
            echo "Step 3 of 5 Installing OS Tools"
            debulx_config_virtualization
            ulx_install_pwrshell
            debulx_install_cockpit_srv
            # DOCKER
            echo "Step 4 of 5 Installation and configuration Docker CE"
            debulx_install_docker_ce
            debulx_docker_portainer_run
            debulx_docker_images_pull
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
            debulx_config_timezone_ams
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
            debulx_install_minikube_compleet
            debulx_config_minikube_docker
            ulx_maak_minikube_voorbeelden
            ;;
        4)
            #
            # Menu keuze 4
            #
            # Configuratie
            debulx_config_timezone_ams
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
        debulx_config_timezone_ams
        maak_directories
        echo "ALPINE Step 2 of 3 Upgrading OS"
        alx_update_os
        # Installatie 
        echo "ALPINE Step 3 of 3 Installing OS Tools"
        alx_vm_tools
        # ulx_install_pwrshell
        # debulx_install_cockpit_srv
        exit 1
        elif [ $actie == "docker" ]; then
            #
            # ALPINE OPTIE 2
            #
            # Configuratie 
            echo "ALPINE Step 1 of 5 Making Preperations"
            debulx_config_timezone_ams
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            debulx_os_update_apt
            # Bijwerken 
            echo "ALPINE Step 2 of 5 Upgrading OS"
            debulx_os_upgrade_packages
            # Installatie 
            echo "ALPINE Step 3 of 5 Installing OS Tools"
            debulx_config_virtualization
            ulx_install_pwrshell
            debulx_install_cockpit_srv
            # DOCKER
            echo "ALPINE Step 4 of 5 Installation and configuration Docker CE"
            debulx_install_docker_ce
            debulx_docker_portainer_run
            debulx_docker_images_pull
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
            debulx_config_timezone_ams
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            debulx_os_update_apt
            # Bijwerken 
            echo "Step 2 of 5 Upgrading OS"
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
            debulx_install_minikube_compleet
            debulx_config_minikube_docker
            ulx_maak_minikube_voorbeelden
            exit 1
        elif [ $actie == "ansible" ]; then
            #
            # ALPINE OPTIE 4
            #
            # Configuratie
            debulx_config_timezone_ams
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
            exit 1
        elif [ $actie == "introinfra" ]; then
            #
            # ALPINE OPTIE 5
            #
            # Configuratie
            echo "Step 1 of 4 Configure Ubuntu"
            debulx_config_timezone_ams
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            debulx_os_update_apt
            # Bijwerken
            echo "Step 2 of 4 Upgrading Ubuntu"
            debulx_os_upgrade_packages
            # Installatie
            echo "Step 3 of 4 Installing Tools"
            debulx_config_virtualization
            ulx_install_pwrshell
            debulx_install_cockpit_srv
            # OSTicket
            echo "Step 4 of 4 Installing OSTicket Environment"
            ulx_intro_infra_install
            exit 1
        elif [ $actie == "itfunda" ]; then
            #
            # ALPINE OPTIE 6
            # 
            # Configuratie
            debulx_config_timezone_ams
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
        debulx_config_timezone_ams
        build_bash_config
        # 2
        echo "Step 2 of 6 Creating Directories"
        maak_directories
        # 3
        echo "Step 3a of 6 Starting Portainer Container Engine management"
        debulx_docker_portainer_run
        echo "Step 3b of 6 Starting Yacht Container Engine management"
        debulx_docker_yacht_run
        # 4
        echo "Step 4 of 6 Getting Docker Images"
        debulx_docker_images_pull
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
        debulx_docker_portainer_run
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
    if [ $actie == "upgrade" ]; then
        #
        #
        # Debian OPTIE 1
        # Alleen upgraden Debian OS
        #
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        echo '########## Configuration Process Part 1 OF 2 ##########'
        maak_directories
        #
        # Debian zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 2 OF 2 ##########'
        deb_nested_oobe
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
        # Debian OPTIE 2
        # Installeren en Configureren Docker demo omgeving 
        #
        #
        echo '########## Configuration Process Part 1 OF 5 ##########'
        if [[ "$SUDO_USER" == "debian" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="D12-BKW-M-DKR-001"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        echo '########## Configuration Process Part 2 OF 5 ##########'
        maak_directories
        #
        # Debian zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 3 OF 5 ##########'
        deb_nested_oobe
        #
        # GitHub Clones maken
        echo '########## Configuration Process Part 4 OF 5 ##########'
        git_clone_demos
        #
        # Docker en Docker omgeving inrichten
        # Moet na de git clone omdat Visual Studio Code Server gebruikt maakt van demos directory
        echo '########## Configuration Process Part 5 OF 5 ##########'
        debulx_nested_docker_complete
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
        #
        exit 1
    elif [ $actie == "podman" ]; then
        #
        #
        # Debian OPTIE 3
        # Installeren en Configureren Docker demo omgeving 
        #
        #
        echo '########## Configuration Process Part 1 OF 5 ##########'
        if [[ "$SUDO_USER" == "debian" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="D12-BKW-M-PDM-001"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        echo '########## Configuration Process Part 2 OF 5 ##########'
        maak_directories
        #
        # Debian zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 3 OF 5 ##########'
        deb_nested_oobe
        #
        # GitHub Clones maken
        echo '########## Configuration Process Part 4 OF 5 ##########'
        git_clone_demos
        #
        # Podman en Podman omgeving inrichten
        # Moet na de git clone omdat Visual Studio Code Server gebruikt maakt van demos directory
        echo '########## Configuration Process Part 5 OF 5 ##########'
        debulx_nested_podman_complete
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
        #
        exit 1
    elif [ $actie == "minikube" ]; then
        #
        #
        # Debian OPTIE 4
        # Installeren en Configureren Minikube demo omgeving 
        #
        #
        echo '########## Configuration Process Part 1 OF 7 ##########'
        if [[ "$SUDO_USER" == "debian" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="D12-BKW-M-MKC-001"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        echo '########## Configuration Process Part 2 OF 7 ##########'
        maak_directories
        #
        # Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 3 OF 7 ##########'
        deb_nested_oobe
        #
        # GitHub Clones maken
        echo '########## Configuration Process Part 4 OF 7 ##########'
        git_clone_demos
        #
        # Debian Ubuntu Docker en Docker omgeving inrichten
        # Moet na de git clone omdat Visual Studio Code Server gebruikt maakt van demos directory
        echo '########## Configuration Process Part 5 OF 7 ##########'
        debulx_nested_docker_complete
        #
        #
        echo '########## Configuration Process Part 6 OF 7 ##########'
        debulx_install_minikube_compleet
        #
        #
        echo '########## Configuration Process Part 7 OF 7 ##########'
        debulx_config_minikube_docker
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
        #
        exit 1
    elif [ $actie == "iacmaster" ]; then
        #
        #
        # Debian OPTIE 5
        # Ansible Demo Master Controller 
        #
        #
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="D12-BKW-M-IAC-M01"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        deb_nested_oobe
        #
        # Ansible
        ulx_install_ansible_master
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
        #
        exit 1
    elif [ $actie == "iacslave" ]; then
        #
        #
        # Debian OPTIE 6
        # Ansible Demo Slave
        #
        #
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="D12-BKW-M-IAC-S01"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        deb_nested_oobe
        #
        # Ansible
        ulx_install_ansible_slave
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
        #
        exit 1
    elif [ $actie == "introinfra" ]; then
        #
        #
        # Debian OPTIE 7
        #
        #
        # Directories maken
        maak_directories
        #
        # Debian/Ubuntu zo instellen zoals gewenst
        deb_nested_oobe
        #
        # OSTicket
        ulx_intro_infra_install
        #
        exit 1
    elif [ $actie == "itfunda" ]; then
        #
        #
        # Debian OPTIE 8
        #
        #
        # Directories maken
        maak_directories
        #
        # Ubuntu zo instellen zoals gewenst
        deb_nested_oobe
        #
        # IT Fundamentals 
        ulx_it-funda_tooling
        #
        exit 1
    elif [ $actie == "omv" ]; then
        #
        #
        # Debian OPTIE 9
        #
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        echo '########## Configuration Process Part 1 OF 4 ##########'
        maak_directories
        #
        # Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 2 OF 4 ##########'
        deb_nested_oobe
        #
        # GitHub Clones maken
        echo '########## Configuration Process Part 3 OF 4 ##########'
        git_clone_demos
        #
        # Installeren Open MediaVault
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 4 OF 4 ##########'
        deb_install_omv
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
        #
        exit 1
    elif [ $actie == "scripts" ]; then
        #
        # DEBIAN OPTIE 10
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
    if [ $actie == "upgrade" ]; then
        #
        #
        # Ubuntu OPTIE 1
        # Alleen upgraden Ubuntu OS
        #
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        echo '########## Configuration Process Part 1 OF 2 ##########'
        maak_directories
        #
        # Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 2 OF 2 ##########'
        ulx_nested_oobe
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
        #
        exit 1
    elif [ $actie == "docker" ]; then
        #
        #
        # Ubuntu OPTIE 2
        # Installeren en Configureren Docker demo omgeving 
        #
        #
        echo '########## Configuration Process Part 1 OF 5 ##########'
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="U24-LTS-S-DKR-001"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        echo '########## Configuration Process Part 2 OF 5 ##########'
        maak_directories
        #
        # Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 3 OF 5 ##########'
        ulx_nested_oobe
        #
        # GitHub Clones maken
        echo '########## Configuration Process Part 4 OF 5 ##########'
        git_clone_demos
        #
        # Debian Ubuntu Docker en Docker omgeving inrichten
        # Moet na de git clone omdat Visual Studio Code Server gebruikt maakt van demos directory
        echo '########## Configuration Process Part 5 OF 5 ##########'
        debulx_nested_docker_complete
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
        #
        exit 1
    elif [ $actie == "podman" ]; then
        #
        #
        # Ubuntu OPTIE 3
        # Installeren en Configureren Docker demo omgeving 
        #
        #
        echo '########## Configuration Process Part 1 OF 5 ##########'
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="U24-LTS-S-PMN-001"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        echo '########## Configuration Process Part 2 OF 5 ##########'
        maak_directories
        #
        # Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 3 OF 5 ##########'
        ulx_nested_oobe
        #
        # GitHub Clones maken
        echo '########## Configuration Process Part 4 OF 5 ##########'
        git_clone_demos
        #
        # Debian Ubuntu Docker en Docker omgeving inrichten
        # Moet na de git clone omdat Visual Studio Code Server gebruikt maakt van demos directory
        echo '########## Configuration Process Part 5 OF 5 ##########'
        debulx_nested_podman_complete
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
        #
        exit 1
    elif [ $actie == "minikube" ]; then
        #
        #
        # Ubuntu OPTIE 4
        # Installeren en Configureren Minikube demo omgeving 
        #
        #
        echo '########## Configuration Process Part 1 OF 7 ##########'
        if [[ "$SUDO_USER" == "ubuntu" || "$SUDO_USER" == "osboxes" ]]; then
            NEW_HOSTNAME="U24-LTS-S-MKC-001"
            hostnamectl set-hostname "$NEW_HOSTNAME"
            sed -i "s/127.0.1.1.*/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
        fi
        #
        # Directories maken
        # Moet eerst omdat LUCT logging directory wordt aangemaakt in deze functie 
        echo '########## Configuration Process Part 2 OF 7 ##########'
        maak_directories
        #
        # Ubuntu zo instellen zoals gewenst
        # Maakt gebruik van LUCT logging directory voor logging van de uitgevoerde functies 
        echo '########## Configuration Process Part 3 OF 7 ##########'
        ulx_nested_oobe
        #
        # GitHub Clones maken
        echo '########## Configuration Process Part 4 OF 7 ##########'
        git_clone_demos
        #
        # Debian Ubuntu Docker en Docker omgeving inrichten
        # Moet na de git clone omdat Visual Studio Code Server gebruikt maakt van demos directory
        echo '########## Configuration Process Part 5 OF 7 ##########'
        debulx_nested_docker_complete
        #
        #
        echo '########## Configuration Process Part 6 OF 7 ##########'
        debulx_install_minikube_compleet
        #
        #
        echo '########## Configuration Process Part 7 OF 7 ##########'
        debulx_config_minikube_docker
        #
        #
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
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
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
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
        #
        #
        if [ $modus == "test" ]; then
            echo 'Voor nu laten alle voorgaande meldingen even staan'
        else
            clear
        fi 
        #
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
        if [ $modus == "test" ]; then
            echo 'Voor nu slaan we een herstart even over'
        else
            shutdown -r now
        fi 
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