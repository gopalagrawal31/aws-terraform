echo "Installing jav"
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install openjdk-8-jdk

echo "Installing tomcat, maven & git-core"
sudo apt-get update
sudo apt-get install tomcat7-docs tomcat7-admin tomcat7-examples
sudo service tomcat7 restart

