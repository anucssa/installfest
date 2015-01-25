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
