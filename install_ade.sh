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

# Check if $MOLISENS_DIR is set as a variable - if not the rest of the script does not make sense
if [ -z "$MOLISENS_DIR" ]; then
    echo "Error: MOLISENS_DIR is not set! Also make sure to have it added to your .bashrc or .zshrc"
    exit 1
fi

echo "Installing... "

# Check if MOLISENS_DIR is not set in either ~/.bashrc or ~/.zshrc and set it if its not in there
if ! (grep -q "export MOLISENS_DIR=\"$MOLISENS_DIR\"" ~/.bashrc || grep -q "export MOLISENS_DIR=\"$MOLISENS_DIR\"" ~/.zshrc); then
    write_shrc "export MOLISENS_DIR=\"$MOLISENS_DIR\""
    echo "Updated shrc file!"
fi

#Create Subdirs
mkdir $MOLISENS_DIR/ade/MOLISENS
mkdir $MOLISENS_DIR/ade/MOLISENS/bagfiles

# Define the URL of the Git repository you want to clone
molisens_repo_ending=molisens/development/ade.git
molisens_repo_ssh="git@gitlab.v2c2.at:$molisens_repo_ending"
molisens_repo_https="https://gitlab.v2c2.at/$molisens_repo_ending"


# Get the URL of the current Git repository
current_git_repo_url=$(git -C "$MOLISENS_DIR/ade/" remote get-url origin 2>/dev/null)

# Check if the current directory is the same as the Git repository you want to clone - if so, just MOVE the folder contents
if [ "$current_git_repo_url" = "$molisens_repo_ssh" ] || [ "$current_git_repo_url" = "$molisens_repo_https" ]; then    # Move all contents of to the molisens_ws folder
    # AND Ignore the 'install_ade.sh' file and move only files (not subfolders)
    mkdir "$MOLISENS_DIR/ade/MOLISENS/molisens_ws"
    find "$MOLISENS_DIR/ade/" -maxdepth 1 -type f ! -name 'install_ade.sh' ! -name 'uninstall_ade.sh'  ! -name 'extensions.sh' ! -name '.gitignore' ! -name 'README.md' -exec rsync -a --remove-source-files {} "$MOLISENS_DIR/ade/MOLISENS/molisens_ws/" \;
    echo "Moved contents to $MOLISENS_DIR/ade/MOLISENS/molisens_ws/"
else
    # If the repositories are not the same, clone the desired repository
    git clone "$molisens_repo_ssh" "$MOLISENS_DIR/ade/MOLISENS/molisens_ws"
fi

mkdir $MOLISENS_DIR/ade/MOLISENS/molisens_ws/src

# write to .bashrc the extension to use the ADE environment
write_shrc "source $MOLISENS_DIR/ade/extensions.sh"

# copy local git configuration into the ADE environment
cp ~/.gitconfig $MOLISENS_DIR/ade/.gitconfig

echo "Installation Complete!"
echo "Restart the terminal!"