#! /bin/bash

##############################################
# Install a course found in the courses folder
# $1: name of course
function install_course () {
    # Check that course exists
    if [ ! -e "./courses/$1.sh" ]; then
        echo "$1 isn't a valid course"
        return
    fi

    echo "configuring for $1"
    /bin/bash "./courses/$1.sh"
    echo "configured"
}

##############################################
# Main script
# Installs the "base" course by default
# All other args are assumed to be courses to install

# Check if executing as root
if [ "$(id -u )" != "0" ]; then
    echo "must execute as root"
    exit 1
fi

# Install courses
for course in base $*; do
    install_course $course
done
