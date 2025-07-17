#! /bin/bash
#
#
#
#
# Configuratiescript Linux 
# Versie: 3.2.0 BETA
# ONLY FOR TESTING PURPOSES 
# Author: John Tutert
#
#
#
#
# ######################
# Changelog V1
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
# #######################
# Changelog V2
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
# #######################
# Changelog V3
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
# TO DO
#
# Bestanden in de juiste mappen van demos directory zetten
# VMware virtualisatie geeft nog melding 
# Automatisch reboot aan het einde van het script ?? 
# Netplan
# Ansible DEMO aanpassen
#
#
# ################################################################################
#
# Fase 1 
#
# Controle van de omstandigheden bij de start van het script 
#
# ################################################################################
#
#
#
#
# Controleer execute als sudo
if [ $(id -u) -ne 0 ]; then
    echo "Script NIET gestart met sudo. Start dit script met sudo ubuntu-config-v3-latest.sh [parameter]"
    echo "Script NOT started with sudo. Start this script with sudo ubuntu-config-v3-latest.sh [parameter]"
    exit 1
fi
#
#
# Controleer of er een parameter is meegegeven
#
#
if [ $# -eq 0 ]; then
    echo "No parameter specified. Use 'upgrade' 'docker' 'minikube' 'ansible'."
    echo "Available parameters:"
    echo "upgrade    to update to latest version of distro"
    echo "docker     for installation docker with demo environment"
    echo "minikube   for installation minikube with worker nodes on docker"
    echo "ansible    for demo environment Ansible"
    echo "onderwijs  for demo environment Saxion HBO IT"
    exit 1
fi
#
#
#
#
#
# ################################################################################
#
# Fase 2
#
# Vullen van de variabelen noodzakelijk voor het uitvoeren van dit script
#
# Alle distributies 
#
# ################################################################################
#
#
#
#
# PRETTY_NAME=$(grep -oP '(?<=^PRETTY_NAME=).+' /etc/os-release | tr -d '"')
PRETTY_NAME=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
# NAME=$(grep -oP '(?<=^NAME=).+' /etc/os-release | tr -d '"')
NAME=$(grep '^NAME=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
# VERSION=$(grep -oP '(?<=^VERSION=).+' /etc/os-release | tr -d '"')
VERSION=$(grep '^VERSION=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
# VERSION_ID=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
VERSION_ID=$(grep '^VERSION_ID=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
# VERSION_CODENAME=$(grep -oP '(?<=^VERSION_CODENAME=).+' /etc/os-release | tr -d '"')
VERSION_CODENAME=$(grep '^VERSION_CODENAME=' /etc/os-release | cut -d= -f2 | sed 's/"//g')
#
#
hostname=$(hostname) 
#
#
GH_JATUTERT_RAW="raw.githubusercontent.com/jatutert"
GH_JATUTERT_DEMO_ANSIBLE_VM="demos/main/Ansible/Guest"
#
#
#
#
# ################################################################################
#
# Fase 3
#
# DECLARATIE SPECIFIEKE DISTRIBUTIE FUNCTIES 
#
# ################################################################################
#
#
#
#
# ################################################################################
#
# Fase 3A
#
# FUNCTIONS
#
# ALPINE LINUX
#
# ################################################################################
#
#
# 3A Function Alpine Bijwerken
#
function alx_update_os () {
    apk update -q
    apk upgrade -q
    apk fix -d -q
    apk add open-vm-tools 
}
#
# 3A Function Alpine VM Tools Installatie 
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
# Fase 3B
#
# FUNCTIONS
#
# BuildRoot (Minikube VM) LINUX
#
# ################################################################################
#
#
# 3B Function BuildRoot Docker Compose Installation 
#
function build_install_compose () {
    #
    mkdir -p /home/docker/.docker/cli-plugins
    curl -s -SL https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-linux-x86_64 -o /home/docker/.docker/cli-plugins/docker-compose
    chmod a+x /home/docker/.docker/cli-plugins/docker-compose
    #
    # DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker} 
    # mkdir -p $DOCKER_CONFIG/cli-plugins
    # curl -s -SL https://github.com/docker/compose/releases/download/v2.26.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    # chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
}
#
# 3B Function BuildRoot BASH Configuratie Settings 
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
# Fase 3D
#
# FUNCTIONS
#
# Debian LINUX
#
# ################################################################################
#
#
# 3D Function Debian Bijwerken
#
function dbn_update_os () {
    apk update -qq
    apk upgrade -qq -y 
    apk add open-vm-tools 
}
#
# 3D Function Debian VM Tools Installatie 
#
function dbn_vm_tools () {
    apk add open-vm-tools 
}
#
#
# ################################################################################
#
# Fase 3U
#
# FUNCTIONS
#
# UBUNTU LINUX
#
# ################################################################################
#
#
# 3U1 CATEGORIE UBUNTU OS FUNCTIES
#
#
# 3U11 UBUNTU OS FUNCTIES ## Functie Change Repo Ubuntu
#      Ubuntu Basis Config
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
        #
        # Optie 1 Kernel.org
        #
        if grep -q "mirrors.edge.kernel.org" /etc/apt/sources.list.d/ubuntu.sources; then
            sed "s@mirrors.edge.kernel.org@nl.archive.ubuntu.com@" -i /etc/apt/sources.list.d/ubuntu.sources
        else
            # Replace the value with nl.archive.ubuntu.com
            echo "Mirrors.edge.kernel.org is not an active repository and thus no action taken"
        fi
        #
        # Optie 2 archive.ubuntu.com
        #
        # Archive.Ubuntu.com instellen als bron 
        if grep -q "http://archive.ubuntu.com" /etc/apt/sources.list.d/ubuntu.sources; then
            echo "Ubuntu Repository staat al op Algemeen"
        else
            # Vervang elke landcode voor archive.ubuntu.com naar archive.ubuntu.com
            sed "s@http://es.archive.ubuntu.com@http://archive.ubuntu.com@" -i /etc/apt/sources.list.d/ubuntu.sources
            sed "s@http://gb.archive.ubuntu.com@http://archive.ubuntu.com@" -i /etc/apt/sources.list.d/ubuntu.sources
            sed "s@http://id.archive.ubuntu.com@http://archive.ubuntu.com@" -i /etc/apt/sources.list.d/ubuntu.sources
            sed "s@http://in.archive.ubuntu.com@http://archive.ubuntu.com@" -i /etc/apt/sources.list.d/ubuntu.sources
            sed "s@http://jp.archive.ubuntu.com@http://archive.ubuntu.com@" -i /etc/apt/sources.list.d/ubuntu.sources
            sed "s@http://mx.archive.ubuntu.com@http://archive.ubuntu.com@" -i /etc/apt/sources.list.d/ubuntu.sources
            sed "s@http://us.archive.ubuntu.com@http://archive.ubuntu.com@" -i /etc/apt/sources.list.d/ubuntu.sources
        fi
        #
        # archive.ubuntu.com vervangen door NL bron  
        #
        # standaard is BIT BV dit is nl.archive.ubuntu.com
        #
        # Lijst beschikbaar op
        # https://launchpad.net/ubuntu/+archivemirrors
        #
        if grep -q "http://nl.archive.ubuntu.com" /etc/apt/sources.list.d/ubuntu.sources; then
            echo "Ubuntu Repository staat al op Nederlands"
        else
            # Stel DataPacket in als Bron  
            sed "s@http://archive.ubuntu.com@http://mirror.nl.datapacket.com/ubuntu/@" -i /etc/apt/sources.list.d/ubuntu.sources
            # sed "s@http://archive.ubuntu.com@http://nl.archive.ubuntu.com@" -i /etc/apt/sources.list.d/ubuntu.sources
        fi
        #
    fi
}
#
#
# 3U12 UBUNTU OS FUNCTIES ## Functie Update Ubuntu OS 
#
#
function ulx_os_update_apt () {
    apt update -qq > /dev/null 2>&1
}
#
#
# 3U13 UBUNTU OS FUNCTIES ## Functie Upgrade Ubuntu OS 
#
#
function ulx_os_upgrade_os () {
    apt update -qq > /dev/null 2>&1
    apt upgrade -qq -y > /dev/null 2>&1
    apt autoremove -qq -y > /dev/null 2>&1
}
#
#
# 3U14 UBUNTU OS FUNCTIES ## Functie Change Timezone OS 
#      Ubuntu Basis Config 
#
#
function ulx_os_config_timezone () {
    timedatectl set-timezone Europe/Amsterdam
}
#
# 3U15 UBUNTU OS FUNCTIES ## Functie NIC Config OS
#
function ulx_os_netplan_download () {
    #
    #
    mkdir -p /home/$SUDO_USER/netplan
    #
    # Ansible demo
    #
    # Controller
    # VMNet4
    # 10.1.10.50
    #
    if [ $hostname == "U24-LTS-S-B-GC-LAC1" ] ; then
        curl -s -o /home/$SUDO_USER/netplan/iacam-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Guest/Ubuntu/Netplan/eth/fixed/sec-nic-eth-01-netcfg-dhcp-dns-iacam.yaml
    fi
    #
    # Ansible demo 
    #
    # Slave 1 
    # VMNet4
    # 10.1.10.60
    #
    if [ $hostname == "U24-LTS-S-B-GC-LAS1" ] ; then
        curl -s -o /home/$SUDO_USER/netplan/iacas-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Guest/Ubuntu/Netplan/eth/fixed/sec-nic-eth-01-netcfg-dhcp-dns-iacas.yaml
    fi
    #
    # Ansible demo 
    #
    # Slave 2 
    # VMNet4
    # 10.1.10.61
    #
    if [ $hostname == "U24-LTS-S-B-GC-LAS2" ] ; then
        curl -s -o /home/$SUDO_USER/netplan/iacas-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Guest/Ubuntu/Netplan/eth/fixed/sec-nic-eth-01-netcfg-dhcp-dns-iacas.yaml
    fi
    # 
    # Docker Demo
    #
    # Controller 
    # VMNet 4
    # 10.1.10.70
    #
    if [ $hostname == "U24-LTS-S-B-GR-LDD1" ] ; then
        curl -s -o /home/$SUDO_USER/netplan/dckr-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/Docker/Guest/Ubuntu/Netplan/eth/fixed/sec-nic-eth-01-netcfg-dhcp-dns-dckr.yaml
    fi
    # 
    # Kubernetes Demo
    #
    # Controller 
    # VMNet 4
    # 10.1.10.80
    #
    if [ $hostname == "U24-LTS-S-B-GR-LDD1" ] ; then
        curl -s -o /home/$SUDO_USER/netplan/dckr-netcfg.yaml https://raw.githubusercontent.com/jatutert/demos/main/Docker/Guest/Ubuntu/Netplan/eth/fixed/sec-nic-eth-01-netcfg-dhcp-dns-dckr.yaml
    fi
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
# 3U16 UBUNTU OS FUNCTIES ## Functie Change DNS OS
#
function ulx_os_config_dns () {
#
# Niet uitvoeren na ulx_os_nic_config daar zit namelijk al in 
#
    sed "s@4.2.2.1@145.76.2.75@" -i /etc/netplan/01-netcfg.yaml
    sed "s@4.2.2.2@145.76.2.85@" -i /etc/netplan/01-netcfg.yaml
    sed "s@208.67.220.220@145.2.14.10, 8.8.8.8, 8.8.4.4@" -i /etc/netplan/01-netcfg.yaml
    netplan apply 
}
#
# 3U17 UBUNTU OS FUNCTIES ## GNOME GUI Install 
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
# 3U21 UBUNTU OS Install Software Functies ## Functie Installatie OS Open VM Tools
#
#
function ulx_install_vm_tools () {
    apt install dmidecode -y
    if sudo dmidecode | grep -iq vmware; then
        echo "VMware-omgeving gedetecteerd."
        apt install -qq -y open-vm-tools > /dev/null 2>&1
        mkdir -p /mnt/hgfs
        chmod 2777 /mnt/hgfs
        mount -t fuse.vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other
    else
        echo "Geen VMware-omgeving gedetecteerd."
    fi
}
#
#
# 3U22 UBUNTU OS Install Software Functies ## Functie Installatie OS Powershell
#
#
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.4
#
# Starten met pwsh commando
#
function ulx_install_pwrshell () {
    #
    # Manier 6
    #
    # https://learn.microsoft.com/nl-nl/powershell/scripting/install/install-ubuntu?view=powershell-7.5
    apt update
    apt install -y wget apt-transport-https software-properties-common
    source /etc/os-release
    wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
    dpkg -i packages-microsoft-prod.deb
    apt update
    apt install -y powershell
}
#
#
# 3U23 UBUNTU OS Install Software Functies ## Functie Installatie OS Python
#
#
function ulx_install_python3 () {
    #
    apt install python3
    ln -s /usr/bin/python3 /usr/local/bin/python
}
#
#
# 3U24 UBUNTU OS Install Software Functies ## Functie Installatie OS Cockpit
#
#
function ulx_install_cockpit () {
    apt install -qq -y cockpit > /dev/null 2>&1
    systemctl enable --now cockpit.socket
    rm -f /tmp/listen.conf
    echo '[Socket]' > /tmp/listen.conf
    echo 'ListenStream=' >> /tmp/listen.conf
    echo 'ListenStream=1234' >> /tmp/listen.conf
    mkdir -p /etc/systemd/system/cockpit.socket.d/
    cp /tmp/listen.conf /etc/systemd/system/cockpit.socket.d
    systemctl daemon-reload
    systemctl restart cockpit.socket
}
#
#
# 3U25 UBUNTU OS Install Software Functies ## Functie Installatie Docker
#
#
function ulx_install_docker () {
    # Check if Docker is installed
    if ! [ -x "$(command -v docker)" ]; then
        echo 'Docker is not installed. Installing Docker...' >&2
        # ChatGPT curl -fsSL https://get.docker.com -o get-docker.sh
        # ChatGPT sudo sh get-docker.sh
        apt install -y curl apt-transport-https
        apt purge -qq -y lxc-docker* || true
        curl -sSL https://get.docker.com/ | sh
        service docker start
        usermod -a -G docker $SUDO_USER
    else
        echo 'Docker is already installed.'
    fi
}
#
#
# 3U26 UBUNTU OS Install Software Functies ## Functie Installatie Docker Compose Nieuwste versie  
#
#
function ulx_install_docker_compose () {
    #
    set -e
    #
    # echo "Controleren of Docker is geïnstalleerd..."
    if ! command -v docker &> /dev/null; then
        echo "Docker is niet aanwezig en daarom kan Compose Plugin NIET toegevoegd worden"
        exit 1
    fi
    #
    # echo "Docker is geïnstalleerd."
    # Maak de plugin directory aan als die nog niet bestaat
    PLUGIN_DIR="/usr/local/lib/docker/cli-plugins"
    mkdir -p "$PLUGIN_DIR"
    #
    # echo "Downloaden van Docker Compose plugin..."
    curl -s -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64" -o "$PLUGIN_DIR/docker-compose"
    #
    # echo "Rechten instellen..."
    chmod +x "$PLUGIN_DIR/docker-compose"
    echo "Docker Compose plugin geïnstalleerd op: $PLUGIN_DIR/docker-compose"
    #
    # echo "Controleren of Docker Compose werkt..."
    # docker compose version
}
#
#
# 3U27 UBUNTU OS Install Software Functies ## Functie Installatie Podman
#
#
function ulx_install_podman () {
    # Check if Docker is installed
    if ! [ -x "$(command -v podman)" ]; then
        echo 'Podman is not installed. Installing Podman...' >&2
        apt install -y podman
        service podman start 
        # sudo systemctl start podman.socket = alternatief voor service podman start
        #
        # usermod -a -G docker $SUDO_USER
    else
        echo 'Podman is already installed.'
    fi
}
#
#
# 3U28 UBUNTU OS Install Software Functies ## Functie Installatie IAC Ansible
#
#
function ulx_install_ansible () {
    #
    # STAP 0 Bijwerken Ubuntu 
    #
    # Configuratie 
    echo "Step 1 of 3 Making Preperations"
    ulx_os_config_timezone
    ulx_os_netplan_download
    ulx_os_change_repo_nl
    ulx_os_update_apt
    # Bijwerken 
    echo "Step 2 of 3 Upgrading OS"
    ulx_os_upgrade_os
    # Installatie 
    echo "Step 3 of 3 Installing OS Tools"
    ulx_install_vm_tools
    ulx_install_pwrshell
    ulx_install_cockpit
    #
    # Haal de hostname op
    hostname=$(hostname)
    #
    # Hostname ulx-s-2204-L-A-001 is Ansible Controller 
    if [ "$hostname" == "U24-LTS-S-B-GC-LAC1" ]; then
        #
        #
        #
        #
        # MASTER
        # ######
        #
        #
        #
        # STAP 1
        # Ansible toevoegen aan repository
        #
        # 1A Ansible Repo toevoegen 
        apt-add-repository ppa:ansible/ansible -y > /dev/null 2>&1
        # 1B Updaten APT
        apt update -qq
        #
        # STAP 2
        # Installatie Ansible Controller
        #
        apt install ansible -y > /dev/null 2>&1
        #
        # Stap 3
        # Installatie SSHPASS
        # 
        # Starten installatie sshpass
        apt update -qq
        apt install sshpass -y
        #
        # STAP 4
        # Aanpassen etc hosts bestand
        #
        # 4a vullen variable hostname
        hostname=$(hostname)
        # 4b Haal het IP-adres van eth1 op
        eth1_ip=$(ip addr show eth1 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
        # 4c Voeg 1 toe aan het IP-adres van eth1
        IFS=. read -r a b c d <<< "$eth1_ip"
        eth1_plus1_ip="$a.$b.$c.$((d+1))"
        # 4d Sla de IP-adressen op in afzonderlijke variabelen
        eth1_ip_var="eth1_ip=$eth1_ip"
        eth1_plus1_ip_var="eth1_plus1_ip=$eth1_plus1_ip"
        # 4e Aanpassen hosts bestand 
        if grep -q "$eth1_ip" /etc/hosts; then
            echo "$hostname already exists in /etc/hosts"
        else
            # Add the hostname and IP address to /etc/hosts
            echo "$eth1_ip ansible_demo_ctrl_001" | sudo tee -a /etc/hosts > /dev/null
            echo "$eth1_plus1_ip ansible_demo_host_001" | sudo tee -a /etc/hosts > /dev/null
            echo "Hostname $hostname added to /etc/hosts"
        fi
        #
        #
        # STAP 5
        # Inventory ophalen van GitHUB
        mkdir -p /etc/ansible/inventory 
        #
        #
        # TO DO
        #
        # GH_JATUTERT_RAW variable nog werken
        #
        curl -s -o /etc/ansible/inventory/ansible_demo     https://$GH_JATUTERT_RAW/demos/main/Ansible/Guest/Inventory/ansible_demo_12aug24
        # curl -s -o /etc/ansible/inventory/db_servers     https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Inventory/Old/db_servers
        # curl -s -o /etc/ansible/inventory/load_balancers https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Inventory/Old/load_balancers
        # curl -s -o /etc/ansible/inventory/webservers     https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Inventory/Old/webservers
        # curl -s -o /etc/ansible/inventory/werkstations   https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Inventory/Old/werkstations
        #
        # STAP 6
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
        # STAP 7
        # Playbooks ophalen van GitHUB
        mkdir -p /home/$SUDO_USER/playbooks
        chown -f -R $SUDO_USER /home/$SUDO_USER/playbooks
        curl -s -o /home/$SUDO_USER/playbooks/ansible_demo_playbook.yml https://$GH_JATUTERT_RAW/demos/main/Ansible/Guest/Playbooks/Linux/ansible_demo_playbook.yml
        #
        # STAP 8
        # SSH verbinden script maken 
        # Uitvoeren als user Vagrant en niet als Root anders krijg je SSH foutmelding bij Ansible 
        echo "Stap 7 - SSH Verbindingsscript maken gestart ..."
        echo 'echo Uitvoeren als user Vagrant en niet als Root' > /home/$SUDO_USER/ansible_host_ssh.sh
        echo 'sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@ulx-s-2204-l-a-010' > /home/$SUDO_USER/ansible_host_ssh.sh 
        chmod +x /home/$SUDO_USER/ansible_host_ssh.sh
    fi
    #
    #
    #
    #
    if [ "$hostname" == "U24-LTS-S-B-GC-LAS1" ]; then
        #
        #
        #
        #
        # SLAVE
        # ######
        #
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
    fi
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
    semaphore user add --admin --login labadmin --name=LABAdmin --email=labadmin@labadmin.local --password=labadmin
    semaphore user add --admin --login vagrant  --name=vagrant  --email=vagrant@vagrant.local   --password=vagrant
    snap start semaphore
    # Aanpassen standaard poort 3000 naar 4444
    snap set semaphore port=4444
    # Herstarten com nieuwe poort actief te maken
    snap restart semaphore
}

#
#
# 3U30 UBUNTU OS Install Software Functies ## Functie Jenkins
#
#
function ulx_install_jenkins () {

    # Add Jenkins repository key
    curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

    # Add Jenkins repository
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

    # Install Jenkins
    apt update
    apt install -y jenkins

    # Start and enable Jenkins
    systemctl enable jenkins
    systemctl start jenkins

    # Get initial admin password
    cat /var/lib/jenkins/secrets/initialAdminPassword

    # Jenkins is hierna bereikbaar via ip adres van de vm met ip poort 8000
    # Als wachtwoord moet je wachtwoord uit initialAdminPassword zoals hierboven invoeren 
} 

#
#
# 3U31 UBUNTU OS Install Software Functies ## Functie Configuratie Jenkins voor Docker
#
#
function ulx_jenkins_docker () {

    # Add jenkins user to docker group
    usermod -aG docker jenkins

    # Restart Jenkins
    systemctl restart jenkins

} 

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
    # Operating Systems 
    docker pull -q alpine:latest > /dev/null 2>&1
    # Alpine 3.5 tbv Flask demo
    docker pull -q alpine:3.5 > /dev/null 2>&1
    docker pull -q amazonlinux:latest > /dev/null 2>&1
    # Bash is eigenlijk Alpine Linux Image 
    docker pull -q bash:latest > /dev/null 2>&1
    docker pull -q ubuntu/apache2:latest > /dev/null 2>&1
    docker pull -q clearlinux:latest > /dev/null 2>&1
    # docker pull -q debian:latest > /dev/null 2>&1
    # docker pull -q ubuntu:20.04 > /dev/null 2>&1
    # docker pull -q ubuntu:22.04 > /dev/null 2>&1
    # Middleware
    # docker pull -q registry > /dev/null 2>&1
    # docker pull mariadb:10.6
    # docker pull minio/minio
    # docker pull nextcloud
    docker pull -q nginx > /dev/null 2>&1
    # docker pull postgres:latest
    # docker pull wordpress
    #
    # demo
    docker pull -q prakhar1989/static-site
}
#
#
#
# 3U42 UBUNTU UBUNTU OS Podman Software Functies ## Images Pull
#
#
function ulx_podman_images_pull () {
    #
    # Script wordt uitgevoerd als sudo en daarom wordt functie ook gedaan sudo
    #
    # docker pull -q hello-world > /dev/null 2>&1
    #
    # Operating Systems 
    podman pull -q alpine:latest > /dev/null 2>&1
    # Alpine 3.5 tbv Flask demo
    podman pull -q alpine:3.5 > /dev/null 2>&1
    podman pull -q amazonlinux:latest > /dev/null 2>&1
    # Bash is eigenlijk Alpine Linux Image 
    podman pull -q bash:latest > /dev/null 2>&1
    podman pull -q ubuntu/apache2:latest > /dev/null 2>&1
    podman pull -q clearlinux:latest > /dev/null 2>&1
    # docker pull -q debian:latest > /dev/null 2>&1
    # docker pull -q ubuntu:20.04 > /dev/null 2>&1
    # docker pull -q ubuntu:22.04 > /dev/null 2>&1
    # Middleware
    # docker pull -q registry > /dev/null 2>&1
    # docker pull mariadb:10.6
    # docker pull minio/minio
    # docker pull nextcloud
    podman pull -q nginx > /dev/null 2>&1
    # docker pull postgres:latest
    # docker pull wordpress
    #
    # demo
    podman pull -q prakhar1989/static-site
}
#
#
# UBUNTU UBUNTU OS DOCKER Software Functies ## Minikube
#
#
function ulx_docker_minikube_init () {

    #
    # Docker moet wel er zijn voor minikube !!! 
    #
    # Check if Docker is installed
    #
    if ! [ -x "$(command -v docker)" ]; then
        echo 'Commando DOCKER geeft GEEN resultaat' >&2
        # Installatie DOCKER-CE 
        # Call the function to install Docker
        ulx_install_docker
    fi
    # Docker is installed 
    #
    # Installatie Minikube 
    if ! [ -x "$(command -v minikube)" ]; then
        echo 'Minikube niet aangetroffen. Installatie gestart ...' >&2
        curl -s -o /tmp/minikube_latest_amd64.deb https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
        dpkg -i /tmp/minikube_latest_amd64.deb > /dev/null 2>&1
        rm /tmp/minikube_latest_amd64.deb
    fi 
    #
    # Installatie kubeadm
    #
    if ! [ -x "$(command -v kubeadm)" ]; then
        # snap install kubeadm --classic --channel=latest > /dev/null 2>&1
        snap install kubeadm --classic --channel=latest
    fi
    #
    # Installatie kubectl 
    #
    if ! [ -x "$(command -v kubectl)" ]; then
        curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        chmod +x kubectl
        mv kubectl /usr/local/bin/
        kubectl version --client
        # # snap install kubectl --classic --channel=latest > /dev/null 2>&1
        # snap install kubectl --classic --channel=latest
    fi
    #
}
#
#
# UBUNTU UBUNTU OS DOCKER Software Functies ## Minikube CONFIG 
#
#
function ulx_docker_minikube_config () {
    echo "ram=\$(free --mega | grep 'Mem' | awk '{print \$7/4}')" > /home/$SUDO_USER/scripts/minikube/minik8s_config.sh
    echo "minikube config set memory \$ram" >> /home/$SUDO_USER/scripts/minikube/minik8s_config.sh 
    echo "cpu_aantal=\$(nproc)" >> /home/$SUDO_USER/scripts/minikube/minik8s_config.sh
    echo "minikube config set cpus \$cpu_aantal" >> /home/$SUDO_USER/scripts/minikube/minik8s_config.sh
    echo "minikube config set driver docker" >> /home/$SUDO_USER/scripts/minikube/minik8s_config.sh
    echo "minikube config view" >> /home/$SUDO_USER/scripts/minikube/minik8s_config.sh
}
#
#
# UBUNTU UBUNTU OS DOCKER Software Functies ## Portainer Create  
#
#
function ulx_docker_portainer_create () {
    docker pull -q portainer/portainer-ce:latest > /dev/null 2>&1
    docker volume create portainer_data          > /dev/null 2>&1
    docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
    #
    echo '#! /bin/bash'                                         > /home/$SUDO_USER/portainer_restart.sh
    echo 'docker stop portainer'                               >> /home/$SUDO_USER/portainer_restart.sh
    echo 'docker start portainer'                              >> /home/$SUDO_USER/portainer_restart.sh
    echo 'ip addr show eth0'                                   >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo "Portainer is available on port 9443"'          >> /home/$SUDO_USER/portainer_restart.sh
    echo 'echo "Create user admin with password password1234"' >> /home/$SUDO_USER/portainer_restart.sh
    chmod +x /home/$SUDO_USER/portainer_restart.sh 
}
#
#
# UBUNTU UBUNTU OS DOCKER Software Functies ## Portainer Remove
#
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
# 3U5 CATEGORIE UBUNTU OS Maak Scripts Functies 
#
#
# 3U51 UBUNTU OS Maak Scripts Functies | Maak Docker Scripts functies
#
#
#
function ulx_maak_docker_scripts () {
    #
    # Docker-CE images ophalen script maken
    #
    echo '#! /bin/bash'       > /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    # Hello World
    # echo 'docker pull hello-world > /dev/null 2>&1'  >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    # echo echo Hello World    >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    # Operating Systems 
    echo echo Alpine Linux                           >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull alpine > /dev/null 2>&1'       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo echo Debian Linux                           >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull debian > /dev/null 2>&1'       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo echo Ubuntu 20 04 LTS                       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull ubuntu:20.04 > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    # Docker Services
    #
    echo echo Registry       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull registry > /dev/null 2>&1'     >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    # General Services
    #
    echo echo prakhar1989 static-site                >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull prakhar1989/static-site > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #	
    echo echo MariaDB DBMS   >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull mariadb:10.6 > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    # echo echo MinIO          >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    # echo 'docker pull minio/minio > /dev/null 2>&1'  >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    echo echo NextCloud      >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull nextcloud > /dev/null 2>&1'    >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    echo echo NGNINX         >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull nginx > /dev/null 2>&1'        >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    # echo echo ODOO ERP       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    # echo 'docker pull odoo:latest > /dev/null 2>&1'  >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    echo echo Postgress DBMS >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull postgres:latest > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    echo echo WordPress      >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull wordpress > /dev/null 2>&1'    >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    chmod +x /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    #
    #
    #
    # Docker-CE demo Alpine script maken
    echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
    echo 'clear' >> /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
    echo 'docker run -it alpine /bin/sh' >> /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
    chmod +x /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
    #
    #
    #
    #
    # Docker-CE demo Minio Script maken 
    echo '#! /bin/bash' > /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
    echo '#' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
    echo '# Minio Object Storage on Docker' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
    echo 'docker run -d -p 9000:9000 -p 9001:9001 -p 9090:9090 --name minio -v /home/$USER/data/minio:/data -e "MINIO_ROOT_USER=minio1234" -e "MINIO_ROOT_PASSWORD=minio1234" minio/minio server /data --console-address ":9001"' >>/home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
    echo 'echo MINIO_ROOT_USER=minio1234' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
    echo 'echo MINIO_ROOT_PASSWORD=minio1234' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
    chmod +x /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
}
#
# UBUNTU Maak Scripts DOCKER Voorbeelden
#
function ulx_maak_docker_voorbeelden () {
    #
    #
    # TO DO
    #
    # RESULTAAT VERPLAATSEN NAAR NIEUWE DIRECTORY STRUCTUUR
    #
    # 
    # VOORBEELD ## Dockerfile uit slides van lesweek 4 module virtualisatie 
    echo '# start with OS ubuntu' > /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo 'FROM ubuntu:latest' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo 'RUN apt-get update' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo 'RUN apt-get -y upgrade' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo '# install apache2 in noninteractivemode' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo 'RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo '# copy website' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo 'COPY index.html /var/www/html/' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo '# start webserver' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo 'CMD /usr/sbin/apache2ctl -D FOREGROUND' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo '# expose port 80' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    echo 'EXPOSE 80' >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file
    #
    echo "#! /bin/bash" > /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-build.sh
    echo "docker build –f /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-file -t ubtu-apache:V100 ." >> /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-build.sh
    chmod +x /home/$SUDO_USER/docker/apache/ubtu-apache-dkr-build.sh
    #
    # VOORBEELD ## FLASK demo
    # Default demo dockerfile
    # https://hackmd.io/@pmanzoni/r1uWcTqfU
    #
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file
    #
    # 23 augustus 2024 Helemaal zelfstandige dockerfile dat app.py en index.html van github haalt ipv copy 
    curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-V2
    #
    # Meerdere talen demo dockerfiles 
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-de https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-de
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-fr https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-fr
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-it https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-it
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-nl https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-nl
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-uk https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-uk
    #
    # Python Script
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/app.py https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/app.py
    #
    # Default index.html
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/templates/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index.html
    #
    # Meerdere talen demo index.html 
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/deutsch/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-deutsch.html
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/english/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-english.html
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/francais/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-francais.html
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/italiano/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-italiano.html
    # curl -s -o /home/$SUDO_USER/docker/flask-demo/nederlands/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-nederlands.html
    #
    curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-image-build.sh https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-image-build.sh
    curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-run.sh https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-run.sh
    #
    chmod +x /home/$SUDO_USER/docker/flask-demo/flask-image-build.sh
    chmod +x /home/$SUDO_USER/docker/flask-demo/flask-demo-run.sh
    #
}
#
# UBUNTU Maak Scripts DOCKER COMPOSE
#
#
# UBUNTU Maak Scripts DOCKER COMPOSE Demos
#
#
# Veel demos zijn te vinden op
# https://github.com/docker/awesome-compose
#
#
function ulx_maak_compose_scripts () {
    #
    #
    # TO DO
    #
    # RESULTAAT VERPLAATSEN NAAR NIEUWE DIRECTORY STRUCTUUR
    #
    # 
    #
    # Docker Compose demo script NextCloud
    echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
    echo '#' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
    echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
    echo 'clear' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
    echo 'docker compose -f /home/$USER/yaml/docker-compose/nextcloud/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
    echo 'echo NextCloud port 8888'	>> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
    chmod +x /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
    #
    # Docker Compose demo script ODOO
    echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
    echo '#'>> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
    echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
    echo 'clear' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
    echo 'docker compose -f /home/$USER/yaml/docker-compose/odoo/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
    echo 'echo Odoo port 10016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
    echo 'echo Chat port 20016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
    chmod +x /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
}
#
# UBUNTU Maak Scripts DOCKER COMPOSE Demos Voorbeelden
#
function ulx_maak_compose_voorbeelden () {
    #
    #
    # TO DO
    #
    # RESULTAAT VERPLAATSEN NAAR NIEUWE DIRECTORY STRUCTUUR
    #
    # 
    #
    # DOCKER COMPOSE YAML JTU bestanden ophalen
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/nextcloud/docker-compose.yml https://raw.githubusercontent.com/jatutert/demos/refs/heads/main/Docker/Compose-Plugin-Docker/YAML/NextCloud/docker-compose-nextcloud-vagrant.yml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/odoo/docker-compose.yml      https://raw.githubusercontent.com/jatutert/demos/refs/heads/main/Docker/Compose-Plugin-Docker/YAML/Odoo/docker-compose-odoo-vagrant.yml  
    # DOCKER COMPOSE YAML awesome compose YAML bestanden ophalen
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/prometheus-grafana/prometheus-grafana.yml https://raw.githubusercontent.com/docker/awesome-compose/master/prometheus-grafana/compose.yaml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/nextcloud/nextcloud-redis-mariadb.yml     https://raw.githubusercontent.com/docker/awesome-compose/master/nextcloud-redis-mariadb/compose.yaml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/nginx/nginx-flask-mysql.yml               https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mysql/compose.yaml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/nginx/nginx-flask-mongo.yml               https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mongo/compose.yaml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/wordpress/wordpress-mysql.yml             https://raw.githubusercontent.com/docker/awesome-compose/master/wordpress-mysql/compose.yaml
}
#
# UBUNTU Maak Scripts Minikube Demos Voorbeelden
#
function ulx_maak_minikube_voorbeelden () {
    #
    #
    # TO DO
    #
    # RESULTAAT VERPLAATSEN NAAR NIEUWE DIRECTORY STRUCTUUR
    #
    # 
    #
    #
    # Kubernetes MicroK8S Minikube demo simple deployment NGINX
    echo '#! /bin/bash'                                 > /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    echo '#'                                           >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    echo 'cd /home/$USER'                              >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    echo 'clear'                                       >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    echo 'kubectl create deployment nginx-webserver --image=nginx' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    echo 'kubectl expose deployment nginx-webserver --type="NodePort" --port 80' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    echo 'kubectl describe deployment nginx-webserver' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    echo 'kubectl get svc nginx-webserver'             >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    echo 'minikube service --all'                      >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    chmod +x /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
    #
    # Kubernetes MicroK8S Minikube demo deployment NGINX stap 1
    # Stap 1 is deployment van omgeving met NGINX versie 14
    echo '#! /bin/bash'                                  > /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    echo '#'                                            >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    echo 'cd /home/$USER'                               >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    echo 'clear'                                        >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    echo "echo 'Stap 1 Deployment NGINX versie 14 gestart ...'" >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment.yml' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    echo 'kubectl expose deployment nginx-deployment --type=NodePort --port=8080' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    echo 'kubectl get pods -l app=nginx'                >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    echo 'minikube service --all'                       >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    chmod +x /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
    #
    # Kubernetes MicroK8S Minikube demo deployment NGINX stap 2
    # Stap 2 is updaten van NGINX van versie 14 naar versie 16
    echo '#! /bin/bash'                                  > /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    echo '#'                                            >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    echo 'cd /home/$USER'                               >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    echo 'clear'                                        >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    echo "echo 'Stap 2 Updaten NGiNX van versie 14 naar versie 16 gestart ...'" >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment-update.yml' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    echo 'kubectl get pods -l app=nginx'                >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    echo 'minikube service --all'                       >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    chmod +x /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
    #
    # Kubernetes MicroK8S Minikube demo deployment NGINX stap 3
    # Stap 3 is replicatecount van 2 naar 4 bijwerken 
    echo '#! /bin/bash'                                  > /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
    echo 'cd /home/$USER'                               >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
    echo 'clear'                                        >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
    echo "echo 'Stap 3 Aanpassen aantal replicas van 2 naar 4 gestart ...'" >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
    echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment-scale.yaml' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
    echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
    echo 'kubectl get pods -l app=nginx'                >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
    echo 'minikube service --all'                       >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
    chmod +x /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
    #
    # Kubernetes MicroK8S Minikube demo MySQL 
    # mysql-pv is persistant volume
    # mysql-deployment is deployment van mysql met gebruik van persistant volume claim 
    echo '#! /bin/bash'                                  > /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
    echo 'cd /home/$USER'                               >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
    echo 'clear'                                        >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
    echo 'kubectl apply -f /home/$USER/yaml/kubernetes/mysql/mysql-pv.yaml' >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
    echo 'kubectl apply -f /home/$USER/yaml/kubernetes/mysql/mysql-deployment.yaml' >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
    echo 'kubectl describe deployment mysql'            >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
    echo 'kubectl describe pvc mysql-pv-claim'          >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
    echo 'kubectl get pods -l app=mysql'                >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
    chmod +x /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
    # K8S IO website demos
    # MySQL 
    curl -s -o /home/$SUDO_USER/yaml/kubernetes/mysql/mysql-pv.yml          https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/MySQL/mysql-pv.yml
    curl -s -o /home/$SUDO_USER/yanl/kubernetes/mysql/mysql-deployment.yml  https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/MySQL/mysql-deployment.yml
    # NGINX
    curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment.yml        https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/NGINX/deployment.yml
    curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment-scale.yml  https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/NGINX/deployment-scale.yml
    curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment-update.yml https://raw.githubusercontent.com/jatutert/demos/main/Kubernetes/YAML/NGINX/deployment-update.yml
    #
}
#
# 3U6 UBUNTU Maak Scripts Onderwijsmodules
#
#
# 3U61 UBUNTU Maak Scripts Onderwijsmodules Introductie Infrastructuren
#      Configuratie Netwerken
#
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
       apt install git -y
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
function ulx_basis_config () {
    echo "UBUNTU - Step 1 of 3 Making Preperations"
    ulx_os_config_timezone
    maak_directories
    ulx_os_netplan_download
    ulx_os_change_repo_nl
    ulx_os_update_apt
    # Bijwerken 
    echo "UBUNTU - Step 2 of 3 Upgrading OS"
    ulx_os_upgrade_os
    # Installatie 
    echo "UBUNTU - Step 3 of 3 Installing OS Tools"
    ulx_install_vm_tools
    ulx_install_cockpit
    ulx_install_pwrshell
    ulx_install_python3
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
    # if [ ! -d "/home/$SUDO_USER/tmp" ]; then
        mkdir -p /home/$SUDO_USER/tmp
        chown -f -R $SUDO_USER /home/$SUDO_USER/tmp
    # fi 
    #
    #
    # ###########################################################################
    # Structuur 2025
    # ###########################################################################
    #
    #
        mkdir -p /home/$SUDO_USER/demos
        #
        # Docker
        #
            mkdir -p /home/$SUDO_USER/demos/docker
                #
                # Docker Algemeen
                #
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/apache 
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/flask-demo
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/flask-demo/templates 
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/flask-demo/deutsch 
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/flask-demo/english 
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/flask-demo/francais
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/flask-demo/italiano 
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/flask-demo/nederlands 
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/mysql
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/nextcloud
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/nginx
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/odoo
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/portainer
                mkdir -p /home/$SUDO_USER/demos/docker/algemeen/prometheus-grafana
                #
                # Docker Compose
                #
                mkdir -p /home/$SUDO_USER/demos/docker/compose
                #
                # Docker Scripts
                #
                mkdir -p /home/$SUDO_USER/demos/docker/scripts
                    #
                    # Docker Scripts Algemeen
                    #
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/algemeen
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/algemeen/alpine-run
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/algemeen/portainer
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/algemeen/pull-images
                    # 
                    # Docker Scripts Compose
                    #
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/compose
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/compose/mysql
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/compose/nextcloud
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/compose/nginx
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/compose/odoo
                    mkdir -p /home/$SUDO_USER/demos/docker/scripts/compose/prometheus-grafana
        #
        # PodMan
        #
            mkdir -p /home/$SUDO_USER/demos/podman
                #
                # PodMan Algemeen
                #
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/apache 
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/flask-demo
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/flask-demo/templates 
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/flask-demo/deutsch 
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/flask-demo/english 
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/flask-demo/francais
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/flask-demo/italiano 
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/flask-demo/nederlands 
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/mysql
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/nextcloud
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/nginx
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/odoo
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/portainer
                mkdir -p /home/$SUDO_USER/demos/podman/algemeen/prometheus-grafana
                #
                # PodMan Compose
                #
                mkdir -p /home/$SUDO_USER/demos/podman/compose
                #
                # PodMan Scripts
                #
                mkdir -p /home/$SUDO_USER/demos/podman/scripts
                    #
                    # PodMan Scripts Algemeen
                    #
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/algemeen
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/algemeen/alpine-run
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/algemeen/portainer
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/algemeen/pull-images
                    # 
                    # PodMan Scripts Compose
                    #
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/compose
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/compose/mysql
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/compose/nextcloud
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/compose/nginx
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/compose/odoo
                    mkdir -p /home/$SUDO_USER/demos/podman/scripts/compose/prometheus-grafana
        #
        # Kubernetes
        #
            mkdir -p /home/$SUDO_USER/demos/kubernetes
                #
                #  Kubernetes Algemeen 
                #  Algemeen is alleen voor K8S zelf en niet voor applicaties die draaien onder K8S
                #
                mkdir -p /home/$SUDO_USER/demos/kubernetes/algemeen
                mkdir -p /home/$SUDO_USER/demos/kubernetes/algemeen/kubeadm
                mkdir -p /home/$SUDO_USER/demos/kubernetes/algemeen/kubectl
                #
                #  Kubernetes Applicaties 
                #
                mkdir -p /home/$SUDO_USER/demos/kubernetes/applicaties
                    #
                    #  Kubernetes MySQL
                    #
                    mkdir -p /home/$SUDO_USER/demos/kubernetes/applicaties/mysql
                    #
                    #  Kubernetes NextCLOUD
                    #
                    mkdir -p /home/$SUDO_USER/demos/kubernetes/applicaties/nextcloud
                    #
                    #  Kubernetes NGINX
                    #
                    mkdir -p /home/$SUDO_USER/demos/kubernetes/applicaties/nginx
                    #
                    #  Kubernetes Odoo
                    #
                    mkdir -p /home/$SUDO_USER/demos/kubernetes/odoo
                #
                #  Kubernetes Minikube
                #
                mkdir -p /home/$SUDO_USER/demos/kubernetes/minikube
                    #  
                    # Kubernetes Minikube Algemeen
                    #
                    mkdir -p /home/$SUDO_USER/demos/kubernetes/minikube/algemeen
                    #  
                    # Kubernets Minikube Configuratie
                    #
                    mkdir -p /home/$SUDO_USER/demos/kubernetes/minikube/configuratie
                #
                #  Kubernetes Scripts
                #
                mkdir -p /home/$SUDO_USER/demos/kubernetes/scripts

        # rechten met een commando instellen voor alle directories en bestanden
        #
        # min f is silent
        # min R is recursief
        #
        chown -f -R "$SUDO_USER":"$SUDO_USER" /home/$SUDO_USER/demos 

    #
    #
    # ###########################################################################
    # Structuur 2024
    # ###########################################################################
    #
    #

    # if [ ! -d "/home/$SUDO_USER/scripts" ]; then
        mkdir -p /home/$SUDO_USER/scripts
        mkdir -p /home/$SUDO_USER/scripts/gui
        mkdir -p /home/$SUDO_USER/scripts/tmp
        mkdir -p /home/$SUDO_USER/scripts/docker
        mkdir -p /home/$SUDO_USER/scripts/docker/alpine-run
        mkdir -p /home/$SUDO_USER/scripts/docker/portainer
        mkdir -p /home/$SUDO_USER/scripts/docker/pull-images
        mkdir -p /home/$SUDO_USER/scripts/docker-compose
        mkdir -p /home/$SUDO_USER/scripts/docker-compose/mysql
        mkdir -p /home/$SUDO_USER/scripts/docker-compose/nextcloud
        mkdir -p /home/$SUDO_USER/scripts/docker-compose/nginx
        mkdir -p /home/$SUDO_USER/scripts/docker-compose/odoo
        mkdir -p /home/$SUDO_USER/scripts/docker-compose/prometheus-grafana
        mkdir -p /home/$SUDO_USER/scripts/kubernetes
        mkdir -p /home/$SUDO_USER/scripts/minikube
        mkdir -p /home/$SUDO_USER/scripts/minio_scripts
        mkdir -p /home/$SUDO_USER/scripts/intro_infra
        mkdir -p /home/$SUDO_USER/scripts/it-fundmtls
        chown -f -R $SUDO_USER /home/$SUDO_USER/scripts
    # fi
    #
    # if [ ! -d "/home/$SUDO_USER/docker" ]; then
        mkdir -p /home/$SUDO_USER/docker
        mkdir -p /home/$SUDO_USER/docker/apache 
        mkdir -p /home/$SUDO_USER/docker/flask-demo
        mkdir -p /home/$SUDO_USER/docker/flask-demo/templates 
        mkdir -p /home/$SUDO_USER/docker/flask-demo/deutsch 
        mkdir -p /home/$SUDO_USER/docker/flask-demo/english 
        mkdir -p /home/$SUDO_USER/docker/flask-demo/francais
        mkdir -p /home/$SUDO_USER/docker/flask-demo/italiano 
        mkdir -p /home/$SUDO_USER/docker/flask-demo/nederlands 
        mkdir -p /home/$SUDO_USER/docker/mysql
        mkdir -p /home/$SUDO_USER/docker/nextcloud
        mkdir -p /home/$SUDO_USER/docker/nginx
        mkdir -p /home/$SUDO_USER/docker/odoo
        mkdir -p /home/$SUDO_USER/docker/portainer
        mkdir -p /home/$SUDO_USER/docker/prometheus-grafana
        chown -f -R $SUDO_USER /home/$SUDO_USER/docker
    # fi 
    #
    # if [ ! -d "/home/$SUDO_USER/docker-compose" ]; then
        mkdir -p /home/$SUDO_USER/docker-compose
        mkdir -p /home/$SUDO_USER/docker-compose/mysql
        mkdir -p /home/$SUDO_USER/docker-compose/nextcloud
        mkdir -p /home/$SUDO_USER/docker-compose/nginx
        mkdir -p /home/$SUDO_USER/docker-compose/odoo
        mkdir -p /home/$SUDO_USER/docker-compose/prometheus-grafana 
        chown -f -R $SUDO_USER /home/$SUDO_USER/docker-compose
    # fi
    #
    # if [ ! -d "/home/$SUDO_USER/data" ]; then
        mkdir -p /home/$SUDO_USER/data
        mkdir -p /home/$SUDO_USER/data/minio
        mkdir -p /home/$SUDO_USER/data/nextcloud
        mkdir -p /home/$SUDO_USER/data/nextcloud/html
        mkdir -p /home/$SUDO_USER/data/nextcloud/html/data
        mkdir -p /home/$SUDO_USER/data/odoo
        mkdir -p /home/$SUDO_USER/data/odoo/addons
        mkdir -p /home/$SUDO_USER/data/odoo/etc
        mkdir -p /home/$SUDO_USER/data/odoo/postgresql
        chown -f -R $SUDO_USER /home/$SUDO_USER/data
    # fi
    #
    # if [ ! -d "/home/$SUDO_USER/yaml" ]; then
        mkdir -p /home/$SUDO_USER/yaml
        mkdir -p /home/$SUDO_USER/yaml/docker-compose
        mkdir -p /home/$SUDO_USER/yaml/docker-compose/mysql
        mkdir -p /home/$SUDO_USER/yaml/docker-compose/nextcloud
        mkdir -p /home/$SUDO_USER/yaml/docker-compose/nginx
        mkdir -p /home/$SUDO_USER/yaml/docker-compose/odoo
        mkdir -p /home/$SUDO_USER/yaml/docker-compose/prometheus-grafana
        mkdir -p /home/$SUDO_USER/yaml/docker-compose/wordpress
        mkdir -p /home/$SUDO_USER/yaml/kubernetes
        mkdir -p /home/$SUDO_USER/yaml/kubernetes/mysql
        mkdir -p /home/$SUDO_USER/yaml/kubernetes/nextcloud
        mkdir -p /home/$SUDO_USER/yaml/kubernetes/nginx
        mkdir -p /home/$SUDO_USER/yaml/kubernetes/odoo
        mkdir -p /home/$SUDO_USER/yaml/kubernetes/prometheus-grafana
        mkdir -p /home/$SUDO_USER/yaml/kubernetes/wordpress
        chown -f -R $SUDO_USER /home/$SUDO_USER/yaml
    # fi
    #
    # if [ ! -d "/home/$SUDO_USER/k8s-demo" ]; then
        mkdir -p /home/$SUDO_USER/k8s-demo 
        mkdir -p /home/$SUDO_USER/k8s-demo/mysql
        mkdir -p /home/$SUDO_USER/k8s-demo/nextcloud
        mkdir -p /home/$SUDO_USER/k8s-demo/nginx
        mkdir -p /home/$SUDO_USER/k8s-demo/nginx/simple
        mkdir -p /home/$SUDO_USER/k8s-demo/nginx/replicas
        mkdir -p /home/$SUDO_USER/k8s-demo/odoo
        chown -f -R $SUDO_USER /home/$SUDO_USER/k8s-demo
    # fi 
}
#
#
# Function menu 
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
        echo "1. Ubuntu configuratie en bijwerken"
        echo "2. Docker-CE inclusief Compose en demo omgeving"
        echo "3. Minikube op Docker inclusief demo omgeving"
        echo "4. Ansible inclusief demo omgeving"
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
            # UBUNTU OPTIE 1
            #
            echo "Step 1 of 3 Making Preperations"
            ulx_os_config_timezone
            maak_directories
            ulx_os_netplan_download
            ulx_os_change_repo_nl
            ulx_os_update_apt
            # Bijwerken 
            echo "Step 2 of 3 Upgrading OS"
            ulx_os_upgrade_os
            # Installatie 
            echo "Step 3 of 3 Installing OS Tools"
            ulx_install_vm_tools
            ulx_install_pwrshell
            ulx_install_cockpit
            ;;
        2)
            #
            # UBUNTU OPTIE 2
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
            # UBUNTU OPTIE 3
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
            # UBUNTU OPTIE 4
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
#
#
#
#
# ################################################################################
#
# HOOFDPROGRAMMA
#
# ALLE LINUX DISTROS
#
# ################################################################################
#
#
#
#
echo "Linux Universal Configuration Tool (LUCT)"
echo "Version 3.2 Build 25 juni 2025"
echo "    "
echo "Deze BUILD is opzet naar nieuwe manier van werken in dit script"
echo "Script kan daarom niet stabiel zijn"
echo "    "
echo "Created by John Tutert for TutSOFT"
echo "    "
echo "For Personal or Educational use only !"
echo "    "
echo "Currently only Alpine Linux, Ubuntu Linux, Ubuntu Linux (WSL2) and BuildRoot(MiniKube VM) are supported"
echo "Debian is planned for future release"
echo "    "
echo "This version is a BETA version ! So not everything is tested by me ..."
echo "    "
#
#
#
#
distro=$(echo "$NAME" | tr '[:upper:]' '[:lower:]')
#
#
# ALPINE
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
# Minikube VM
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
        echo "Step 1 of 6 Configure Operating System"
        ulx_os_config_timezone
        build_bash_config
        echo "Step 2 of 6 Creating Directories"
        maak_directories
        echo "Step 3 of 6 Starting Portainer Container Engine management"
        ulx_docker_portainer_create
        echo "Step 4 of 6 Getting Docker Images"
        ulx_docker_images_pull
        echo "Step 5 of 6 Installing Docker Compose plugin"
        build_install_compose
        echo "Step 6 of 6 Creating demo environment"
        echo ""
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
# DEBIAN 
#
#
if [ $distro == "debian" ]; then
    #
    # Bepaal de actie op basis van de parameter
    actie=$1
   #
fi
#
# UBUNTU
#
#
# Beschikbare functies 
#
# ulx_os_change_repo_nl
# ulx_os_update_apt
# ulx_os_upgrade_os
# ulx_os_config_timezone
# ulx_os_netplan_download
# ulx_os_config_dns
# ulx_os_gnome_install
# ulx_install_vm_tools
# ulx_install_pwrshell
# ulx_install_cockpit
# ulx_install_docker
# ulx_install_ansible_cntrl
# ulx_install_ansible_slave_1
# ulx_install_ansible_semaphore
# ulx_docker_images_pull
# ulx_docker_minikube_init
# ulx_docker_minikube_config
# ulx_docker_portainer_create
# ulx_docker_portainer_remove
# ulx_maak_docker_scripts
# ulx_maak_docker_voorbeelden
# ulx_maak_compose_scripts
# ulx_maak_compose_voorbeelden
# ulx_intro_infra_scripts
# ulx_it-funda_tooling
# maak_directories
# config_menu
#
if [ $distro == "ubuntu" ]; then
    #
    # Bepaal de actie op basis van de parameter
    actie=$1 
    #
    #
    if [ $actie == "upgrade" ]; then
        #
        # UBUNTU OPTIE 1
        #
        ulx_basis_config
        #
        exit 1
    elif [ $actie == "docker" ]; then
        #
        # UBUNTU OPTIE 2
        #
        ulx_basis_config
        #
        # DOCKER
        echo "Docker - Step 4 of 5 Installation and configuration Docker CE"
        ulx_install_docker
        ulx_docker_portainer_create
        ulx_docker_images_pull
        echo "Docker - Step 5 of 6 Installation and configuration Docker Compose"
        ulx_install_docker_compose
        # JENKINS
        ulx_install_jenkins
        ulx_jenkins_docker
        # DEMO omgeving maken 
        echo "Docker - Step 5 of 6 Creating demo environment"
        maak_directories
        ulx_maak_docker_scripts
        ulx_maak_docker_voorbeelden
        ulx_maak_compose_scripts
        ulx_maak_compose_voorbeelden
        exit 1
    elif [ $actie == "podman" ]; then
        #
        # UBUNTU OPTIE 3
        #
        #
        ulx_basis_config
        #
        # PodMan
        echo "Step 4 of 5 Installation and configuration Podman"
        ulx_install_podman
        # ulx_install_docker
        # ulx_docker_portainer_create
        # ulx_docker_images_pull
        ulx_podman_images_pull
        # 
        # DEMO omgeving maken 
        echo "Step 5 of 5 Creating demo environment"
        maak_directories
        ulx_maak_docker_scripts
        ulx_maak_docker_voorbeelden
        ulx_maak_compose_scripts
        ulx_maak_compose_voorbeelden
        exit 1
    elif [ $actie == "minikube" ]; then
        #
        # UBUNTU OPTIE 3
        #
        #
        ulx_basis_config
        #
        # MiniKube
        echo "Minikube Step 3 of 5 Installing OS Tools"
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
        # UBUNTU OPTIE 4
        #
        #
        ulx_basis_config
        #
        # Ansible
        ulx_install_ansible
        exit 1
    elif [ $actie == "introinfra" ]; then
        #
        # UBUNTU OPTIE 5
        #
        #
        ulx_basis_config
        #
        # OSTicket
        echo "Step 4 of 4 Installing OSTicket Environment"
        ulx_intro_infra_install
        exit 1
    elif [ $actie == "itfunda" ]; then
        #
        # UBUNTU OPTIE 6
        # 
        #
        ulx_basis_config
        #
        # IT Fundamentals 
        ulx_it-funda_tooling
        exit 1
    elif [ $actie == "scripts" ]; then
        #
        # UBUNTU OPTIE 7
        #
        exit 1
    elif [ $actie == "scripts" ]; then
        #
        # UBUNTU OPTIE 8
        #
        exit 1
    elif [ $actie == "menu" ]; then
        #
        # UBUNTU OPTIE 9
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
# Thats all folks 
#