#! /bin/bash
#
#
# Windows SubSystem for Linux (WSL) versie 2 
# Docker en MicroK8S (Kubernetes) configuratie SCRIPT
#
# Versie: 1.2.3 d.d. 26-10-2023
# Auteur: John Tutert
#
# Changelog
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
# Dockerfiles 
mkdir -p /home/$SUDO_USER/docker
# Docker Compose 
mkdir -p /home/$SUDO_USER/docker-compose
mkdir -p /home/$SUDO_USER/docker-compose/mysql
mkdir -p /home/$SUDO_USER/docker-compose/nextcloud
mkdir -p /home/$SUDO_USER/docker-compose/nginx
mkdir -p /home/$SUDO_USER/docker-compose/odoo
mkdir -p /home/$SUDO_USER/docker-compose/prometheus-grafana
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
mkdir -p /home/$SUDO_USER/scripts/tmp
# Scripts DOCKER-CE
mkdir -p /home/$SUDO_USER/scripts/docker
mkdir -p /home/$SUDO_USER/scripts/docker/alpine-run
mkdir -p /home/$SUDO_USER/scripts/docker/pull-images
# Scripts DOCKER COMPOSE
mkdir -p /home/$SUDO_USER/scripts/docker-compose
mkdir -p /home/$SUDO_USER/scripts/docker-compose/mysql
mkdir -p /home/$SUDO_USER/scripts/docker-compose/nextcloud
mkdir -p /home/$SUDO_USER/scripts/docker-compose/nginx
mkdir -p /home/$SUDO_USER/scripts/docker-compose/odoo
# Scripts Kubernetes MicroK8S Minikube 
mkdir -p /home/$SUDO_USER/scripts/kubernetes
# Scripts MinIO
mkdir -p /home/$SUDO_USER/scripts/minio_scripts
# Intro Infrastructuren
mkdir -p /home/$SUDO_USER/scripts/intro_infra
# tmp directory 
mkdir -p /home/$SUDO_USER/tmp
#
mkdir -p /home/$SUDO_USER/yaml
mkdir -p /home/$SUDO_USER/yaml/kubernetes
mkdir -p /home/$SUDO_USER/yaml/kubernetes/mysql
mkdir -p /home/$SUDO_USER/yaml/kubernetes/nginx
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
echo Installatie COCKPIT op poort 1234
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
# #
# ############### MicroK8S ################
# #
# # Installatie MicroK8S
# echo Installatie MicroK8S mbv SNAP gestart
# snap install microk8s --classic --channel=latest > /dev/null 2>&1
# # Gebruiker toevoegen aan groep microk8s
# usermod -a -G microk8s $SUDO_USER
# # Directory maken voor settings 
# mkdir /home/$SUDO_USER/.kube
# chown -f -R $SUDO_USER /home/$SUDO_USER/.kube
# # Uitvragen MicroK8S configuratie en opslaan in config bestand 
# microk8s config > /home/$SUDO_USER/.kube/config
# # MicroK8S Enable ADD ons
# echo MicroK8S enable addon
# # microk8s enable community 
# microk8s enable dashboard
# # microk8s enable gpu 
# microk8s enable dns
# # microk8s enable hostpath-storage
# # Configuratie Firewall
# ufw allow in on cni0 > /dev/null 2>&1
# ufw allow out on cni0 > /dev/null 2>&1
# ufw default allow routed > /dev/null 2>&1
# #
# ############### KubeADM ################
# #
# # KubeADM is beheerstool voor maken van Kubernetes en MicroK8S Cluster
# #
# # Installatie KubeADM
# echo Installatie KubeADM mbv SNAP gestart
# snap install kubeadm --classic --channel=latest > /dev/null 2>&1
##
#
############### MiniKube ################
#
echo 'Minikube downloaden installeren en configureren'
# Minikube downloaden
curl -o /home/$SUDO_USER/tmp/minikube_latest_amd64.deb https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
# Installatie Minikube
dpkg -i /home/$SUDO_USER/tmp/minikube_latest_amd64.deb
# Verwijderen download package 
rm /home/$SUDO_USER/tmp/minikube_latest_amd64.deb
# Configuratie minikube 
minikube config set driver docker
minikube config set memory 4096
minikube config set cpus 4 
#
############### KubeCTL ################
#
# KubeCTL is beheerstool voor configuratie van Kubernetes en MicroK8S cluster
# Hiermee kunnen bijvoorbeeld apply worden gedaan van YAML bestanden
#
# Installatie KubeCTL
echo Installatie KubeCTL mbv SNAP gestart
snap install kubectl --classic --channel=latest > /dev/null 2>&1
# # Configuratie KubeCTL voor MicroK8S
# kubectl config use-context microk8s --kubeconfig="/home/$SUDO_USER/.kube/config"
#
############################# SCRIPTS MAKEN ####################################
#
echo 'Scripts maken'
# Docker-CE images ophalen script maken 
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo Hello World >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull hello-world > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo prakhar1989 static-site >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull prakhar1989/static-site > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh 
echo echo Alpine Linux >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull alpine > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo Debian Linux >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull debian > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo MariaDB DBMS >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull mariadb:10.6 > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo MinIO >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull minio/minio > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo NextCloud >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull nextcloud > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo NGNINX >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull nginx > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo ODOO ERP >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull odoo:latest > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo Postgress DBMS >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull postgres:latest > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo Registry >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull registry > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo Ubuntu 20 04 LTS >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull ubuntu:20.04 > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo echo WordPress >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
echo 'docker pull wordpress > /dev/null 2>&1' >> /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
chmod +x /home/$SUDO_USER/scripts/docker/pull-images/docker-pull-images.sh
#
# Docker-CE demo Alpine script maken
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
echo 'clear' >> /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
echo 'docker run -it alpine /bin/sh' >> /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
chmod +x /home/$SUDO_USER/scripts/docker/alpine-run/alpine-run.sh
#
# Docker Compose demo script NextCloud
echo '#! /bin/bash'> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo '#' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'clear' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'docker compose -f /home/$USER/docker-compose/nextcloud/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'echo NextCloud port 8888'	>> /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
chmod +x /home/$SUDO_USER/scripts/docker-compose/nextcloud/docker-compose-nextcloud.sh
#
# Docker Compose demo script ODOO
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo '#' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'clear' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'docker compose -f /home/$USER/docker-compose/odoo/docker-compose.yml up --quiet-pull -d' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'echo Odoo port 10016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
echo 'echo Chat port 20016' >> /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
chmod +x /home/$SUDO_USER/scripts/docker-compose/odoo/docker-compose-odoo.sh
#
# Kubernetes MicroK8S Minikube demo simple deployment NGINX
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'clear' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'kubectl create deployment nginx-webserver --image=nginx' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'kubectl expose deployment nginx-webserver --type="NodePort" --port 80' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'kubectl describe deployment nginx-webserver' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'kubectl get svc nginx-webserver' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
echo 'minikube service --all' >> /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_simple_deployment_nginx.sh
#
# Kubernetes MicroK8S Minikube demo deployment NGINX stap 1
# Stap 1 is deployment van omgeving met NGINX versie 14
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'clear' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'kubectl get pods -l app=nginx' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
echo 'minikube service --all' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_1.sh
#
# Kubernetes MicroK8S Minikube demo deployment NGINX stap 2
# Stap 2 is updaten van NGINX van versie 14 naar versie 16
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'clear' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment-update.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'kubectl get pods -l app=nginx' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
echo 'minikube service --all' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_2.sh
#
# Kubernetes MicroK8S Minikube demo deployment NGINX stap 3
# Stap 3 is replicatecount van 2 naar 4 bijwerken 
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'clear' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/nginx/deployment-scale.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'kubectl describe deployment nginx-deployment' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'kubectl get pods -l app=nginx' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
echo 'minikube service --all' >> /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_nginx_deployment_stap_3.sh
#
# Kubernetes MicroK8S Minikube demo MySQL 
# mysql-pv is persistant volume
# mysql-deployment is deployment van mysql met gebruik van persistant volume claim 
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'cd /home/$USER' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'clear' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/mysql/mysql-pv.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl apply -f /home/$USER/yaml/kubernetes/mysql/mysql-deployment.yaml' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl describe deployment mysql' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl describe pvc mysql-pv-claim' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
echo 'kubectl get pods -l app=mysql' >> /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
chmod +x /home/$SUDO_USER/scripts/kubernetes/k8s_mysql_single.sh
#
echo '#! /bin/bash' > /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
echo '#' >> /home/$SUDO_USER/scripts/minio_scripts/minio-docker-run.sh
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
########################## YAML FILES Ophalen ##############################################
#
echo 'YAML bestanden downloaden'
# Docker Compose
#
# JTU
curl -s -o /home/$SUDO_USER/docker-compose/nextcloud/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-nextcloud-vagrant.yml
curl -s -o /home/$SUDO_USER/docker-compose/odoo/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-odoo-vagrant.yml  
# awesome compose
curl -s -o /home/$SUDO_USER/docker-compose/prometheus-grafana/prometheus-grafana.yml https://raw.githubusercontent.com/docker/awesome-compose/master/prometheus-grafana/compose.yaml
curl -s -o /home/$SUDO_USER/docker-compose/nextcloud/nextcloud-redis-mariadb.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nextcloud-redis-mariadb/compose.yaml
curl -s -o /home/$SUDO_USER/docker-compose/nginx/nginx-flask-mysql.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mysql/compose.yaml
curl -s -o /home/$SUDO_USER/docker-compose/nginx/nginx-flask-mongo.yaml.yml https://raw.githubusercontent.com/docker/awesome-compose/master/nginx-flask-mongo/compose.yaml
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
echo '# start with OS ubuntu' > /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'FROM ubuntu:latest' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'RUN apt-get update' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'RUN apt-get -y upgrade' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo '# install apache2 in noninteractivemode' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo '# copy website' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'COPY index.html /var/www/html/' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo '# start webserver' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'CMD /usr/sbin/apache2ctl -D FOREGROUND' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo '# expose port 80' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
echo 'EXPOSE 80' >> /home/$SUDO_USER/docker/ubtu-apache-dkr-file
#
# Thats all folks 
#
# Uitloggen om lidmaatschap Docker groep te laden
exit