#! /bin/bash

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

# Check if executing as root
if [ "$(id -u )" != "0" ]; then
    echo "Must execut as root"
    exit 1
fi


for course in base $*; do
    install_course $course
done
