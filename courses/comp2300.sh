#! /bin/bash
# Install the COMP2300 dependencies:
#   GCC et al
#   Java
#   rPeANUt <3

############################################
# install build-essentials
apt-get -y install build-essential

############################################
# Lets get us some java!
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y install oracle-java8-installer

############################################
# Lets grap some rPeANUt
apt-get install -y curl
for file in rPeANUt2.4.jar rPeANUt2.1spec.pdf; do
    curl -# --create-dirs -o /usr/share/rPeANUt/$file http://cs.anu.edu.au/courses/COMP2300/rpeanut/$file
done

# make it accessable
chmod 755 /usr/share/rPeANUt
chmod -R 755 /usr/share/rPeANUt/

# rPeANUt launcher
echo "#! /bin/bash
java -jar /usr/share/rPeANUt/rPeANUt2.4.jar" > /usr/bin/run_rPeANUt
chmod 755 /usr/bin/run_rPeANUt

# application screen entry
echo "[Desktop Entry]
Type=Application
Name=rPeANUt simulator
Exec=/usr/bin/java -jar /usr/share/rPeANUt/rPeANUt2.4.jar" > /usr/share/applications/rPeANUt.desktop
