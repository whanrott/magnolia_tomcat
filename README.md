# magnolia_tomcat
vagrant box for Magnolia CMS on Tomcat. Used for migration testing.

# sytem requirements

* [Oracle VirtualBox][1]
* [Vagrant][2]

I have also used vagrant plugins. These are optional but may be useful:
* vagrant-auto_network
* vagrant-hostsupdater
* vagrant-nfs_guest
* vagrant-vbguest

To install a vagrant plugin, run ```vagrant plugin install``` plus the name of the plugin

# Magnolia installation instructions

* clone this repository to your local machine
* start it using ```vagrant up```

The script will build apache tomcat v6.0.29. MSDLT instance of Magnolia uses 6.0.35 (at the
time of writing). 

Your vagrant box is up and the provisioning script has run. Now:

* remove the contents of webapps folder in medlearn ```rm -rf medlearn/webapps/*```
* copy the contents of webapps from the live server into the cleaned webapps folder 
  ```cp -r <path-to>webapps/* medlearn/webapps```
* copy password reset file to webapps ```cp recovery-script.jsp medlearn/webapps/medlearnAuthor/WEB-INF/```
* edit the setenv.sh file to correct the -a switch to -e ```vi medlearn/bin/setenv.sh``` 
* ssh into the vagrant box and restart magnolia:
  * ```vagrant ssh```
  * ```cd /var/lib/tomcat```
  * ```sudo -u www-data sh bin/magnolia_control.sh stop```
  * ```sudo -u www-data sh bin/magnolia_control.sh start```

The site will now be available in your browser but the password is salted and so needs resetting using 
the file which you copied earlier. the web.xml document also needs editing [as set out in the docs][3].

When the steps above are complete, find the site at http://medlearn.local:8080/medlearnAuthor/ and login using
the default password. Don't forget that when you redeploy the site to live this password will need to be
reset using the same method.

[1]:https://www.virtualbox.org/
[2]:http://www.vagrantup.com/
[3]:https://documentation.magnolia-cms.com/display/WIKI/Reset+superuser+account
