#!/bin/sh

set -e

write_shrc()
{
  # Append line to shell rc file only if it doesn't already exist
  if [ -e ~/.bashrc ]; then
    grep -qxF "$1" ~/.bashrc || echo "$1" >> ~/.bashrc
  fi

  if [ -e ~/.zshrc ]; then
    grep -qxF "$1" ~/.zshrc || echo "$1" >> ~/.zshrc
  fi
}

# Check prerequisites
if ! command -v docker >/dev/null 2>&1; then
    echo "Error: docker is not installed. See https://docs.docker.com/engine/install/"
    exit 1
fi

if ! command -v just >/dev/null 2>&1; then
    echo "Error: just is not installed. See https://github.com/casey/just#installation"
    exit 1
fi

# Check if $MOSEP_DIR is set (if not, the whole operation does not make sense)
if [ -z "$MOSEP_DIR" ]; then
    echo "Error: MOSEP_DIR is not set! Also make sure to have it added to your .bashrc or .zshrc"
    exit 1
fi

# Create subdirectories
mkdir -p "$MOSEP_DIR/ade/MOSEP/bagfiles"
git clone https://github.com/MOLISENS-MOSEP/molisens_ws.git "$MOSEP_DIR/ade/MOSEP/mosep_ws"
mkdir -p "$MOSEP_DIR/ade/MOSEP/mosep_ws/src"

# Source extensions.sh on shell startup
write_shrc "source $MOSEP_DIR/ade/extensions.sh"

# Copy local git configuration into the container home directory
cp ~/.gitconfig "$MOSEP_DIR/ade/.gitconfig"

echo "Installation complete!"
echo "Restart your terminal, then run 'mosep_enter' to start the development container."
