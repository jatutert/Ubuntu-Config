#! /bin/bash
#
#
# Windows SubSystem for Linux (WSL) versie 2 
# Docker en MicroK8S (Kubernetes) configuratie SCRIPT
#
# Versie: 1.1.4 d.d. 22-09-2023
# Auteur: John Tutert
#
# Changelog
# Unix LF ipv Windows CRLF (1.1.0)
# Bugfixes (1.1.1)
# Onderverdeling (1.1.2)
# Bugfixes (1.1.4)
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
echo 'Bijwerken' $NAME $VERSION
# Repository Ubuntu aanpassen naar nl.archive.ubuntu.com 
sed 's@archive.ubuntu.com@nl.archive.ubuntu.com@' -i /etc/apt/sources.list
# Updaten APT Repository nav verandering in nl.archive.ubuntu.com
apt update -qq > /dev/null 2>&1
# Upgraden 
apt upgrade -y > /dev/null 2>&1
# Verwijderen niet noodzakelijke onderdelen 
apt autoremove -y > /dev/null 2>&1
# Configuratie TijdZone
timedatectl set-timezone Europe/Amsterdam > /dev/null 2>&1
# Installatie tools 
apt install -y mc screenfetch open-vm-tools wget > /dev/null 2>&1
#
############################################ DIRECTORIES ##########################################
#
# data
mkdir /home/$SUDO_USER/data
# data MinIO
mkdir /home/$SUDO_USER/data/minio
# data Nextcloud
mkdir /home/$SUDO_USER/data/nextcloud
mkdir /home/$SUDO_USER/data/nextcloud/html
mkdir /home/$SUDO_USER/data/nextcloud/html/data
# data ODOO
mkdir /home/$SUDO_USER/data/odoo
mkdir /home/$SUDO_USER/data/odoo/addons
mkdir /home/$SUDO_USER/data/odoo/etc
mkdir /home/$SUDO_USER/data/odoo/postgresql
# Scripts
mkdir /home/$SUDO_USER/scripts
mkdir /home/$SUDO_USER/scripts/tmp
# Scripts DOCKER-CE
mkdir /home/$SUDO_USER/scripts/docker
mkdir /home/$SUDO_USER/scripts/docker/alpine-run
mkdir /home/$SUDO_USER/scripts/docker/pull-images
# Scripts DOCKER COMPOSE
mkdir /home/$SUDO_USER/scripts/docker-compose
mkdir /home/$SUDO_USER/scripts/docker-compose/mysql
mkdir /home/$SUDO_USER/scripts/docker-compose/nextcloud
mkdir /home/$SUDO_USER/scripts/docker-compose/nginx
mkdir /home/$SUDO_USER/scripts/docker-compose/odoo
# Scripts MinIO
mkdir /home/$SUDO_USER/scripts/minio_scripts
#
#
######################################## INSTALLATIES ###################################################
#
#
################# COCKPIT ##############
#
echo Installatie COCKPIT op poort 9090
apt install -y cockpit > /dev/null 2>&1
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
#
################ DOCKER ################
#
# Voorbereidingen 
echo Verwijderen eventuele oude Docker zaken
echo Foutmeldingen negeren
apt install -y curl apt-transport-https > /dev/null 2>&1
apt purge -qq -y lxc-docker* || true > /dev/null 2>&1
# Installatie Docker-CE (Script Get DOCKER)
echo Installatie Docker Community Edition gestart
curl -sSL https://get.docker.com/ | sh > /dev/null 2>&1
echo Starten DOCKER CE service
service docker start > /dev/null 2>&1
# Gebruiker toevoegen aan docker groep
usermod -a -G docker $SUDO_USER > /dev/null 2>&1
#
############### MicroK8S ################
#
echo Installatie MicroK8S gestart
snap install microk8s --classic --channel=1.28/stable > /dev/null 2>&1
# Firewall
ufw allow in on cni0 > /dev/null 2>&1
ufw allow out on cni0 > /dev/null 2>&1
ufw default allow routed > /dev/null 2>&1
# Gebruikersrechten goed zetten
usermod -a -G microk8s $SUDO_USER
mkdir /home/$SUDO_USER/.kube
chown -f -R $SUDO_USER /home/$SUDO_USER/.kube
#
echo Installatie KubeCTL gestart
snap install kubectl --classic > /dev/null 2>&1
#
microk8s config > /home/$SUDO_USER/.kube/config
kubectl config use-context microk8s
echo Installatie KubeADM gestart
snap install kubeadm --classic
#
echo MicroK8S enable addon
microk8s enable dashboard
microk8s enable dns
microk8s enable hostpath-storage
#
############################# SCRIPTS MAKEN ####################################
#
# Docker-CE images ophalen script maken 
echo '#!/bin/bash' > /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo docker pull hello-world >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo docker pull prakhar1989/static-site >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh 
echo docker pull alpine >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo docker pull registry >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo docker pull odoo:latest >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo docker pull nextcloud >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo docker pull mariadb:10.6 >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo docker pull postgres:latest >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo docker pull minio/minio >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
chmod +x /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
#
# Docker-CE demo Alpine script maken 
echo '#!/bin/bash' > /home/$SUDO_USER/docker/alpine-run/alpine-run.sh
echo 'docker run -it alpine /bin/sh' >> /home/$SUDO_USER/docker/alpine-run/alpine-run.sh
chmod +x /home/$SUDO_USER/docker/demo-alpine.sh
#
# Docker Compose demo script NextCloud
echo '#!/bin/bash'> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo '#' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'docker compose -f /home/$USER/docker-compose/nextcloud/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'echo NextCloud port 8888'	>> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
chmod +x /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
#
# Docker Compose demo script ODOO
echo '#!/bin/bash' > /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo '#' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'docker compose -f /home/$USER/docker-compose/odoo/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'echo Odoo port 10016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'echo Chat port 20016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
chmod +x /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
#
# MicroK8S demo 1 deployment NGINX
echo 'kubectl create deployment nginx-webserver --image=nginx' > /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_nginx_webserver.sh
echo 'kubectl expose deployment nginx-webserver --type="NodePort" --port 80' >> /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_nginx_webserver.sh
echo 'kubectl get svc nginx-webserver' >> /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_nginx_webserver.sh
chmod +x /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_nginx_webserver.sh
#
# MicroK8S demo 4 deployment NGINX
echo 'kubectl apply -f /home/$USER/docker-compose/nginx/deployment-scale.yaml' > /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_nginx_4_replicas.sh
echo 'kubectl expose deployment nginx-deployment --type="NodePort" --port 80' >> /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_nginx_4_replicas.sh
echo 'kubectl get svc nginx-deployment' >> /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_nginx_4_replicas.sh
chmod +x /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_nginx_4_replicas.sh
#
# MicroK8S demo MySQL 
echo 'kubectl apply -f /home/$USER/docker-compose/mysql/mysql-pv.yaml' > /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_mysql_single.sh
echo 'kubectl apply -f /home/$USER/docker-compose/mysql/mysql-deployment.yaml' >> /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_mysql_single.sh
echo 'kubectl describe deployment mysql' >> /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_mysql_single.sh
echo 'kubectl describe pvc mysql-pv-claim' >> /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_mysql_single.sh
echo 'kubectl get pods -l app=mysql' >> /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_mysql_single.sh
chmod +x /home/$SUDO_USER/scripts/microk8s_scripts/microK8s_mysql_single.sh
#
echo '#!/bin/bash' > /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
echo '#' >> /.home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
echo '# Minio Object Storage on Docker' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
echo 'docker run -d -p 9000:9000 -p 9001:9001 -p 9090:9090 --name minio -v /home/$USER/data/minio:/data -e "MINIO_ROOT_USER=minio1234" -e "MINIO_ROOT_PASSWORD=minio1234" minio/minio server /data --console-address ":9001"' >>/home/$SUDO_USER/minio_scripts/minio-docker-run.sh
# echo 'echo MINIO_ROOT_USER=minio1234' >>/home/$SUDO_USER/minio_scripts/minio-docker-run.sh
# echo 'echo MINIO_ROOT_PASSWORD=minio1234' >>/home/$SUDO_USER/minio_scripts/minio-docker-run.sh
chmod +x /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
#
########################## YAML FILES ##############################################
#
# JTU
curl -s -o /home/$SUDO_USER/docker-compose/nextcloud/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-nextcloud-vagrant.yml
curl -s -o /home/$SUDO_USER/docker-compose/odoo/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-odoo-vagrant.yml  
# Internet
curl -s -o /home/$SUDO_USER/docker-compose/nginx/deployment-scale.yaml https://k8s.io/examples/application/deployment-scale.yaml
curl -s -o /home/$SUDO_USER/docker-compose/mysql/mysql-pv.yaml https://k8s.io/examples/application/mysql/mysql-pv.yaml
curl -s -o /home/$SUDO_USER/docker-compose/mysql/mysql-deployment.yaml https://k8s.io/examples/application/mysql/mysql-deployment.yaml
#
# Uitloggen om lidmaatschap Docker groep te laden
exit