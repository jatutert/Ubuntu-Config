#! /bin/bash
#
#
# Configuratiescript Ubuntu voor bijvoorbeeld Vagrant en WSL2 
# Versie: 2.0.0 DEVELOP d.d. 09-12-2023
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
    if grep -q "mirrors.edge.kernel.org" /etc/apt/sources.list; then
        sed 's@mirrors.edge.kernel.org@nl.archive.ubuntu.com@' -i /etc/apt/sources.list
        echo "Waarde aangepast naar nl.archive.ubuntu.com in sources.list"
    else
        # Replace the value with nl.archive.ubuntu.com
        echo "Mirrors.edge.kernel.org waarde niet aangetroffen in sources.list"
    fi
    #
    if grep -q "nl.archive.ubuntu.com" /etc/apt/sources.list; then
        echo "The file /etc/apt/sources.list contains nl.archive.ubuntu.com"
    else
        # Replace the value with nl.archive.ubuntu.com
        sudo sed -i 's/archive.ubuntu.com/nl.archive.ubuntu.com/g' /etc/apt/sources.list
        echo "The value has been updated to nl.archive.ubuntu.com"
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
    apt install -qq -y open-vm-tools 
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
# Hoofdmenu weergeven
#
#
while true; do
    clear
    echo 'Configuratie' $NAME $VERSION 'HoofdMenu'
    echo 'Script wordt uitgevoerd als' $USER
    echo 'Gestart vanuit gebruiker' $SUDO_USER
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
            # Scripts maken 
            clear 
            echo "Optie 2 - Scripts maken gestart ..."
            #
            maak_directories
            #
            # Script maken voor installatie van Docker-CE 
            echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker/docker-install.sh  
            echo 'apt install -y curl apt-transport-https' >> /home/$SUDO_USER/scripts/docker/docker-install.sh
            echo 'apt purge -qq -y lxc-docker* || true' >> /home/$SUDO_USER/scripts/docker/docker-install.sh 
            echo 'curl -sSL https://get.docker.com/ | sh' >> /home/$SUDO_USER/scripts/docker/docker-install.sh 
            echo 'service docker start' >> /home/$SUDO_USER/scripts/docker/docker-install.sh  
            echo 'usermod -a -G docker $SUDO_USER' >> /home/$SUDO_USER/scripts/docker/docker-install.sh 
            echo 'shutdown -r now' >> /home/$SUDO_USER/scripts/docker/docker-install.sh 
            chmod +x /home/$SUDO_USER/scripts/docker/docker-install.sh 
            # Docker-CE images ophalen script maken 
            echo '#! /bin/bash'       > /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo Hello World    >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull hello-world > /dev/null 2>&1'  >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo prakhar1989 static-site >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull prakhar1989/static-site > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh 
            echo echo Alpine Linux   >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull alpine > /dev/null 2>&1'       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo Debian Linux   >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull debian > /dev/null 2>&1'       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo MariaDB DBMS   >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull mariadb:10.6 > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo MinIO          >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull minio/minio > /dev/null 2>&1'  >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo NextCloud      >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull nextcloud > /dev/null 2>&1'    >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo NGNINX         >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull nginx > /dev/null 2>&1'        >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo ODOO ERP       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull odoo:latest > /dev/null 2>&1'  >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo Postgress DBMS >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull postgres:latest > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo Registry       >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull registry > /dev/null 2>&1'     >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo Ubuntu 20 04 LTS >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull ubuntu:20.04 > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo echo WordPress      >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            echo 'docker pull wordpress > /dev/null 2>&1'    >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            chmod +x /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
            # Docker-CE demo Alpine script maken
            echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
            echo 'clear' >> /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
            echo 'docker run -it alpine /bin/sh' >> /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
            chmod +x /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
            # Portainer Run
            echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
            echo 'docker pull portainer/portainer-ce:latest' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
            echo 'docker volume create portainer_data' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
            echo 'docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
            echo 'echo Ga naar https://xxxxxxx:9443' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
            chmod +x /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
            # Portainer Remove
            echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
            echo 'docker stop portainer' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
            echo 'docker rm portainer' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
            echo 'docker rmi portainer/portainer-ce:latest' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
            echo 'docker volume rm portainer_data' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
            echo 'docker system prune' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
            chmod +x /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
            # Docker Compose demo script NextCloud
            echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
            echo '#' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
            echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
            echo 'clear' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
            echo 'docker compose -f /home/$USER/yaml/docker-compose/nextcloud/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
            echo 'echo NextCloud port 8888'	>> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
            chmod +x /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
            # Docker Compose demo script ODOO
            echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
            echo '#'>> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
            echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
            echo 'clear' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
            echo 'docker compose -f /home/$USER/yaml/docker-compose/odoo/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
            echo 'echo Odoo port 10016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
            echo 'echo Chat port 20016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
            chmod +x /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
            # Introductie Infrastructuren
            curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-mysqlserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-mysqlserver.sh
            curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-webserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-webserver.sh
            curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-sftpserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-sftpserver.sh
            chmod +x /home/$SUDO_USER/scripts/intro_infra/install-mysqlserver.sh
            chmod +x /home/$SUDO_USER/scripts/intro_infra/install-webserver.sh
            chmod +x /home/$SUDO_USER/scripts/intro_infra/install-sftpserver.sh
            ;;
        3)
            # Installatie Cockpit 
            echo "Optie 3 - Installatie Cockpit gestart ..."
            # echo Installatie COCKPIT op poort 1234
            apt install -qq -y cockpit > /dev/null 2>&1
            systemctl enable --now cockpit.socket
            # COCKPIT poort instellen op poort 1234
            echo '[Socket]' > /home/$SUDO_USER/scripts/tmp/listen.conf
            echo 'ListenStream=' >> /home/$SUDO_USER/scripts/tmp/listen.conf
            echo 'ListenStream=1234' >> /home/$SUDO_USER/scripts/tmp/listen.conf
            mkdir -p /etc/systemd/system/cockpit.socket.d/
            cp /home/$SUDO_USER/scripts/tmp/listen.conf /etc/systemd/system/cockpit.socket.d
            # Herstarten COCKPIT zodat poort 1234 actief wordt 
            systemctl daemon-reload
            systemctl restart cockpit.socket
            ;;
        4)
            # Docker 
            echo "Optie 4 - Installatie Docker-CE inclusief Compose met demo omgeving gestart ..."
            #
            # Directories maken 
            maak_directories
            #
            # Installatie DOCKER-CE en Docker Compose binnen Ubuntu 
            install_docker
            #
            # Voorbeelden maken of downloaden 
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
            #
            # Default demo dockerfile
            # https://hackmd.io/@pmanzoni/r1uWcTqfU
            curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file https://raw.githubusercontent.com/pmanzoni/flask/master/Dockerfile
            # Meerdere talen demo dockerfiles 
            curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-de https://raw.githubusercontent.com/jatutert/docker-demos/main/flask-demo-dkr-file-de
            curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-fr https://raw.githubusercontent.com/jatutert/docker-demos/main/flask-demo-dkr-file-fr
            curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-it https://raw.githubusercontent.com/jatutert/docker-demos/main/flask-demo-dkr-file-it
            curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-nl https://raw.githubusercontent.com/jatutert/docker-demos/main/flask-demo-dkr-file-nl
            curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-dkr-file-uk https://raw.githubusercontent.com/jatutert/docker-demos/main/flask-demo-dkr-file-uk
            # Python Script
            curl -s -o /home/$SUDO_USER/docker/flask-demo/app.py https://raw.githubusercontent.com/pmanzoni/flask/master/app.py
            # Default index.html
            curl -s -o /home/$SUDO_USER/docker/flask-demo/templates/index.html https://raw.githubusercontent.com/pmanzoni/flask/master/templates/index.html
            # Meerdere talen demo index.html 
            curl -s -o /home/$SUDO_USER/docker/flask-demo/deutsch/index.html https://raw.githubusercontent.com/jatutert/docker-demos/main/index-deutsch.html
            curl -s -o /home/$SUDO_USER/docker/flask-demo/english/index.html https://raw.githubusercontent.com/jatutert/docker-demos/main/index-english.html
            curl -s -o /home/$SUDO_USER/docker/flask-demo/francais/index.html https://raw.githubusercontent.com/jatutert/docker-demos/main/index-francais.html
            curl -s -o /home/$SUDO_USER/docker/flask-demo/italiano/index.html https://raw.githubusercontent.com/jatutert/docker-demos/main/index-italiano.html
            curl -s -o /home/$SUDO_USER/docker/flask-demo/nederlands/index.html https://raw.githubusercontent.com/jatutert/docker-demos/main/index-nederlands.html
            #
            curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-image-build.sh https://raw.githubusercontent.com/jatutert/docker-demos/main/flask-image-build.sh
            curl -s -o /home/$SUDO_USER/docker/flask-demo/flask-demo-run.sh https://raw.githubusercontent.com/jatutert/docker-demos/main/flask-demo-run.sh
            #
            chmod +x /home/$SUDO_USER/docker/flask-demo/flask-images-build.sh
            chmod +x /home/$SUDO_USER/docker/flask-demo/flask-demo-run.sh
            #
            # VOORBEELD ## MINIO Docker
            echo '#! /bin/bash' > /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
            echo '#' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
            echo '# Minio Object Storage on Docker' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
            echo 'docker run -d -p 9000:9000 -p 9001:9001 -p 9090:9090 --name minio -v /home/$USER/data/minio:/data -e "MINIO_ROOT_USER=minio1234" -e "MINIO_ROOT_PASSWORD=minio1234" minio/minio server /data --console-address ":9001"' >>/home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
            echo 'echo MINIO_ROOT_USER=minio1234' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
            echo 'echo MINIO_ROOT_PASSWORD=minio1234' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
            chmod +x /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
            #
            # DOCKER COMPOSE 
            #
            # DOCKER COMPOSE YAML JTU bestanden ophalen
            curl -s -o /home/$SUDO_USER/yaml/docker-compose/nextcloud/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-nextcloud-vagrant.yml
            curl -s -o /home/$SUDO_USER/yaml/docker-compose/odoo/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-odoo-vagrant.yml  
            # DOCKER COMPOSE YAML awesome compose YAML bestanden ophalen
            curl -s -o /home/$SUDO_USER/yaml/docker-compose/prometheus-grafana/prometheus-grafana.yml https://raw.githubusercontent.com/docker/awesome-compose/master/prometheus-grafana/compose.yaml
            curl -s -o /home/$SUDO_USER/yaml/docker-compose/nextcloud/nextcloud-redis-mariadb.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nextcloud-redis-mariadb/compose.yaml
            curl -s -o /home/$SUDO_USER/yaml/docker-compose/nginx/nginx-flask-mysql.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mysql/compose.yaml
            curl -s -o /home/$SUDO_USER/yaml/docker-compose/nginx/nginx-flask-mongo.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mongo/compose.yaml
            curl -s -o /home/$SUDO_USER/yaml/docker-compose/wordpress/wordpress-mysql.yml https://raw.githubusercontent.com/docker/awesome-compose/master/wordpress-mysql/compose.yaml
            ;;
        5)
            # Kubernetes MiniKube 
            echo "Optie 5 - Installatie K8S inclusief demo omgeving gestart ..."
            #
            maak_directories
            #
            # Kubernetes MicroK8S Minikube demo simple deployment NGINX
            echo '#! /bin/bash' > /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            echo '#' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            echo 'cd /home/$USER' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            echo 'clear' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            echo 'kubectl create deployment nginx-webserver --image=nginx' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            echo 'kubectl expose deployment nginx-webserver --type="NodePort" --port 80' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            echo 'kubectl describe deployment nginx-webserver' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            echo 'kubectl get svc nginx-webserver' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            echo 'minikube service --all' >> /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            chmod +x /home/$SUDO_USER/k8s-demo/nginx/simple/k8s_simple_deployment_nginx.sh
            #
            # Kubernetes MicroK8S Minikube demo deployment NGINX stap 1
            # Stap 1 is deployment van omgeving met NGINX versie 14
            echo '#! /bin/bash' > /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            echo '#' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            echo 'cd /home/$USER' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            echo 'clear' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            echo "echo 'Stap 1 Deployment NGINX versie 14 gestart ...'" >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment.yml' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            echo 'kubectl get pods -l app=nginx' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            echo 'minikube service --all' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            chmod +x /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_1.sh
            #
            # Kubernetes MicroK8S Minikube demo deployment NGINX stap 2
            # Stap 2 is updaten van NGINX van versie 14 naar versie 16
            echo '#! /bin/bash'    > /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            echo '#'              >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            echo 'cd /home/$USER' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            echo 'clear'          >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            echo "echo 'Stap 2 Updaten NGiNX van versie 14 naar versie 16 gestart ...'" >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment-update.yml' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            echo 'kubectl get pods -l app=nginx' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            echo 'minikube service --all' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            chmod +x /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_2.sh
            #
            # Kubernetes MicroK8S Minikube demo deployment NGINX stap 3
            # Stap 3 is replicatecount van 2 naar 4 bijwerken 
            echo '#! /bin/bash' > /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
            echo 'cd /home/$USER' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
            echo 'clear' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
            echo "echo 'Stap 3 Aanpassen aantal replicas van 2 naar 4 gestart ...'" >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
            echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment-scale.yaml' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
            echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
            echo 'kubectl get pods -l app=nginx' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
            echo 'minikube service --all' >> /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
            chmod +x /home/$SUDO_USER/k8s-demo/nginx/replicas/k8s_nginx_deployment_stap_3.sh
            #
            # Kubernetes MicroK8S Minikube demo MySQL 
            # mysql-pv is persistant volume
            # mysql-deployment is deployment van mysql met gebruik van persistant volume claim 
            echo '#! /bin/bash' > /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
            echo 'cd /home/$USER' >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
            echo 'clear' >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
            echo 'kubectl apply -f /home/$USER/yaml/kubernetes/mysql/mysql-pv.yaml' >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
            echo 'kubectl apply -f /home/$USER/yaml/kubernetes/mysql/mysql-deployment.yaml' >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
            echo 'kubectl describe deployment mysql' >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
            echo 'kubectl describe pvc mysql-pv-claim' >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
            echo 'kubectl get pods -l app=mysql' >> /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
            chmod +x /home/$SUDO_USER/k8s-demo/mysql/k8s_mysql_single.sh
            # K8S IO website demos
            # MySQL 
            curl -s -o /home/$SUDO_USER/yaml/kubernetes/mysql/mysql-pv.yml https://raw.githubusercontent.com/jatutert/k8s-demo/main/YAML/MySQL/mysql-pv.yaml
            curl -s -o /home/$SUDO_USER/yanl/kubernetes/mysql/mysql-deployment.yml https://raw.githubusercontent.com/jatutert/k8s-demo/main/YAML/MySQL/mysql-deployment.yaml
            # NGINX
            curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment.yml https://raw.githubusercontent.com/jatutert/k8s-demo/main/YAML/NGINX/deployment.yaml
            curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment-scale.yml https://raw.githubusercontent.com/jatutert/k8s-demo/main/YAML/NGINX/deployment-scale.yaml
            curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment-update.yml https://raw.githubusercontent.com/jatutert/k8s-demo/main/YAML/NGINX/deployment-update.yaml
            #
            # Docker moet wel er zijn voor minikube !!! 
            #
            # Check if Docker is installed
            if ! [ -x "$(command -v docker)" ]; then
                echo 'Error: Docker is not installed.' >&2
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
            # Installatie kubeadm
            if ! [ -x "$(command -v kubeadm)" ]; then
                echo 'Installatie kubeadm gestart ...' >&2
                snap install kubeadm --classic --channel=latest > /dev/null 2>&1
            fi
            # Installatie kubectl 
            if ! [ -x "$(command -v kubectl)" ]; then
                echo 'Installatie kubectl gestart ...' >&2
                snap install kubectl --classic --channel=latest > /dev/null 2>&1
            fi
            # Minikube configuratie uitvoeren 
            minikube_config
            ;;
        6)
            echo "Optie 6 - Installatie GNOME gestart ..."
            # Installate GNOME GUI (https://phoenixnap.com/kb/how-to-install-a-gui-on-ubuntu) 
            # Functie bijwerken ubuntu 
            ubuntu_update
            # Installatie GNOME 
            apt install ubuntu-desktop -y
            shutdown -r now 
            #
            # # Check if GNOME is installed
            # if ! [ -x "$(command -v gnome-shell)" ]; then
            #  echo 'GNOME is not installed. Installing GNOME...' >&2
            #  sudo apt-get update
            #  sudo apt-get install gnome-shell
            # else
            #  echo 'GNOME is already installed.'
            # fi
            #
            #
            # IT Fundamentals 
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
            ;;
        7)
            echo "Optie 7 - Installatie Ansible inclusief demo omgeving gestart ..."
            #
            #
            # MASTER
            # ######
            #
            #
            # Haal de hostname op
            hostname=$(hostname)
            #
            # Hostname ulx-s-2204-L-A-001 is Ansible Controller 
            if [ "$hostname" == "ulx-s-2204-l-a-001" ]; then
                #
                # Stap 1 Installatie
                    # Aanpassen Ubuntu Standaard Repository naar Nederland 
                    change_ubuntu_repo
                    # Upgraden Ubuntu naar laatste stand van zaken 
                    ubuntu_update
                    # Ansible Repo toevoegen 
                    apt-add-repository ppa:ansible/ansible -y > /dev/null 2>&1
                    # Upgraden Ubuntu naar laatste stand van zaken
                    ubuntu_update
                    # Installeren ANSIBLE latest
                    apt install ansible -y > /dev/null 2>&1
                    echo "Stap 1 Installatie Ansible gereed"
                # 
                # Stap 2 Aanpassen etc hosts bestand 
                    # vullen variable hostname
                    hostname=$(hostname)
                    # Haal het IP-adres van eth1 op
                    eth1_ip=$(ip addr show eth1 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
                    # Voeg 1 toe aan het IP-adres van eth1
                    IFS=. read -r a b c d <<< "$eth1_ip"
                    eth1_plus1_ip="$a.$b.$c.$((d+1))"
                    # Sla de IP-adressen op in afzonderlijke variabelen
                    eth1_ip_var="eth1_ip=$eth1_ip"
                    eth1_plus1_ip_var="eth1_plus1_ip=$eth1_plus1_ip"
                    # Aanpassen hosts bestand 
                    if grep -q "$eth1_ip" /etc/hosts; then
                       echo "$hostname already exists in /etc/hosts"
                    else
                       # Add the hostname and IP address to /etc/hosts
                       echo "$eth1_ip ulx-s-2204-l-a-001" | sudo tee -a /etc/hosts > /dev/null
                       echo "$eth1_plus1_ip ulx-s-2204-l-a-010" | sudo tee -a /etc/hosts > /dev/null
                       echo "Hostname $hostname added to /etc/hosts"
                    fi
                    #
                    echo "Aanpassen Ubuntu Hosts bestand gereed"
                #
                # Stap 3 Inventory ophalen van GitHUB  
                   mkdir -p /etc/ansible/inventory 
                   curl -s -o /etc/ansible/inventory/ansible_demo https://raw.githubusercontent.com/jatutert/Ansible/main/Inventory/ansible_demo
                   # curl -s -o /etc/ansible/inventory/db_servers https://raw.githubusercontent.com/jatutert/Ansible/main/Inventory/db_servers
                   # curl -s -o /etc/ansible/inventory/load_balancers https://raw.githubusercontent.com/jatutert/Ansible/main/Inventory/load_balancers
                   # curl -s -o /etc/ansible/inventory/webservers https://raw.githubusercontent.com/jatutert/Ansible/main/Inventory/webservers
                   # curl -s -o /etc/ansible/inventory/werkstations https://raw.githubusercontent.com/jatutert/Ansible/main/Inventory/werkstations
                   echo "Ophalen Inventory vanaf GitHub gereed"
                # 
                # Stap 4 aanpassen ansible config met Inventory 
                    if grep -q "defaults" /etc/ansible/ansible.cfg; then
                        echo "Ansible Configuratiebestand reeds voorzien van Inventory"
                    else
                        # Add the hostname and IP address to /etc/hosts
                        echo "[defaults]" | sudo tee -a /etc/ansible/ansible.cfg > /dev/null
                        echo "inventory = inventory/" | sudo tee -a /etc/ansible/ansible.cfg > /dev/null
                        echo "Ansible Configuratiebestand voorzien van Inventory"
                    fi
                    echo "Aanpassen Ansible CFG gereed" 
                #
                # Stap 5 Playbooks ophalen van GitHUB
                    mkdir -p /home/$SUDO_USER/playbooks
                    chown -f -R $SUDO_USER /home/$SUDO_USER/playbooks
                    curl -s -o /home/$SUDO_USER/playbooks/ansible_demo_playbook.yml https://raw.githubusercontent.com/jatutert/Ansible/main/PlayBooks/Ubuntu-Linux/ansible_demo_playbook.yml
                    echo "Ophalen Ansible Playbooks vanaf GitHUB gereed"
                #
                # Stap 6 SSH verbinden script maken 
                echo 'sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@ulx-s-2204-l-a-010' > /home/$SUDO_USER/ansible_host_ssh.sh 
                chmod +x /home/$SUDO_USER/ansible_host_ssh.sh
                # 
                # Stap x 
            fi
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
                        echo "$eth1_ip ulx-s-2204-l-a-010" | sudo tee -a /etc/hosts > /dev/null
                        echo "$eth1_min1_ip ulx-s-2204-l-a-001" | sudo tee -a /etc/hosts > /dev/null
                        echo "Hostname $hostname added to /etc/hosts"
                    fi                
                #
                # Stap 3 SSH verbinden script maken 
                echo 'sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@ulx-s-2204-l-a-001' > /home/$SUDO_USER/ansible_cntrl_ssh.sh 
                chmod +x /home/$SUDO_USER/ansible_cntrl_ssh.sh 
                #
                # Stap x  
                #
           fi
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
# Thats all folks 
#