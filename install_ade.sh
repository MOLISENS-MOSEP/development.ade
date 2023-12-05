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

# Check if $MOLISENS_DIR is set (if not, the whole operation does not make sense)
if [ -z "$MOLISENS_DIR" ]; then
    echo "Error: MOLISENS_DIR is not set! Also make sure to have it added to your .bashrc or .zshrc"
    exit 1
fi

# Create Subdirs
mkdir $MOLISENS_DIR/ade/MOLISENS
mkdir $MOLISENS_DIR/ade/MOLISENS/bagfiles
git clone https://gitlab.v2c2.at/molisens/molisens_ws.git $MOLISENS_DIR/ade/MOLISENS/molisens_ws
mkdir $MOLISENS_DIR/ade/MOLISENS/molisens_ws/src

# write to .bashrc the extension to use the ADE environment
write_shrc "source $MOLISENS_DIR/ade/extensions.sh"

# copy local git configuration into the ADE environment
cp ~/.gitconfig $MOLISENS_DIR/ade/.gitconfig

echo "Installation Complete!"
echo "To start the ADE environment, restart the terminal and run 'molisens_ade_start'"
