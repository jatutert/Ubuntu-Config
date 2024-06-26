#! /bin/bash
#
#
# Configuratiescript Ansible demo op Ubuntu 22.04
# Versie: 16 april 2024 (Op basis van Ubuntu Config d.d. 16 febr. 2024) 
# Auteur: John Tutert
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
# bugfixes
#
# Check of script wordt uitgevoerd als SUDO 
if [ $(id -u) -ne 0 ]; then
    echo "Dit script moet worden uitgevoerd als sudo."
    exit 1
fi
# Vullen Variabelen 
PRETTY_NAME=$(grep -oP '(?<=^PRETTY_NAME=).+' /etc/os-release | tr -d '"')
NAME=$(grep -oP '(?<=^NAME=).+' /etc/os-release | tr -d '"')
VERSION=$(grep -oP '(?<=^VERSION=).+' /etc/os-release | tr -d '"')
VERSION_ID=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
VERSION_CODENAME=$(grep -oP '(?<=^VERSION_CODENAME=).+' /etc/os-release | tr -d '"')
# 
# Functies
#
# Function Change Repo Ubuntu 
#
function change_ubuntu_repo () {
     # echo "Aanpassen Ubuntu Repository"
    if grep -q "mirrors.edge.kernel.org" /etc/apt/sources.list; then
        sed "s@mirrors.edge.kernel.org@nl.archive.ubuntu.com@" -i /etc/apt/sources.list
         echo "Ubuntu Repository aangepast kernel.org naar ubuntu.com in sources.list" > /dev/null 2>&1
    else
        # Replace the value with nl.archive.ubuntu.com
         echo "Repository mirrors.edge.kernel.org waarde niet aangetroffen in sources.list" > /dev/null 2>&1
    fi
    #
    if grep -q "nl.archive.ubuntu.com" /etc/apt/sources.list; then
         echo "Ubuntu Repository is juist ingesteld" > /dev/null 2>&1
    else
        # Replace the value with nl.archive.ubuntu.com
        sed "s@archive.ubuntu.com@nl.archive.ubuntu.com@" -i /etc/apt/sources.list
         echo "Ubuntu Repository aangepast naar nl.archive.ubuntu.com in sources.list" > /dev/null 2>&1
    fi
}
#
# Function Bijwerken Ubuntu 
#
function ubuntu_update () {
    apt update -qq
    apt upgrade -qq -y > /dev/null 2>&1
    apt autoremove -qq -y
    timedatectl set-timezone Europe/Amsterdam
    # VMware Tools 
    apt install -qq -y open-vm-tools > /dev/null 2>&1
    # apt install -qq -y mc
    # apt install -qq -y screenfetch
    # apt install -qq -y wget
} 
#
#
# Function Installeren Docker 
#
#
function install_docker() {
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
# Function Minikube config 
#
#
function minikube_config () {
    minikube config set driver docker 
    # Beschikbaar geheugen delen door 4 en in variable stoppen
    ram=$(free --mega | grep 'Mem' | awk '{print $7/4}')
    minikube config set memory $ram 
    cpu_aantal=$(nproc)
    minikube config set cpus $cpu_aantal  
    # minikube config view 
    #
    echo "#! /bin/bash" > /home/$SUDO_USER/minikube_config.sh 
    echo "minikube config set driver docker" >> /home/$SUDO_USER/minikube_config.sh 
    echo "ram=$(free --mega | grep 'Mem' | awk '{print $7/4}')" >> /home/$SUDO_USER/minikube_config.sh 
    echo "minikube config set memory $ram" >> /home/$SUDO_USER/minikube_config.sh  
    echo "cpu_aantal=$(nproc)" >> /home/$SUDO_USER/minikube_config.sh  
    echo "minikube config set cpus $cpu_aantal" >> /home/$SUDO_USER/minikube_config.sh  
    chmod +x /home/$SUDO_USER/minikube_config.sh 
}
#
#
# Function maak directories 
#
#
function maak_directories () {
    #
    if [ ! -d "/home/$SUDO_USER/scripts" ]; then
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
        mkdir -p /home/$SUDO_USER/scripts/minio_scripts
        mkdir -p /home/$SUDO_USER/scripts/intro_infra
        mkdir -p /home/$SUDO_USER/scripts/it-fundmtls
        chown -f -R $SUDO_USER /home/$SUDO_USER/scripts
    fi
    #
    if [ ! -d "/home/$SUDO_USER/docker" ]; then  
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
    fi 
    #
    if [ ! -d "/home/$SUDO_USER/docker-compose" ]; then  
        mkdir -p /home/$SUDO_USER/docker-compose
        mkdir -p /home/$SUDO_USER/docker-compose/mysql
        mkdir -p /home/$SUDO_USER/docker-compose/nextcloud
        mkdir -p /home/$SUDO_USER/docker-compose/nginx
        mkdir -p /home/$SUDO_USER/docker-compose/odoo
        mkdir -p /home/$SUDO_USER/docker-compose/prometheus-grafana 
        chown -f -R $SUDO_USER /home/$SUDO_USER/docker-compose
    fi
    #
    if [ ! -d "/home/$SUDO_USER/data" ]; then  
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
    fi
    #
    if [ ! -d "/home/$SUDO_USER/yaml" ]; then  
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
    fi
    #
    if [ ! -d "/home/$SUDO_USER/k8s-demo" ]; then  
        mkdir -p /home/$SUDO_USER/k8s-demo 
        mkdir -p /home/$SUDO_USER/k8s-demo/mysql
        mkdir -p /home/$SUDO_USER/k8s-demo/nextcloud
        mkdir -p /home/$SUDO_USER/k8s-demo/nginx
        mkdir -p /home/$SUDO_USER/k8s-demo/nginx/simple
        mkdir -p /home/$SUDO_USER/k8s-demo/nginx/replicas
        mkdir -p /home/$SUDO_USER/k8s-demo/odoo
        chown -f -R $SUDO_USER /home/$SUDO_USER/k8s-demo
    fi 
}
#
#
clear
echo "Installatie Ansible inclusief demo omgeving gestart ..."
#
#
# SLAVE
# ######
#
# 
# Haal de hostname op
hostname=$(hostname)
#
# Hostname ulx-s-2204-L-A-010 is slaaf 1 voor ansible controller 
if [ "$hostname" == "ulx-s-2204-l-a-010" ]; then
    # Stap 1 Installatie
    # Aanpassen Ubuntu Standaard Repository naar Nederland 
    change_ubuntu_repo
    # Upgraden Ubuntu naar laatste stand van zaken 
    ubuntu_update
    #
    # Stap 2 Installatie SSHPASS
    # 
    # Starten installatie sshpass
    apt install sshpass -y
    #
    # Stap 3 Aanpassen etc hosts bestand
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
        echo "$eth1_ip ulx-s-2204-l-a-010" | sudo tee -a /etc/hosts > /dev/null
        echo "$eth1_min1_ip ulx-s-2204-l-a-001" | sudo tee -a /etc/hosts > /dev/null
        echo "Hostname $hostname added to /etc/hosts"
    fi                
    #
    # Stap 4 SSH verbinden script maken 
    echo 'echo Uitvoeren als user Vagrant en niet als Root' > /home/$SUDO_USER/ansible_cntrl_ssh.sh 
    echo 'sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@ulx-s-2204-l-a-001' > /home/$SUDO_USER/ansible_cntrl_ssh.sh 
    chmod +x /home/$SUDO_USER/ansible_cntrl_ssh.sh 
    #
    # Stap x  
    #
fi
#
# Thats all folks 
#