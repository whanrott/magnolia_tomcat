# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
	config.vm.hostname = 'medlearn.local'
	config.vm.box = "ubuntu/trusty64"
	config.vm.network "private_network", ip: "192.168.33.15"
	config.vm.synced_folder "./medlearn/", "/var/lib/tomcat", create: true, owner: 'www-data', group: 'www-data'
	config.vm.provider "virtualbox" do |vb|
		vb.name = "medlearn"
		vb.memory = 1024
		vb.cpus = 2
	end
	config.vm.provision "shell", inline: <<-SHELL
		sudo bash /vagrant/provision.sh
	SHELL
end
