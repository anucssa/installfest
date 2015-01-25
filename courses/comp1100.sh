#! /bin/bash
# Install the COMP1100 requirements:
#   GHC
#   cabal
#

####################################
# Such haskell, much side-effect
apt-get -y install ghc cabal-install

####################################
# Libraries
apt-get -y install freeglut3-dev
cabal update
cabal install --global gloss
