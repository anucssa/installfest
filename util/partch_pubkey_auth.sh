#! /bin/bash
# creates a new private key and copies it to partch

###################################################
# Make sure they aren't root
if [ "$(id -u)" = "0" ]; then
    echo "No need to run this as root/sudo, just run it from your own terminal"
    exit 1;
fi


###################################################
# Check that they have a streams account!
echo -n "Have you logged into cs.anu.edu.au/streams yet? y/n (n): "
read streams

if [ "$streams" != y ]; then
    echo "This will not work until you have logged onto streams"
    exit 1
fi

###################################################
# Lets make a key
echo "Generating a new 3072 bit RSA keypair"
ssh-keygen -b 3072 -t rsa -f ~/.ssh/partch.anu.edu.au

echo "Adding the key to ssh-agent (will ask for passphrase)"
ssh-add ~/.ssh/partch.anu.edu.au

echo -n "Please enter your student id: "
read uni_id

echo "Copying the public key to partch (will prompt for your university password)"
ssh-copy-id -i ~/.ssh/partch.anu.edu.au $uni_id"@partch.anu.edu.au"

echo "Cool beans, lets ssh to partch and check that it worked! (type exit to continue)"
ssh $uni_id"@partch.anu.edu.au"

echo "Just going to make a file and try to connect again"
echo "Host partch
    Hostname partch.anu.edu.au
    Port 22
    User $uni_id
    IdentityFile ~/.ssh/partch.anu.edu.au" >> ~/.ssh/config

ssh partch

echo "Cool, from now on when you want to ssh or scp you can just type partch
Example: ssh partch
scp local_file partch:remote_file"
