#! /bin/bash
# Install the COMP2100 dependencies:
#      Java8
#      Eclipse

############################################
# Lets get us some java!
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y install oracle-java8-installer

# Install Eclipse
sudo apt-get -y install eclipse
