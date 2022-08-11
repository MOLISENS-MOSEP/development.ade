#!/bin/sh

# ADE
export MOLISENS_DIR=$HOME/projects/MOLISENS
export ADE_MOLISENS_PATH=$MOLISENS_DIR/ade

PATH=$PATH:$ADE_MOLISENS_PATH

ARCHITECTURE=$(uname -i)
if [[ $ARCHITECTURE == x86_64* ]]; then
  ADE_VERSION=ade+x86_64
elif [[ $ARCHITECTURE == aarch64* ]]; then
  ADE_VERSION=ade+aarch64
fi

# ade environment
alias molisense_ade_update="export ADE_NAME=molisens && cd $ADE_MOLISENS_PATH && $ADE_VERSION --rc $ADE_MOLISENS_PATH/.aderc start --update"
alias molisense_ade_start="export ADE_NAME=molisens && $ADE_VERSION --rc $ADE_MOLISENS_PATH/.aderc start --enter"
alias molisense_ade_enter="export ADE_NAME=molisens && molisense_ade_start; $ADE_VERSION enter"
alias molisense_ade_stop="export ADE_NAME=molisens && ade stop"

