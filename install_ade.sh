#!/bin/sh


write_shrc()
{
	# if a ~/.bashrc exists, write it to the .bashrc-file
  if [ -e ~/.bashrc ]
  then
    echo "$1" >> ~/.bashrc
  fi

  # if a ~/.zshrc exists, write it to the .zshrc-file
  if [ -e ~/.zshrc ]
  then
    echo "$1" >> ~/.zshrc
  fi
}


mkdir $MOLISENS_DIR/ade/MOLISENS
mkdir $MOLISENS_DIR/ade/MOLISENS/bagfiles
git clone https://gitlab.v2c2.at/molisens/molisens_ws.git $MOLISENS_DIR/ade/MOLISENS/molisens_ws
mkdir $MOLISENS_DIR/ade/MOLISENS/molisens_ws/src

# write to .bashrc the extension to use the ADE environment
write_shrc "source $MOLISENS_DIR/ade/extensions.sh"

# copy local git configuration into the ADE environment
cp ~/.gitconfig $MOLISENS_DIR/ade/.gitconfig

