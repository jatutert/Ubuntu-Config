#!/bin/bash
#
#
#	Windows SubSystem for Linux (WSL) versie 2 
#	Docker en MicroK8S (Kubernetes) configuratie SCRIPT
#
#	Versie: 1.1 d.d. 21-09-2023
#	Auteur: John Tutert
#
#
# Start melding aanmaken
# PRETTY_NAME=$(grep -oP '(?<=^PRETTY_NAME=).+' /etc/os-release | tr -d '"')
# NAME=$(grep -oP '(?<=^NAME=).+' /etc/os-release | tr -d '"')
# VERSION=$(grep -oP '(?<=^VERSION=).+' /etc/os-release | tr -d '"')
# VERSION_ID=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
# VERSION_CODENAME=$(grep -oP '(?<=^VERSION_CODENAME=).+' /etc/os-release | tr -d '"')
# echo 'Configuratie van' $NAME $VERSION 'gestart'
# Repository Ubuntu aanpassen naar nl.archive.ubuntu.com 
sed 's@archive.ubuntu.com@nl.archive.ubuntu.com@' -i /etc/apt/sources.list
# Updaten APT Repository nav verandering in nl.archive.ubuntu.com
apt update -qq -y
# Upgraden 
apt upgrade -qq -y
# Verwijderen niet noodzakelijke onderdelen 
apt autoremove -qq -y
# Configuratie TijdZone
timedatectl set-timezone Europe/Amsterdam
#	Installatie tools 
apt install -y mc screenfetch open-vm-tools wget
# 	Installatie cockpit (poort 9090) 
apt-get install cockpit -y 			> /dev/null 2>&1
systemctl enable --now cockpit.socket	> /dev/null 2>&1
systemctl daemon-reload
systemctl restart cockpit.socket
#
#	#################### DOCKER #############################################################
#
# Installatie Docker-CE (HashiCORP) 
apt-get install -qq -y --force-yes curl apt-transport-https
apt-get purge -qq -y lxc-docker* || true 
curl -sSL https://get.docker.com/ | sh 
service docker start
usermod -a -G docker $USER
# Docker-CE omgeving
mkdir /home/$USER/docker
# Docker-CE images ophalen script maken 
echo '#!/bin/bash' 					 > /home/$USER/docker/pull-images.sh
echo docker pull hello-world 		>> /home/$USER/docker/pull-images.sh
echo docker pull prakhar1989/static-site >> /home/$USER/docker/pull-images.sh 
echo docker pull alpine 			>> /home/$USER/docker/pull-images.sh
echo docker pull registry  			>> /home/$USER/docker/pull-images.sh
echo docker pull odoo:latest		>> /home/$USER/docker/pull-images.sh
echo docker pull nextcloud			>> /home/$USER/docker/pull-images.sh
echo docker pull mariadb:10.6		>> /home/$USER/docker/pull-images.sh
echo docker pull postgres:latest	>> /home/$USER/docker/pull-images.sh
echo docker pull minio/minio		>> /home/$USER/docker/pull-images.sh
chmod +x /home/$USER/pull-images.sh
# Docker-CD demo Alpine script maken 
echo '#!/bin/bash' 					 > /home/$USER/docker/demo-alpine.sh
echo 'docker run -it alpine /bin/sh'	>> /home/$USER/docker/demo-alpine.sh
#
#	#################### DOCKER COMPOSE ######################################################
#
# Docker Compose demo omgeving
mkdir /home/$USER/docker-compose 			> /dev/null 2>&1	
# Docker Compose demo data 
mkdir /home/$USER/data 						> /dev/null 2>&1
# Docker Compose demo NextCloud
mkdir /home/$USER/docker-compose/nextcloud 	> /dev/null 2>&1
# Docker Compose demo data NextCloud 
mkdir /home/$USER/data/nextcloud 			> /dev/null 2>&1				
mkdir /home/$USER/data/nextcloud/html 		> /dev/null 2>&1
mkdir /home/$USER/data/nextcloud/html/data 	> /dev/null 2>&1
# Ophalen YAML 
sudo curl -o /home/$USER/docker-compose/nextcloud/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-nextcloud-vagrant.yml
# Docker Compose demo script NextCloud
echo '#!/bin/bash' 				 > /home/$USER/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo '#' 						>> /home/$USER/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'cd /home/$USER' 			>> /home/$USER/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'docker compose -f /home/$USER/docker-compose/nextcloud/docker-compose.yml up --quiet-pull -d' >> /home/$USER/docker-compose/nextcloud/docker-compose-nextcloud.sh
echo 'echo NextCloud port 8888'	>> /home/$USER/docker-compose/nextcloud/docker-compose-nextcloud.sh
chmod +x /home/$USER/docker-compose/nextcloud/docker-compose-nextcloud.sh
# Docker Compose demo omgeving
mkdir /home/$USER/docker-compose 			> /dev/null 2>&1
# Docker Compose demo data 
mkdir /home/$USER/data						> /dev/null 2>&1
# Docker Compose demo ODOO
mkdir /home/$USER/docker-compose/odoo 		> /dev/null 2>&1
# Docker Compose demo ODOO ERP data 
mkdir /home/$USER/data/odoo					> /dev/null 2>&1
mkdir /home/$USER/data/odoo/postgresql		> /dev/null 2>&1
mkdir /home/$USER/data/odoo/addons 			> /dev/null 2>&1
mkdir /home/$USER/data/odoo/etc				> /dev/null 2>&1
# Ophalen YAML 
sudo curl -o /home/$USER/docker-compose/odoo/docker-compose.yml https://raw.githubusercontent.com/jatutert/docker-compose-yaml/main/docker-compose-odoo-vagrant.yml  
# Docker Compose demo script ODOO
echo '#!/bin/bash' 			 	 > /home/$USER/docker-compose/odoo/docker-compose-odoo.sh
echo '#' 						>> /home/$USER/docker-compose/odoo/docker-compose-odoo.sh
echo 'cd /home/vagrant' 		>> /home/$USER/docker-compose/odoo/docker-compose-odoo.sh
echo 'docker compose -f /home/$USER/odoo/docker-compose.yml up --quiet-pull -d' >> /home/vagrant/docker-compose/odoo/docker-compose-odoo.sh
echo 'echo Odoo port 10016'	 	>> /home/$USER/docker-compose/odoo/docker-compose-odoo.sh
echo 'echo Chat port 20016' 	>> /home/$USER/docker-compose/odoo/docker-compose-odoo.sh
chmod +x /home/$USER/docker-compose/odoo/docker-compose-odoo.sh
#
#	#################### MicroK8S #############################################################
#
# Installatie MicroK8S
snap install microk8s --classic --channel=1.28/stable
# Configuratie Firewall voor MicroK8S
ufw allow in on cni0
ufw allow out on cni0
ufw default allow routed
# Configuratie MicroK8S
usermod -a -G microk8s $USER
chown -f -R $USER ~/.kube
snap install kubectl --classic
mkdir /home/$USER/.kube
microk8s config > /home/$USER/.kube/config
kubectl config use-context microk8s
snap install kubeadm --classic
# Configuratie MicroK8S plugins 
microk8s enable dashboard
microk8s enable dns
microk8s enable hostpath-storage
# Maken Directory voor demo's MicroK8S
mkdir /home/$USER/microk8s_scripts > /dev/null 2>&1
# Maken script voor demo NGINX 1x
echo 'kubectl create deployment nginx-webserver --image=nginx' > /home/$USER/microk8s_scripts/microK8s_nginx_webserver.sh
echo 'kubectl expose deployment nginx-webserver --type="NodePort" --port 80' >> /home/$USER/microk8s_scripts/microK8s_nginx_webserver.sh
echo 'kubectl get svc nginx-webserver' >> /home/$USER/microk8s_scripts/microK8s_nginx_webserver.sh
chmod +x /home/$USER/microk8s_scripts/microK8s_nginx_webserver.sh
# Maken script voor demo NGINX 4x
echo 'kubectl apply -f https://k8s.io/examples/application/deployment-scale.yaml' > /home/$USER/microk8s_scripts/microK8s_nginx_4_replicas.sh
echo 'kubectl expose deployment nginx-deployment --type="NodePort" --port 80' >> /home/$USER/microk8s_scripts/microK8s_nginx_4_replicas.sh
echo 'kubectl get svc nginx-deployment' >> /home/$USER/microk8s_scripts/microK8s_nginx_4_replicas.sh
chmod +x /home/$USER/microk8s_scripts/microK8s_nginx_4_replicas.sh
# Maken script voor demo MySQL 
echo 'kubectl apply -f https://k8s.io/examples/application/mysql/mysql-pv.yaml' > /home/$USER/microk8s_scripts/microK8s_mysql_single.sh
echo 'kubectl apply -f https://k8s.io/examples/application/mysql/mysql-deployment.yaml' >> /home/$USER/microk8s_scripts/microK8s_mysql_single.sh
echo 'kubectl describe deployment mysql' >> /home/$USER/microk8s_scripts/microK8s_mysql_single.sh
echo 'kubectl describe pvc mysql-pv-claim' >> /home/$USER/microk8s_scripts/microK8s_mysql_single.sh
echo 'kubectl get pods -l app=mysql' >> /home/$USER/microk8s_scripts/microK8s_mysql_single.sh
chmod +x /home/$USER/microk8s_scripts/microK8s_mysql_single.sh
#
#	#################### MinIO #############################################################
#
mkdir /home/$USER/minio_scripts > /dev/null 2>&1
echo '#!/bin/bash' 								 > /home/$USER/minio_scripts/minio-docker-run.sh
echo '#' 										>> /home/$USER/minio_scripts/minio-docker-run.sh
echo '# Minio Object Storage on Docker' 		>> /home/$USER/minio_scripts/minio-docker-run.sh
echo 'mkdir /home/$USER/minio' 					>> /home/$USER/minio_scripts/minio-docker-run.sh
echo 'mkdir /home/$USER/minio/data' 			>> /home/$USER/minio_scripts/minio-docker-run.sh
echo 'docker run -d -p 9000:9000 -p 9001:9001 -p 9090:9090 --name minio -v /home/$USER/minio/data:/data -e "MINIO_ROOT_USER=minio1234" -e "MINIO_ROOT_PASSWORD=minio1234" minio/minio server /data --console-address ":9001"' >>/home/$USER/minio_scripts/minio-docker-run.sh
#	echo 'echo MINIO_ROOT_USER=minio1234' 		>>/home/$USER/minio_scripts/minio-docker-run.sh
#	echo 'echo MINIO_ROOT_PASSWORD=minio1234' 	>>/home/$USER/minio_scripts/minio-docker-run.sh
chmod +x /home/$USER/minio_scripts/minio-docker-run.sh
# Herstarten WSL2 
shutdown -r now 