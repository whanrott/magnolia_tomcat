# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
	config.vm.hostname = 'medlearn.local'
	config.vm.box = "ubuntu/trusty64"
#	config.vm.box = "ubuntu/precise32"
	config.vm.network "private_network", ip: "192.168.33.15"
	config.vm.synced_folder "./medlearn/", "/var/lib/tomcat6", create: true, owner: 'www-data', group: 'www-data'
        config.vm.synced_folder "./magnolia5/", "/var/lib/tomcat7", create: true, owner: 'www-data', group: 'www-data'
	config.vm.provider "virtualbox" do |vb|
		vb.name = "medlearn"
		vb.memory = 2048
		vb.cpus = 2
	end
	config.vm.provision "shell", inline: <<-SHELL
# provisioner with java fix installs earlier version of java JRE to avoid security error.
# this is intended as a temporary workaround
		sudo bash /vagrant/provision_java_fix.sh
	SHELL
end
