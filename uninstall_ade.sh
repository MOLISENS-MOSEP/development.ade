#!/bin/sh

# Check if $MOLISENS_DIR is set (if not, the whole operation does not make sense)
if [ -z "$MOLISENS_DIR" ]; then
    echo "Error: MOLISENS_DIR is not set! Cannot run the uninstallation without it!"
    exit 1
fi

# Remove the cloned repository and created directories
rm -rf "$MOLISENS_DIR/ade/MOLISENS/molisens_ws"
rm -rf "$MOLISENS_DIR/ade/MOLISENS/bagfiles"
rm -rf "$MOLISENS_DIR/ade/MOLISENS/molisens_ws/src"

# Remove the .gitconfig in the ADE environment
rm -f "$MOLISENS_DIR/ade/.gitconfig"

# Remove the entry of extensions.sh corresponding to your specific installation directory from .bashrc and .zshrc
if [ -e ~/.bashrc ]; then
    sed -i "\@source $MOLISENS_DIR/ade/extensions.sh@d" ~/.bashrc
    sed -i '/export MOLISENS_DIR/d' ~/.bashrc
fi

if [ -e ~/.zshrc ]; then
    sed -i "\@source $MOLISENS_DIR/ade/extensions.sh@d" ~/.zshrc
    sed -i '/export MOLISENS_DIR/d' ~/.zshrc
fi

rm -rf $MOLISENS_DIR/ade/

echo "Uninstallation Complete!"
