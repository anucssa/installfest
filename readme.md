# installfest scripts 2015

This repo contains a collection of scripts that will configure your machine for various ANU Computer Science courses.
Currently it has only been tested on an Ubuntu 14.04.1 VM but it _should_ work on recent dpkg based distro's.

## usage

```bash
cd installfest
sudo ./install.sh base comp1100 comp1130 comp2300 comp2100 comp2500
```

## courses and packages

### base

 + mercurial
 + git
 + atom text editor

this course can also create a new account for the user and disable the default installfest account.

### comp1100

 + ghc
 + cabal
 + gloss

### comp1130

 + comp1100
 + gnat-gps

### comp2300

 + build-essential
 + oracle java8
 + rPeANUt2.4

this course installs rPeANUt and the documentation to `/usr/share/rPeANUt`.
the rPeANUt simulator can be started by calling `run_rPeANUt` from the terminal or found in the application drawer under "rPeANUt simulator".

### comp2100/2500

 + oracle java8
 + eclipse

## utils

### partch_pubkey_auth.sh

handy script which automates the creation of a keypair, uploading it to partch and setting up an ssh config file.
at the end the user will be able to ssh and scp to partch using the following commands
```bash
ssh partch
scp local_file partch:remote_file
```
