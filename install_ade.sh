#!/bin/sh

export MOLISENS_DIR=$HOME/projects/MOLISENS

mkdir $MOLISENS_DIR/ade/MOLISENS
mkdir $MOLISENS_DIR/ade/MOLISENS/bagfiles
git clone https://gitlab.v2c2.at/molisens/molisens_ws.git $MOLISENS_DIR/ade/MOLISENS/molisens_ws
mkdir $MOLISENS_DIR/ade/MOLISENS/molisens_ws/src

# write to .bashrc the extension to use the ADE environment
echo "source $MOLISENS_DIR/ade/extensions.sh" >> ~/.bashrc

# copy local git configuration into the ADE environment 
cp ~/.gitconfig $MOLISENS_DIR/ade/.gitconfig

