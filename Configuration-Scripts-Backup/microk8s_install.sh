	#
	#
	#! /bin/bash
	#
	# create script 
	echo '#! /bin/bash' > /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'echo MicroK8S KubeCTL KubeADM Installation Script' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'echo WARNING !' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'echo This virtual machine will be rebooted at the end of this script !'  >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[1] Installatie MicroK8S versie 1.28 (UpStream Kubernetes) 16 augustus 2023
	#
	echo 'sudo snap install microk8s --classic --channel=latest > /dev/null 2>&1'	>> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[2] Configuratie Firewall 
	#
	echo 'sudo ufw allow in on cni0 > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'sudo ufw allow out on cni0 > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'sudo ufw default allow routed > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[3] Gebruiker Vagrant toevoegen aan groep
	#
	echo 'sudo usermod -a -G microk8s vagrant' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[4] Directory Kube 
	#
	echo 'sudo mkdir /home/vagrant/.kube' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'sudo chown -f -R vagrant ~/.kube' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[5] Configuratie KubeCTL MicroK8S
	#	https://anaisurl.com/kubernetes-kubectl-microk8s/
	#
	echo 'sudo microk8s config > /home/vagrant/.kube/config' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[6] Installatie KubeCTL
	#	https://anaisurl.com/kubernetes-kubectl-microk8s/
	#
	echo 'sudo snap install kubectl --classic --channel=latest > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[7]	Configuratie KubeCTL
	#
	echo 'kubectl config use-context microk8s --kubeconfig="/home/vagrant/.kube/config"' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[8] Installatie KubeAdm
	#
	echo 'sudo snap install kubeadm --classic --channel=latest > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[8] Enable van Add-Ons op MicroK8S
	echo 'sudo microk8s enable dashboard' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	# echo 'sudo microk8s enable dns' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	# echo 'sudo microk8s enable hostpath-storage' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[9] DEMO Deployment van NGINX op MicroK8S
	#	https://thenewstack.io/kubernetes-101-deploy-your-first-application-with-microk8s/
	#
	echo '#! /bin/bash' > /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'cd /home/$USER' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'clear' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	#
	echo 'kubectl get nodes' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl get pods' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl create deployment nginx-webserver --image=nginx' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl expose deployment nginx-webserver --type="NodePort" --port 80' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl get pods' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl get svc nginx-webserver' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	chmod +x /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	#
	#	[10] DEMO Deployment van NGINX op MicroK8S met 4 replicas 
	#	https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/
	#
	curl -s -o /home/vagrant/microk8s_demos/nginx/deployment-scale.yaml https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/deployment-scale.yaml
	#
	echo '#! /bin/bash' > /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	echo 'cd /home/$USER' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	echo 'clear' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	#
	echo 'kubectl apply -f /home/vagrant/microk8s_demos/nginx/deployment-scale.yaml' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	echo 'kubectl expose deployment nginx-deployment --type="NodePort" --port 80' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	echo 'kubectl get svc nginx-deployment' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	#
	chmod +x /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	#
	#	[11] DEMO Deployment van MySQL 
	#	https://kubernetes.io/docs/tasks/run-application/run-single-instance-stateful-application/
	#
	curl -s -o /home/vagrant/docker-compose/mysql/mysql-pv.yaml https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/mysql/mysql-pv.yaml
	curl -s -o /home/vagrant/docker-compose/mysql/mysql-deployment.yaml https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/mysql/mysql-deployment.yaml
	#
	echo '#! /bin/bash' > /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	echo 'cd /home/$USER' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	echo 'clear' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	# Deploy the PV and PVC of the YAML file
	echo 'kubectl apply -f /home/vagrant/docker-compose/mysql/mysql-pv.yaml' > /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	# Deploy the contents of the YAML file
	echo 'kubectl apply -f /home/vagrant/docker-compose/mysql/mysql-deployment.yaml' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	echo 'kubectl describe deployment mysql' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	echo 'kubectl describe pvc mysql-pv-claim' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	echo 'kubectl get pods -l app=mysql' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	chmod +x /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	#	Herstarten om autorisatie MicroK8S voor gebruiker vagrant te laden
	#
	echo 'echo Restart of this virtual machine started' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'echo use vagrant ssh $HOSTNAME after reboot to return to virtual machine again' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'sudo shutdown -r now' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	sudo chmod +x /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh