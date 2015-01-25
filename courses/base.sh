#! /bin/bash

# Update distro
apt-get update
apt-get upgrade

# Install useful things
apt-get install git hg

# Add a new account
echo -n "Do you want to create a new account? y/n (n): "
read new_acc
if [ "$new_acc" = "y" ]; then
    echo -n "Username: "
    read username
    echo -n "Password: "
    read -s password
    password = mkpasswd $password
    useradd -m -G sudo -p $password $username
fi

echo -n "Do you want to disable this account? y/n (n): "
read disable_acc
if [ "$disable_acc" = "y" ]; then
    usermod -L -E 1 `id -un`
fi
