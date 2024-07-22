	#
	# Aanmaken HashiCorp Terraform installatie Script
	#
	#! /bin/bash
	#
	# mkdir /home/vagrant/scripts/terraform_scripts > /dev/null 2>&1
	#
	# create script 
	echo '#!/bin/bash' > /home/vagrant/scripts/terraform_scripts/terraform-linux-install.sh
	echo 'sudo snap install terraform' >> /home/vagrant/scripts/terraform_scripts/terraform-linux-install.sh
	#
	sudo chmod +x /home/vagrant/scripts/terraform_scripts/terraform-linux-install.sh