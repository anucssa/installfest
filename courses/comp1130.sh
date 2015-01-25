#! /bin/bash
# Install the COMP1130 requirements
#   COMP1100
#   GPS

###################################
# Grab the 1100 stuff
/bin/bash ./courses/comp1100.sh

###################################
# find our gps
apt-get -y install gnat-gps

# application screen entry
echo "[Desktop Entry]
Type=Application
Name=gnat-gps
Exec=/usr/bin/gnat-gps" > /usr/share/applications/gnat-gps.desktop
