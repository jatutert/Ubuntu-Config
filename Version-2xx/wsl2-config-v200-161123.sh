#! /bin/bash
#
#
# Windows SubSystem for Linux (WSL) versie 2
# Vagrant Ubuntu 22.04  
# Docker Docker Compose Kubernetes MicroK8S Minikube configuratie SCRIPT
#
# Versie: 2.0.0 DEVELOP d.d. 16-11-2023
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
#
#
# Check of script wordt uitgevoerd als SUDO 
if [ $(id -u) -ne 0 ]; then
    echo "Dit script moet worden uitgevoerd als sudo."
    exit 1
fi
#
#
# hoofdmenu
#
while true; do
    echo "Maak een keuze:"
    echo "1. Linux bijwerken"
    echo "2. Scripts maken"
    echo "3. Installatie Docker-CE"
    echo "4. Optie 4"
    echo "5. Optie 5"
    echo "9. Verlaat het menu"
    read -p "Voer uw keuze in: " keuze
    case $keuze in
        1)
            echo "U heeft gekozen voor optie 1."
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
            #
            apt update -qq
            apt upgrade -qq -y > /dev/null 2>&1
            apt autoremove -qq -y 
            ;;
        2)
            echo "U heeft gekozen voor optie 2."
            if [ ! -d "/home/$SUDO_USER/docker" ]; then  
               mkdir -p /home/$SUDO_USER/docker
               mkdir -p /home/$SUDO_USER/docker/mysql
               mkdir -p /home/$SUDO_USER/docker/nextcloud
               mkdir -p /home/$SUDO_USER/docker/nginx
               mkdir -p /home/$SUDO_USER/docker/odoo
               mkdir -p /home/$SUDO_USER/docker/portainer
               mkdir -p /home/$SUDO_USER/docker/prometheus-grafana
            fi 
            if [ ! -d "/home/$SUDO_USER/docker-compose" ]; then  
               mkdir -p /home/$SUDO_USER/docker-compose
               mkdir -p /home/$SUDO_USER/docker-compose/mysql
               mkdir -p /home/$SUDO_USER/docker-compose/nextcloud
               mkdir -p /home/$SUDO_USER/docker-compose/nginx
               mkdir -p /home/$SUDO_USER/docker-compose/odoo
               mkdir -p /home/$SUDO_USER/docker-compose/prometheus-grafana 
            fi
            echo "Aanmaken Scripts binnen directories gestart"
            ;;
        3)
            echo "U heeft gekozen voor optie 3."
            ;;
        4)
            echo "U heeft gekozen voor optie 4."
            ;;
        5)
            echo "U heeft gekozen voor optie 5."
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
# Start melding aanmaken
PRETTY_NAME=$(grep -oP '(?<=^PRETTY_NAME=).+' /etc/os-release | tr -d '"')
NAME=$(grep -oP '(?<=^NAME=).+' /etc/os-release | tr -d '"')
VERSION=$(grep -oP '(?<=^VERSION=).+' /etc/os-release | tr -d '"')
VERSION_ID=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
VERSION_CODENAME=$(grep -oP '(?<=^VERSION_CODENAME=).+' /etc/os-release | tr -d '"')
# echo 'Configuratie van' $NAME $VERSION 'gestart'
# echo 'Script wordt uitgevoerd als'$USER
# echo 'Gestart vanuit gebruiker' $SUDO_USER
# Einde melding aanmaken
#
############################################ UBUNTU ###############################################
#
echo 'Repository aanpassen'
# Repository Ubuntu aanpassen naar nl.archive.ubuntu.com 
sed 's@archive.ubuntu.com@nl.archive.ubuntu.com@' -i /etc/apt/sources.list
sed 's@mirrors.edge.kernel.org@nl.archive.ubuntu.com@' -i /etc/apt/sources.list
#
echo 'APT Upgraden van' $NAME $VERSION
# Updaten APT Repository nav verandering in nl.archive.ubuntu.com
apt update -qq
# Upgraden 
apt upgrade -qq -y > /dev/null 2>&1
# Verwijderen niet noodzakelijke onderdelen 
apt autoremove -qq -y 
# Configuratie TijdZone
echo 'Tijdzone goedzetten'
timedatectl set-timezone Europe/Amsterdam > /dev/null 2>&1
# Installatie tools
echo 'Installatie Tools' 
apt install -qq -y mc screenfetch open-vm-tools wget > /dev/null 2>&1
# Installatie nieuwste versie curl mbv snap later uitvoeren via snap run curl 
# snap install curl --channel=latest > /dev/null 2>&1
#
############################################ DIRECTORIES ##########################################
#
echo 'Directories maken'
# Docker
if [ ! -d "/home/$SUDO_USER/docker" ]; then  
    mkdir -p /home/$SUDO_USER/docker
    mkdir -p /home/$SUDO_USER/docker/mysql
    mkdir -p /home/$SUDO_USER/docker/nextcloud
    mkdir -p /home/$SUDO_USER/docker/nginx
    mkdir -p /home/$SUDO_USER/docker/odoo
    mkdir -p /home/$SUDO_USER/docker/portainer
    mkdir -p /home/$SUDO_USER/docker/prometheus-grafana
fi
# Docker Compose  
if [ ! -d "/home/$SUDO_USER/docker-compose" ]; then  
    mkdir -p /home/$SUDO_USER/docker-compose
    mkdir -p /home/$SUDO_USER/docker-compose/mysql
    mkdir -p /home/$SUDO_USER/docker-compose/nextcloud
    mkdir -p /home/$SUDO_USER/docker-compose/nginx
    mkdir -p /home/$SUDO_USER/docker-compose/odoo
    mkdir -p /home/$SUDO_USER/docker-compose/prometheus-grafana
fi
# data
mkdir -p /home/$SUDO_USER/data
# data MinIO
mkdir -p /home/$SUDO_USER/data/minio
# data Nextcloud
mkdir -p /home/$SUDO_USER/data/nextcloud
mkdir -p /home/$SUDO_USER/data/nextcloud/html
mkdir -p /home/$SUDO_USER/data/nextcloud/html/data
# data ODOO
mkdir -p /home/$SUDO_USER/data/odoo
mkdir -p /home/$SUDO_USER/data/odoo/addons
mkdir -p /home/$SUDO_USER/data/odoo/etc
mkdir -p /home/$SUDO_USER/data/odoo/postgresql
# Scripts
mkdir -p /home/$SUDO_USER/scripts
# Scripts GUI
mkdir -p /home/$SUDO_USER/scripts/gui
# Scripts TMP 
mkdir -p /home/$SUDO_USER/scripts/tmp
# Scripts DOCKER-CE
mkdir -p /home/$SUDO_USER/scripts/docker
mkdir -p /home/$SUDO_USER/scripts/docker/alpine-run
mkdir -p /home/$SUDO_USER/scripts/docker/portainer
mkdir -p /home/$SUDO_USER/scripts/docker/pull-images
# Scripts DOCKER COMPOSE
mkdir -p /home/$SUDO_USER/scripts/docker-compose
mkdir -p /home/$SUDO_USER/scripts/docker-compose/mysql
mkdir -p /home/$SUDO_USER/scripts/docker-compose/nextcloud
mkdir -p /home/$SUDO_USER/scripts/docker-compose/nginx
mkdir -p /home/$SUDO_USER/scripts/docker-compose/odoo
mkdir -p /home/$SUDO_USER/scripts/docker-compose/prometheus-grafana
# Scripts Kubernetes MicroK8S Minikube 
mkdir -p /home/$SUDO_USER/scripts/kubernetes
# Scripts MinIO
mkdir -p /home/$SUDO_USER/scripts/minio_scripts
# Intro Infrastructuren
mkdir -p /home/$SUDO_USER/scripts/intro_infra
# IT Fundamentals
mkdir -p /home/$SUDO_USER/scripts/it-fundmtls
# tmp directory 
mkdir -p /home/$SUDO_USER/tmp
#
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
# 
# Rechten geven aan gebruiker ipv root 
chown -f -R $SUDO_USER /home/$SUDO_USER/docker
chown -f -R $SUDO_USER /home/$SUDO_USER/docker-compose
chown -f -R $SUDO_USER /home/$SUDO_USER/data
chown -f -R $SUDO_USER /home/$SUDO_USER/scripts
chown -f -R $SUDO_USER /home/$SUDO_USER/tmp
chown -f -R $SUDO_USER /home/$SUDO_USER/yaml
#
######################################## INSTALLATIES ###################################################
#
#
################# COCKPIT ##############
#
#
echo Installatie COCKPIT op poort 1234
apt install -qq -y cockpit > /dev/null 2>&1
systemctl enable --now cockpit.socket
# COCKPIT poort instellen op poort 1234
echo '[Socket]'           > /home/$SUDO_USER/scripts/tmp/listen.conf
echo 'ListenStream='     >> /home/$SUDO_USER/scripts/tmp/listen.conf
echo 'ListenStream=1234' >> /home/$SUDO_USER/scripts/tmp/listen.conf
mkdir -p /etc/systemd/system/cockpit.socket.d/
cp /home/$SUDO_USER/scripts/tmp/listen.conf /etc/systemd/system/cockpit.socket.d
# Herstarten COCKPIT zodat poort 1234 actief wordt 
systemctl daemon-reload
systemctl restart cockpit.socket
#
#
############################# SCRIPTS MAKEN ####################################
#
#
echo 'Scripts maken'
#
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
#
#
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
#
# Docker-CE demo Alpine script maken
echo '#! /bin/bash'   > /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
echo 'clear'         >> /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
echo 'docker run -it alpine /bin/sh' >> /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
chmod +x /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
#
# Portainer Run
echo '#! /bin/bash'                               > /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
echo 'docker pull portainer/portainer-ce:latest' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
echo 'docker volume create portainer_data'       >> /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
echo 'docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest' >> /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
echo 'echo Ga naar https://xxxxxxx:9443'         >> /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
chmod +x /home/$SUDO_USER/scripts/docker/portainer/portainer-run.sh
#
# Portainer Remove
echo '#! /bin/bash'                               > /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
echo 'docker stop portainer'                     >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
echo 'docker rm portainer'                       >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
echo 'docker rmi portainer/portainer-ce:latest'  >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
echo 'docker volume rm portainer_data'           >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
echo 'docker system prune'                       >> /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
chmod +x /home/$SUDO_USER/scripts/docker/portainer/portainer-remove.sh
#
# Docker Compose demo script NextCloud
echo '#! /bin/bash'    > /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo '#'              >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'clear'          >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'docker compose -f /home/$USER/yaml/docker-compose/nextcloud/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'echo NextCloud port 8888'	>> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
chmod +x /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
#
# Docker Compose demo script ODOO
echo '#! /bin/bash'    > /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo '#'              >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'clear'          >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'docker compose -f /home/$USER/yaml/docker-compose/odoo/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'echo Odoo port 10016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'echo Chat port 20016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
chmod +x /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
#
# MiniKube
#
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
echo 'curl -o /home/$SUDO_USER/tmp/minikube_latest_amd64.deb https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb' >> /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
echo 'dpkg -i /home/$SUDO_USER/tmp/minikube_latest_amd64.deb' >> /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
echo 'rm /home/$SUDO_USER/tmp/minikube_latest_amd64.deb' >> /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
echo 'minikube config set driver docker' >> /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
echo 'minikube config set memory 4096' >> /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
echo 'minikube config set cpus 4' >> /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
echo 'snap install kubeadm --classic --channel=latest' >> /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
echo 'snap install kubectl --classic --channel=latest' >> /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
chmod +x /home/$SUDO_USER/scripts/kubernetes/minikube-install.sh 
#
# Kubernetes MicroK8S Minikube demo simple deployment NGINX
echo '#! /bin/bash'    > /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo '#'              >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'clear'          >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'kubectl create deployment nginx-webserver --image=nginx' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'kubectl expose deployment nginx-webserver --type="NodePort" --port 80' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'kubectl describe deployment nginx-webserver' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'kubectl get svc nginx-webserver' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'minikube service --all' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
#
# Kubernetes MicroK8S Minikube demo deployment NGINX stap 1
# Stap 1 is deployment van omgeving met NGINX versie 14
echo '#! /bin/bash'    > /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo '#'              >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'clear'          >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'kubectl get pods -l app=nginx' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'minikube service --all' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
#
# Kubernetes MicroK8S Minikube demo deployment NGINX stap 2
# Stap 2 is updaten van NGINX van versie 14 naar versie 16
echo '#! /bin/bash'    > /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo '#'              >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'clear'          >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment-update.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'kubectl get pods -l app=nginx' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'minikube service --all' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
#
# Kubernetes MicroK8S Minikube demo deployment NGINX stap 3
# Stap 3 is replicatecount van 2 naar 4 bijwerken 
echo '#! /bin/bash'    > /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'clear'          >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment-scale.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'kubectl get pods -l app=nginx' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'minikube service --all' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
#
# Kubernetes MicroK8S Minikube demo MySQL 
# mysql-pv is persistant volume
# mysql-deployment is deployment van mysql met gebruik van persistant volume claim 
echo '#! /bin/bash'    > /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'clear'          >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/mysql/mysql-pv.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/mysql/mysql-deployment.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl describe deployment mysql' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl describe pvc mysql-pv-claim' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl get pods -l app=mysql' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
#
# MinIO
echo '#! /bin/bash'   > /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
echo '#'             >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
echo '# Minio Object Storage on Docker' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
echo 'docker run -d -p 9000:9000 -p 9001:9001 -p 9090:9090 --name minio -v /home/$USER/data/minio:/data -e "MINIO_ROOT_USER=minio1234" -e "MINIO_ROOT_PASSWORD=minio1234" minio/minio server /data --console-address ":9001"' >>/home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
# echo 'echo MINIO_ROOT_USER=minio1234' >>/home/$SUDO_USER/minio_scripts/minio-docker-run.sh
# echo 'echo MINIO_ROOT_PASSWORD=minio1234' >>/home/$SUDO_USER/minio_scripts/minio-docker-run.sh
chmod +x /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
#
# Introductie Infrastructuren
# Werkt alleen op Ubuntu versie 20 
#
# curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-mysqlserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-mysqlserver.sh
# curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-webserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-webserver.sh
# curl -s -o /home/$SUDO_USER/scripts/intro_infra/install-sftpserver.sh https://raw.githubusercontent.com/msiekmans/linux-server-scripts/main/install-sftpserver.sh
# chmod +x /home/$SUDO_USER/scripts/intro_infra/install-mysqlserver.sh
# chmod +x /home/$SUDO_USER/scripts/intro_infra/install-webserver.sh
# chmod +x /home/$SUDO_USER/scripts/intro_infra/install-sftpserver.sh
#
#
# Installate GNOME GUI (https://phoenixnap.com/kb/how-to-install-a-gui-on-ubuntu) 
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/gui/gnome-install.sh 
echo 'apt update' >> /home/$SUDO_USER/scripts/gui/gnome-install.sh 
echo 'apt upgrade' >> /home/$SUDO_USER/scripts/gui/gnome-install.sh 
echo 'apt install ubuntu-desktop -y' >> /home/$SUDO_USER/scripts/gui/gnome-install.sh 
echo 'shutdown -r now' >> /home/$SUDO_USER/scripts/gui/gnome-install.sh 
chmod +x /home/$SUDO_USER/scripts/gui/gnome-install.sh 
#
# IT Fundamentals 
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/it-fundmtls/install-tools.sh
echo 'apt install gcc -y' >> /home/$SUDO_USER/scripts/it-fundmtls/install-tools.sh
echo 'apt install openjdk-17-jdk -y' >> /home/$SUDO_USER/scripts/it-fundmtls/install-tools.sh
echo 'apt install exif -y' >> /home/$SUDO_USER/scripts/it-fundmtls/install-tools.sh
echo 'apt install okteta -y' >> /home/$SUDO_USER/scripts/it-fundmtls/install-tools.sh
echo 'apt install steghide -y' >> /home/$SUDO_USER/scripts/it-fundmtls/install-tools.sh
chmod +x /home/$SUDO_USER/scripts/it-fundmtls/install-tools.sh
#
########################## YAML FILES Ophalen ##############################################
#
echo 'YAML bestanden downloaden'
# Docker Compose
#
# JTU
curl -s -o /home/$SUDO_USER/yaml/docker-compose/nextcloud/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-nextcloud-vagrant.yml
curl -s -o /home/$SUDO_USER/yaml/docker-compose/odoo/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-odoo-vagrant.yml  
# awesome compose
curl -s -o /home/$SUDO_USER/yaml/docker-compose/prometheus-grafana/prometheus-grafana.yml https://raw.githubusercontent.com/docker/awesome-compose/master/prometheus-grafana/compose.yaml
curl -s -o /home/$SUDO_USER/yaml/docker-compose/nextcloud/nextcloud-redis-mariadb.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nextcloud-redis-mariadb/compose.yaml
curl -s -o /home/$SUDO_USER/yaml/docker-compose/nginx/nginx-flask-mysql.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mysql/compose.yaml
curl -s -o /home/$SUDO_USER/yaml/docker-compose/nginx/nginx-flask-mongo.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mongo/compose.yaml
curl -s -o /home/$SUDO_USER/yaml/docker-compose/wordpress/wordpress-mysql.yml https://raw.githubusercontent.com/docker/awesome-compose/master/wordpress-mysql/compose.yaml
#
# Kubernetes Microk8s Minikube
#
# K8S IO website demos
# MySQL 
curl -s -o /home/$SUDO_USER/yaml/kubernetes/mysql/mysql-pv.yml https://k8s.io/examples/application/mysql/mysql-pv.yaml
curl -s -o /home/$SUDO_USER/yanl/kubernetes/mysql/mysql-deployment.yml https://k8s.io/examples/application/mysql/mysql-deployment.yaml
# NGINX
curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment.yml https://k8s.io/examples/application/deployment.yaml
curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment-scale.yml https://k8s.io/examples/application/deployment-scale.yaml
curl -s -o /home/$SUDO_USER/yaml/kubernetes/nginx/deployment-update.yml https://k8s.io/examples/application/deployment-update.yaml
#
########################## DOCKERFILE #########################################################
#
# Dockerfile uit slides van lesweek 4
#
echo '# start with OS ubuntu'  > /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'FROM ubuntu:latest'     >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'RUN apt-get update'     >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'RUN apt-get -y upgrade' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo '# install apache2 in noninteractivemode' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo '# copy website'         >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'COPY index.html /var/www/html/' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo '# start webserver'      >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'CMD /usr/sbin/apache2ctl -D FOREGROUND' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo '# expose port 80'       >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'EXPOSE 80'              >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
#
# Thats all folks 
#
# Uitloggen om lidmaatschap Docker groep te laden
exit