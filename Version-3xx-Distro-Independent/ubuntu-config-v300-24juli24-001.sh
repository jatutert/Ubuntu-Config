#! /bin/bash
#
#
# Configuratiescript Linux 
# Versie: 3.0.0 ALPHA 2
# ONLY FOR TESTING PURPOSES 
# Auteur: John Tutert
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
#
#
#
#
# ################################################################################
#
# COMPONENT 1
#
# CHECKS
#
# ################################################################################
#
#
#
#
# Controleer execute als sudo 
if [ $(id -u) -ne 0 ]; then
    echo "Dit script moet worden uitgevoerd als sudo."
    exit 1
fi
#
#
# Controleer of er een parameter is meegegeven
#
#
if [ $# -eq 0 ]; then
  echo "Geen parameter opgegeven. Gebruik 'docker' of 'ansible' om de juiste actie uit te voeren."
  exit 1
fi
#
#
#
#
# ################################################################################
#
# COMPONENT 2
#
# DECLARATIE FUNCTIES 
#
# ################################################################################
#
#
#
#
# ################################################################################
#
# COMPONENT 2
#
# FUNCTIONS
#
# ALPINE LINUX
#
# ################################################################################
#
#
# Function Bijwerken ALPINE 
#
function alx_update_os () {
    apk update -qq
    apk upgrade -qq -y 
    apk add open-vm-tools 
} 
#
# Function Bijwerken ALPINE 
#
function alx_vm_tools () {
    apk add open-vm-tools 
} 
# ################################################################################
#
# COMPONENT 2
#
# FUNCTIONS
#
# Debian LINUX
#
# ################################################################################
#
#
# Function Bijwerken Debian
#
function dbn_update_os () {
    apk update -qq
    apk upgrade -qq -y 
    apk add open-vm-tools 
} 
#
# Function Bijwerken Debian
#
function dbn_vm_tools () {
    apk add open-vm-tools 
} 
#
#
# ################################################################################
#
# COMPONENT 2
#
# FUNCTIONS
#
# UBUNTU LINUX
#
# ################################################################################
#
#
# CATEGORIE UBUNTU OS FUNCTIES
#
#
# UBUNTU OS FUNCTIES ## Functie Change Repo Ubuntu 
#
function ulx_os_change_repo_nl () {
    clear
    echo "Aanpassen Ubuntu Repository"
    if grep -q "mirrors.edge.kernel.org" /etc/apt/sources.list; then
        sed "s@mirrors.edge.kernel.org@nl.archive.ubuntu.com@" -i /etc/apt/sources.list
        echo "Ubuntu Repository aangepast kernel.org naar ubuntu.com in sources.list"
    else
        # Replace the value with nl.archive.ubuntu.com
        echo "Mirrors.edge.kernel.org waarde niet aangetroffen in sources.list"
    fi
    #
    if grep -q "nl.archive.ubuntu.com" /etc/apt/sources.list; then
        echo "Ubuntu Repository is juist ingesteld"
    else
        # Replace the value with nl.archive.ubuntu.com
        sed "s@archive.ubuntu.com@nl.archive.ubuntu.com@" -i /etc/apt/sources.list
        echo "Ubuntu Repository aangepast naar nl.archive.ubuntu.com in sources.list"
    fi
}
#
#
# UBUNTU OS FUNCTIES ## Functie Update Ubuntu OS 
#
#
function ulx_os_update_apt () {
    apt update -qq
} 
#
#
# UBUNTU OS FUNCTIES ## Functie Upgrade Ubuntu OS 
#
#
function ulx_os_upgrade_os () {
    apt update -qq
    apt upgrade -qq -y > /dev/null 2>&1
    apt autoremove -qq -y
} 
#
# UBUNTU OS FUNCTIES ## Functie Change Timezone 
#
function ulx_os_timezone_change () {
    timedatectl set-timezone Europe/Amsterdam
} 
#
# UBUNTU OS FUNCTIES ## GNOME GUI Install 
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
# CATEGORIE UBUNTU OS Install Software Functies 
#
#
# UBUNTU OS Install Software Functies ## Functie Installatie OS Open VM Tools 
#
#
function ulx_install_vm_tools () {
    apt install -qq -y open-vm-tools 
} 
#
#
# UBUNTU OS Install Software Functies ## Functie Installatie OS Powershell  
#
#
function ulx_install_pwrshell () {
    apt-get update -qq
    curl -o /home/$SUDO_USER/powershell_7.4.2-1.deb_amd64.deb https://github.com/PowerShell/PowerShell/releases/download/v7.4.2/powershell_7.4.2-1.deb_amd64.deb
    dpkg -i /home/$SUDO_USER/powershell_7.4.2-1.deb_amd64.deb
    apt-get install -f
    rm /home/$SUDO_USER/powershell_7.4.2-1.deb_amd64.deb
}
#
#
# UBUNTU OS Install Software Functies ## Functie Installatie OS Cockpit
#
#
function ulx_install_cockpit () {
    apt install -qq -y cockpit > /dev/null 2>&1
    systemctl enable --now cockpit.socket
    echo '[Socket]' > /home/$SUDO_USER/scripts/tmp/listen.conf
    echo 'ListenStream=' >> /home/$SUDO_USER/scripts/tmp/listen.conf
    echo 'ListenStream=1234' >> /home/$SUDO_USER/scripts/tmp/listen.conf
    mkdir -p /etc/systemd/system/cockpit.socket.d/
    cp /home/$SUDO_USER/scripts/tmp/listen.conf /etc/systemd/system/cockpit.socket.d
    systemctl daemon-reload
    systemctl restart cockpit.socket
} 
#
#
# UBUNTU OS Install Software Functies ## Functie Installatie Docker
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
# UBUNTU OS Install Software Functies ## Functie Installatie IAC Ansible 
#
#
function ulx_install_ansible_cntrl () {
    #
    # STAP 1
    # Updaten Ubuntu
    #
    echo "Stap 1 - Update Ubuntu gestart ..."
    # 1A Aanpassen Ubuntu Standaard Repository naar Nederland 
    ulx_os_change_repo_nl
    # 1B Updaten APT
    ulx_os_update_apt
    # 1C Ansible Repo toevoegen 
    apt-add-repository ppa:ansible/ansible -y > /dev/null 2>&1
    # 1D Updaten APT
    ulx_os_update_apt
    #
    # STAP 2
    # Installatie Ansible Controller op Ubuntu 22.04
    echo "Stap 2 - Installatie Ansible Controller gestart ..."
    #
    apt install ansible -y > /dev/null 2>&1
    #
    # STAP 3
    # Aanpassen etc hosts bestand
    echo "Stap 3 - Aanpassen hosts betand gestart ..."
    #
    # 3a vullen variable hostname
    hostname=$(hostname)
    # 3b Haal het IP-adres van eth1 op
    eth1_ip=$(ip addr show eth1 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
    # 3c Voeg 1 toe aan het IP-adres van eth1
    IFS=. read -r a b c d <<< "$eth1_ip"
    eth1_plus1_ip="$a.$b.$c.$((d+1))"
    # 3d Sla de IP-adressen op in afzonderlijke variabelen
    eth1_ip_var="eth1_ip=$eth1_ip"
    eth1_plus1_ip_var="eth1_plus1_ip=$eth1_plus1_ip"
    # 3e Aanpassen hosts bestand 
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
    # STAP 4
    # Inventory ophalen van GitHUB
    echo "Stap 4 - Ophalen Inventory bestanden vanaf GitHUB JATUTERT gestart ..."
    mkdir -p /etc/ansible/inventory 
    curl -s -o /etc/ansible/inventory/ansible_demo https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Inventory/ansible_demo
    # curl -s -o /etc/ansible/inventory/db_servers https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Inventory/Old/db_servers
    # curl -s -o /etc/ansible/inventory/load_balancers https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Inventory/Old/load_balancers
    # curl -s -o /etc/ansible/inventory/webservers https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Inventory/Old/webservers
    # curl -s -o /etc/ansible/inventory/werkstations https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Inventory/Old/werkstations
    echo "Ophalen Inventory vanaf GitHub gereed"
    #
    # STAP 5
    # Aanpassen ansible config met Inventory
    echo "Stap 5 - Aanpassen Ansible config met Inventory gestart ..."
    if grep -q "defaults" /etc/ansible/ansible.cfg; then
        echo "Ansible Configuratiebestand reeds voorzien van Inventory"
    else
        # Add the hostname and IP address to /etc/hosts
        echo "[defaults]" | sudo tee -a /etc/ansible/ansible.cfg > /dev/null
        echo "inventory = inventory/" | sudo tee -a /etc/ansible/ansible.cfg > /dev/null
        echo "Ansible Configuratiebestand voorzien van Inventory"
    fi
    #
    # STAP 6
    # Playbooks ophalen van GitHUB
    echo "Stap 6 - Ophalen Playbooks vanaf GitHUB JATUTERT gestart ..."
    mkdir -p /home/$SUDO_USER/playbooks
    chown -f -R $SUDO_USER /home/$SUDO_USER/playbooks
    curl -s -o /home/$SUDO_USER/playbooks/ansible_demo_playbook.yml https://raw.githubusercontent.com/jatutert/demos/main/Ansible/Playbooks/Linux/ansible_demo_playbook.yml
    echo "Ophalen Ansible Playbooks vanaf GitHUB gereed"
    #
    # STAP 7
    # SSH verbinden script maken 
    # Uitvoeren als user Vagrant en niet als Root anders krijg je SSH foutmelding bij Ansible 
    echo "Stap 7 - SSH Verbindingsscript maken gestart ..."
    echo 'echo Uitvoeren als user Vagrant en niet als Root' > /home/$SUDO_USER/ansible_host_ssh.sh
    echo 'sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@ulx-s-2204-l-a-010' > /home/$SUDO_USER/ansible_host_ssh.sh 
    chmod +x /home/$SUDO_USER/ansible_host_ssh.sh
}
#
#
#
#
function ulx_install_ansible_slave_1 () {
    # Stap 1 Installatie
    # Aanpassen Ubuntu Standaard Repository naar Nederland 
    ulx_os_change_repo_nl
    # Updaten APT 
    ulx_os_update_apt
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
        echo "$eth1_ip ansible_demo_host_001" | sudo tee -a /etc/hosts > /dev/null
        echo "$eth1_min1_ip ansible_demo_ctrl_001" | sudo tee -a /etc/hosts > /dev/null
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
} 
#
#
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
    snap start semaphore
    # Aanpassen standaard poort 3000 naar 4444
    snap set semaphore port=4444
    # Herstarten com nieuwe poort actief te maken 
    snap restart semaphore
} 
#
#
#
#
# CATEGORIE UBUNTU OS DOCKER Software Functies 
#
#
#
#
# UBUNTU UBUNTU OS DOCKER Software Functies ## Images Pull
#
#
function ulx_docker_images_pull () {
    # docker pull hello-world
    docker pull alpine
    docker pull debian
    # docker pull ubuntu:20.04
    docker pull ubuntu:22.04
    docker pull registry
    docker pull prakhar1989/static-site
    # docker pull mariadb:10.6
    # docker pull minio/minio
    # docker pull nextcloud
    docker pull nginx
    # docker pull postgres:latest
    # docker pull wordpress
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
        install_docker
    fi
    # Docker is installed 
    #
    # Directory TMP check 
    if [ ! -d "/home/$SUDO_USER/tmp" ]; then
        mkdir -p /home/$SUDO_USER/tmp
        chown -f -R $SUDO_USER /home/$SUDO_USER/tmp
    fi 
    # Installatie Minikube 
    if ! [ -x "$(command -v minikube)" ]; then
        echo 'Minikube niet aangetroffen. Installatie gestart ...' >&2
        curl -o /home/$SUDO_USER/tmp/minikube_latest_amd64.deb https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
        dpkg -i /home/$SUDO_USER/tmp/minikube_latest_amd64.deb > /dev/null 2>&1
        rm /home/$SUDO_USER/tmp/minikube_latest_amd64.deb
    fi 
    #
    # Installatie kubeadm
    #
    if ! [ -x "$(command -v kubeadm)" ]; then
        echo 'Installatie kubeadm gestart ...' >&2
        snap install kubeadm --classic --channel=latest > /dev/null 2>&1
    fi
    #
    # Installatie kubectl 
    #
    if ! [ -x "$(command -v kubectl)" ]; then
        echo 'Installatie kubectl gestart ...' >&2
        snap install kubectl --classic --channel=latest > /dev/null 2>&1
    fi
    #
    # Minikube configuratie uitvoeren 
    ram=$(free --mega | grep 'Mem' | awk '{print $7/4}') | minikube config set memory $ram 
    cpu_aantal=$(nproc) | minikube config set cpus $cpu_aantal  
    minikube config set driver docker
} 
#
#
# UBUNTU UBUNTU OS DOCKER Software Functies ## Minikube CONFIG 
#
#
function ulx_docker_minikube_config () {
    ram=$(free --mega | grep 'Mem' | awk '{print $7/4}') | minikube config set memory $ram 
    cpu_aantal=$(nproc) | minikube config set cpus $cpu_aantal  
    minikube config set driver docker
}
#
#
# UBUNTU UBUNTU OS DOCKER Software Functies ## Portainer Create  
#
#
function ulx_docker_portainer_create () {
    docker pull portainer/portainer-ce:latest
    docker volume create portainer_data
    docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
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
# CATEGORIE UBUNTU OS Maak Scripts Functies 
#
#
# UBUNTU OS Maak Scripts Functies | Maak Docker Scripts functies 
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
    echo echo Alpine Linux   >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull alpine > /dev/null 2>&1'       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo echo Debian Linux   >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull debian > /dev/null 2>&1'       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo echo Ubuntu 20 04 LTS >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull ubuntu:20.04 > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    # Docker Services
    #
    echo echo Registry       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    echo 'docker pull registry > /dev/null 2>&1'     >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
    #
    # General Services
    #
    echo echo prakhar1989 static-site >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
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
    curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file
    # Meerdere talen demo dockerfiles 
    curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-de https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-de
    curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-fr https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-fr
    curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-it https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-it
    curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-nl https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-nl
    curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-uk https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/flask-demo-dkr-file-uk
    # Python Script
    curl -s -o /home/$SUDO_USER/docker/flask-demo/app.py https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/app.py
    # Default index.html
    curl -s -o /home/$SUDO_USER/docker/flask-demo/templates/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index.html
    # Meerdere talen demo index.html 
    curl -s -o /home/$SUDO_USER/docker/flask-demo/deutsch/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-deutsch.html
    curl -s -o /home/$SUDO_USER/docker/flask-demo/english/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-english.html
    curl -s -o /home/$SUDO_USER/docker/flask-demo/francais/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-francais.html
    curl -s -o /home/$SUDO_USER/docker/flask-demo/italiano/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-italiano.html
    curl -s -o /home/$SUDO_USER/docker/flask-demo/nederlands/index.html https://raw.githubusercontent.com/jatutert/demos/main/Docker/Dockerfiles/FLASK/index-nederlands.html
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
function ulx_maak_compose_scripts () {
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
    # DOCKER COMPOSE YAML JTU bestanden ophalen
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/nextcloud/docker-compose.yml https://raw.githubusercontent.com/jatutert/demos/main/Docker-Compose/YAML/NextCloud/docker-compose-nextcloud-vagrant.yml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/odoo/docker-compose.yml https://raw.githubusercontent.com/jatutert/demos/main/Docker-Compose/YAML/Odoo/docker-compose-odoo-vagrant.yml  
    # DOCKER COMPOSE YAML awesome compose YAML bestanden ophalen
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/prometheus-grafana/prometheus-grafana.yml https://raw.githubusercontent.com/docker/awesome-compose/master/prometheus-grafana/compose.yaml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/nextcloud/nextcloud-redis-mariadb.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nextcloud-redis-mariadb/compose.yaml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/nginx/nginx-flask-mysql.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mysql/compose.yaml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/nginx/nginx-flask-mongo.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mongo/compose.yaml
    curl -s -o /home/$SUDO_USER/yaml/docker-compose/wordpress/wordpress-mysql.yml https://raw.githubusercontent.com/docker/awesome-compose/master/wordpress-mysql/compose.yaml
} 
#
# UBUNTU Maak Scripts Onderwijsmodules
#
# Introductie Infrastructuren
#
#
function ulx_intro_infra_scripts () {
    curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-mysqlserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-mysqlserver.sh
    curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-webserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-webserver.sh
    curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-webserver-v2.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-webserver-v2.sh
    curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-sftpserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-sftpserver.sh
    chmod +x /home/$SUDO_USER/scripts/intro_infra/install-mysqlserver.sh
    chmod +x /home/$SUDO_USER/scripts/intro_infra/install-webserver.sh
    chmod +x /home/$SUDO_USER/scripts/intro_infra/install-webserver-v2.sh
    chmod +x /home/$SUDO_USER/scripts/intro_infra/install-sftpserver.sh
}
#
#
# IT Fundamentals 
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
# Virtualisatie
#
#
function ulx_virtualisatie_scripts () { 
   # LEEG
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
# Function menu 
#
#
function menu () {
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
        echo "1. Ubuntu bijwerken"
        echo "2. Ubuntu BASH Scripts maken voor demos"
        echo "3. Cockpit beheeromgeving installeren"
        echo "4. Docker-CE inclusief Compose met demo omgeving"
        echo "5. Minikube inclusief demo omgeving"
        echo "6. GNOME Grafische omgeving installeren"
        echo "7. Ansible inclusief demo omgeving"
        echo "9. Verlaat het menu"
        # Keuze opvragen 
        read -p "Voer uw keuze in: " keuze
        # keuze verwerken 
        case $keuze in
        1)
            # LINUX BIJWERKEN
            clear 
            echo "Optie 1 - Linux Bijwerken gestart ..."
            # Functie verder Ubuntu repo uitvoeren
            change_ubuntu_repo
            # Functie Bijwerken Ubuntu uitvoeren 
            ubuntu_update
            if [ ! -d "/home/$SUDO_USER/tmp" ]; then
                mkdir -p /home/$SUDO_USER/tmp
                chown -f -R $SUDO_USER /home/$SUDO_USER/tmp
            fi 
            ;;
        2)
            clear 
            echo "Optie 2 - Gekozen ..."
            ;;
        3)
            clear
            echo "Optie 3 - Gekozen ..."
            ;;
        4)
            clear
            echo "Optie 4 - Gekozen ..."
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
# ################################################################################
#
# COMPONENT 3
#
# VARIABELEN
#
# VULLEN
#
# ################################################################################
#
#
#
#
PRETTY_NAME=$(grep -oP '(?<=^PRETTY_NAME=).+' /etc/os-release | tr -d '"')
NAME=$(grep -oP '(?<=^NAME=).+' /etc/os-release | tr -d '"')
VERSION=$(grep -oP '(?<=^VERSION=).+' /etc/os-release | tr -d '"')
VERSION_ID=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
VERSION_CODENAME=$(grep -oP '(?<=^VERSION_CODENAME=).+' /etc/os-release | tr -d '"')
#
#
# Wat is het resultaat 
#
# PRETTY_NAME=$(grep -oP '(?<=^PRETTY_NAME=).+' /etc/os-release | tr -d '"')
# resultaat Ubuntu 24.04 LTS
#
# NAME=$(grep -oP '(?<=^NAME=).+' /etc/os-release | tr -d '"')
# resultaat Ubuntu
#
# VERSION=$(grep -oP '(?<=^VERSION=).+' /etc/os-release | tr -d '"')
# resultaat 24.04 LTS (Noble Numbat)
#
# VERSION_ID=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
# resultaat 24.04
#
# VERSION_CODENAME=$(grep -oP '(?<=^VERSION_CODENAME=).+' /etc/os-release | tr -d '"')
# resultaat noble 
#
#
GH_JATUTERT_RAW="https://raw.githubusercontent.com/jatutert/"
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
$distro=$(echo "$NAME" | tr '[:upper:]' '[:lower:]')
#
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
if [ $distro == "ubuntu" ]; then
    #
    # Bepaal de actie op basis van de parameter
    actie=$1 
    #
    #
    if [ $actie == "update" ]; then
        #
        # UBUNTU OPTIE 1
        #
        ulx_os_change_repo_nl
        ulx_os_timezone_change
        ulx_os_update_apt
        exit 1
        elif [ $actie == "docker" ]; then
            #
            # UBUNTU OPTIE 2
            #
            ulx_install_docker
            maak_directories
            ulx_maak_docker_scripts
            ulx_maak_docker_voorbeelden
            ulx_maak_compose_scripts
            ulx_maak_compose_voorbeelden
            exit 1
        elif [ $actie == "scripts" ]; then
            #
            # UBUNTU OPTIE 3
            #
            echo "Ansible-actie geselecteerd."
        # UBUNTU OPTIE 4
        elif [ $actie == "scripts" ]; then
            # Voer hier uw Ansible-commando's uit
            echo "Ansible-actie geselecteerd."
            ansible-playbook playbook.yml
        # UBUNTU OPTIE 5 
        elif [ $actie == "scripts" ]; then
            # Voer hier uw Ansible-commando's uit
            echo "Ansible-actie geselecteerd."
            ansible-playbook playbook.yml
        # UBUNTU OPTIE 6 
        elif [ $actie == "scripts" ]; then
            # Voer hier uw Ansible-commando's uit
            echo "Ansible-actie geselecteerd."
            ansible-playbook playbook.yml
        # UBUNTU OPTIE 7
        elif [ $actie == "scripts" ]; then
            # Voer hier uw Ansible-commando's uit
            echo "Ansible-actie geselecteerd."
            ansible-playbook playbook.yml
        # UBUNTU OPTIE 8
        elif [ $actie == "scripts" ]; then
            # Voer hier uw Ansible-commando's uit
            echo "Ansible-actie geselecteerd."
            ansible-playbook playbook.yml
        # UBUNTU OPTIE 9
        elif [ $actie == "scripts" ]; then
            # Voer hier uw Ansible-commando's uit
            echo "Ansible-actie geselecteerd."
            ansible-playbook playbook.yml
    # Onjuiste parameter
    else
        echo "Onjuiste parameter: $actie. Gebruik 'docker' of 'ansible'."
        exit 1
    fi
fi
#
# Thats all folks 
#