#! /bin/bash
# Install all the cool basic things we need ie:
#   hg
#   git
#   sublime text
#
# Also do an update, add a new account and disable the installfest account

######################################################
# Add the sublime-text PPA
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2

# Update distro
apt-get -y update
apt-get -y upgrade

# Install generically useful things
# whois => mkpasswd
apt-get -y install git mercurial sublime-text whois

######################################################
# Add a new account
echo -n "Do you want to create a new account? y/n (n): "
read new_acc
if [ "$new_acc" = "y" ]; then
    echo -n "Username: "
    read username
    echo -n "Password: "
    read -s password
    password=`mkpasswd $password`
    useradd -m -G sudo -p $password $username
    echo "$username created"
fi

######################################################
# Disable the isntallfest account
echo -n "Do you want to disable this account? y/n (n): "
read disable_acc
if [ "$disable_acc" = "y" ]; then
    usermod -L -e 1 `id -un`
fi
