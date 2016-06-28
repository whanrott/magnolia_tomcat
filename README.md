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

The script will build apache tomcat v6.0.29 and Magnolia 4.4.2. The MSDLT instance of Magnolia uses
Tomcat 6.0.35 and Magnolia 4.4.2 (at the time of writing). 

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

# Next steps

When the steps above are complete, find the site at http://medlearn.local:8080/medlearnAuthor/ and login using
the default password. Don't forget that when you redeploy the site to live this password will need to be
reset using the same method. It will then need to be changed to something secure.

Once you have 4.4.2 running, you will need to to a [minor update][4] to at least 4.4.6

The [migration documentation][5] recommends that you install the [Standard Templating Kit (STK)][6]
 and export to static html. You will need the instructions on [how to install a module][7]. I successfully
installed [STK version 1.3.5][9]. To install this, download the zip/tar file. Extract the contents to the
folder ```/var/lib/tomcat/webapps/medlearnAuthor/WEB-INF/lib```, start the server and then wait. On my VM it
takes 1 to 2 minutes. You can track it using tail -f /var/lib/tomcat/logs/catalina.out. When it's ready you
will see `INFO: Server startup in xxxxx ms```. Now refresh the AdminCentral page until it shows the install process.
If you get 404 or other 40_ errors for admincentral then check that Tomcat is working: ```http://tomcat.local:8080/```

I'm trying to follow the 4.4 to 4.5 upgrade which appears to mandate Eclipse. There is a [setup guide][8].

NB: 

[1]:https://www.virtualbox.org/
[2]:http://www.vagrantup.com/
[3]:https://documentation.magnolia-cms.com/display/WIKI/Reset+superuser+account
[4]:https://documentation.magnolia-cms.com/display/DOCS45/Updating
[5]:
[6]:https://documentation.magnolia-cms.com/display/DOCS53/Standard+Templating+Kit+module
[7]:https://documentation.magnolia-cms.com/display/DOCS53/Installing+a+module
[8]:https://documentation.magnolia-cms.com/display/DEV/Eclipse+setup8
[9]:https://nexus.magnolia-cms.com/content/repositories/magnolia.public.releases/info/magnolia/magnolia-standard-templating-kit-bundle/1.3.5/
