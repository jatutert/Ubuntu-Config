	#
	# Aanmaken ubuntu_init_change_repo Script 
	#
	#! /bin/bash
	#
	# mkdir /home/vagrant/scripts > /dev/null 2>&1
	# mkdir /home/vagrant/scripts/ubuntu_init_scripts > /dev/null 2>&1
	#
	# create script
	echo '#! /bin/bash' > /home/vagrant/scripts/ubuntu_init_scripts/ubuntu-init-change-repo.sh
	echo '#' >> /home/vagrant/scripts/ubuntu_init_scripts/ubuntu-init-change-repo.sh
	echo '# Change Ubuntu Reposiory to nl.archive.ubuntu.com' >> /home/vagrant/scripts/ubuntu_init_scripts/ubuntu-init-change-repo.sh
	echo '# (c) 2023 John Tutert' >> /home/vagrant/scripts/ubuntu_init_scripts/ubuntu-init-change-repo.sh
	echo '#' >> /home/vagrant/scripts/ubuntu_init_scripts/ubuntu-init-change-repo.sh
	echo '# Aanpassen sources.list' >> /home/vagrant/scripts/ubuntu_init_scripts/ubuntu-init-change-repo.sh
	echo "sudo sed 's@archive.ubuntu.com@nl.archive.ubuntu.com@' -i /etc/apt/sources.list" >> /home/vagrant/scripts/ubuntu_init_scripts/ubuntu-init-change-repo.sh
	echo "sudo sed 's@mirrors.edge.kernel.org@nl.archive.ubuntu.com@' -i /etc/apt/sources.list" >> /home/vagrant/scripts/ubuntu_init_scripts/ubuntu-init-change-repo.sh
	sudo chmod +x /home/vagrant/scripts/ubuntu_init_scripts/ubuntu-init-change-repo.sh