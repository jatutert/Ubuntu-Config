	#
	#
	#	MinIO Object Storage installatie op Linux (manier 3) 
	#	Handleiding: https://min.io/docs/minio/linux/index.html
	#  
	# 
	# Naslag: 
	# https://www.digitalocean.com/community/tutorials/how-to-set-up-minio-object-storage-server-in-standalone-mode-on-ubuntu-20-04
	# https://gist.github.com/kstevenson722/e7978a75aec25feaa6ad0965ec313e2d
	#
	#
	#! /bin/bash
	#
	# create script
	#
	#	[Header]
			echo '#! /bin/bash' > /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '#' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '# MinIO Native Installatie' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '# (c) 2023 John Tutert' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '#' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '# Toevoegen Repository' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Server Installatie]
			echo 'mkdir -p /home/vagrant/tmp' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'curl -s -o /home/vagrant/tmp/minio_20230920224955.0.0_amd64.deb https://dl.min.io/server/minio/release/linux-amd64/minio_20230920224955.0.0_amd64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'sudo dpkg -i /home/vagrant/tmp/minio_20230920224955.0.0_amd64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'rm /home/vagrant/tmp/minio_20230920224955.0.0_amd64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Groepen/Gebruikers]
			echo sudo groupadd -r minio-user >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo sudo useradd -M -r -g minio-user minio-user >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Storage Folder]
			echo sudo mkdir /mnt/data >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo sudo chown minio-user:minio-user /mnt/data >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Configuratie]
			echo 'echo MINIO_VOLUMES="/mnt/data" >> /etc/default/minio' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'echo MINIO_OPTS="--certs-dir /home/vag.rant/.minio/certs --console-address :9001" >> /etc/default/minio' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'echo MINIO_ROOT_USER=minioadmin >> /etc/default/minio' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'echo MINIO_ROOT_PASSWORD=minioadmin >> /etc/default/minio' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO UFW poorten openzetten]
			echo sudo ufw allow 9000:9001/tcp >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[Starten MinIO Server]
			echo sudo systemctl start minio >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo sudo systemctl enable minio >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Client Installatie]
			echo 'mkdir -p /home/vagrant/tmp' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'curl -s -o /home/vagrant/tmp/mcli_20230920152231.0.0_arm64.deb https://dl.min.io/client/mc/release/linux-amd64/mcli_20230920152231.0.0_arm64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'sudo dpkg -i /home/vagrant/tmp/mcli_20230920152231.0.0_arm64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'rm /home/vagrant/tmp/mcli_20230920152231.0.0_arm64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[KubeCTL MinIO Plugin]
			#
			# 	https://min.io/docs/minio/kubernetes/upstream/reference/kubectl-minio-plugin.html
			#	https://www.origo.io/info/stabiledocs/guides/minio-object-storage-service/
			#	echo wget https://github.com/minio/operator/releases/download/v5.0.6/kubectl-minio_5.0.6_linux_amd64 -O kubectl-minio >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			#	echo chmod +x kubectl-minio >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			#	echo sudo mv kubectl-minio /usr/local/bin/ >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			#
			# 	https://www.olivercoding.com/2021-03-01-kubernetes-minio-init/
			# 	echo kubectl create namespace minio-operator >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			# 	echo kubectl minio init --namespace minio-operator >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			#
	sudo chmod +x /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
