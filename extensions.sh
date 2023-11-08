#!/bin/sh

# ADE
export ADE_MOLISENS_PATH=$MOLISENS_DIR/ade/MOLISENS/molisens_ws

PATH=$PATH:$ADE_MOLISENS_PATH


ARCHITECTURE=$(uname -m)
if [[ $ARCHITECTURE == x86_64* ]]; then
  ADE_VERSION=ade+x86_64
  #export ADE_DISABLE_NVIDIA_DOCKER=true  # If you want to use CUDA inside ADE, comment this line!
elif [[ $ARCHITECTURE == aarch64* ]]; then
  ADE_VERSION=ade+aarch64
  export ADE_DISABLE_NVIDIA_DOCKER=true  # If you want to use CUDA inside ADE, comment this line!
elif  [[ $ARCHITECTURE == arm64 ]]; then
  # asuming OSX with arm processor
  # install ade with https://ade-cli.readthedocs.io/en/latest/install.html
  ADE_VERSION=ade
  export ADE_DISABLE_NVIDIA_DOCKER=true
fi

echo $ADE_VERSION

# ade environment
alias molisens_ade_update="export ADE_NAME=molisens && cd $ADE_MOLISENS_PATH && $ADE_VERSION --rc $ADE_MOLISENS_PATH/.aderc_$ARCHITECTURE start --update"
alias molisens_ade_start="export ADE_NAME=molisens && $ADE_VERSION --rc $ADE_MOLISENS_PATH/.aderc_$ARCHITECTURE start --enter"
alias molisens_ade_enter="export ADE_NAME=molisens && molisens_ade_start; $ADE_VERSION enter"
alias molisens_ade_stop="export ADE_NAME=molisens && $ADE_VERSION stop"

