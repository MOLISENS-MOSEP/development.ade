#!/bin/sh

export MOLISENS_DIR=$HOME/projects/MOLISENS

mkdir $MOLISENS_DIR/ade/MOLISENS
mkdir $MOLISENS_DIR/ade/MOLISENS/bagfiles
git clone https://gitlab.v2c2.at/molisens/molisens_ws.git $MOLISENS_DIR/ade/MOLISENS/molisens_ws
mkdir $MOLISENS_DIR/ade/MOLISENS/molisens_ws/src

# copy local git configuration into the ADE environment 
cp ~/.gitconfig $MOLISENS_DIR/ade/.gitconfig

