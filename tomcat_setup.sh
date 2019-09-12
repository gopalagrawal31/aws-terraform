#!/bin/bash

# add dedicated user 
sudo groupadd tomcat
sudo mkdir /opt/tomcat
sudo useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat

#download and install apache tomcat
cd ~
wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz
sudo tar -zxvf apache-tomcat-8.0.33.tar.gz -C /opt/tomcat --strip-components=1

#setup proper permission
cd /opt/tomcat
sudo chgrp -R tomcat conf
sudo chmod g+rwx conf
sudo chmod g+r conf/*
sudo chown -R tomcat logs/ temp/ webapps/ work/

sudo chgrp -R tomcat bin
sudo chgrp -R tomcat lib
sudo chmod g+rwx bin
sudo chmod g+r bin/*

sudo systemctl start tomcat.service
sudo systemctl enable tomcat.service
