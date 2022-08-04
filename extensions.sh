#!/bin/sh

# ADE
export MOLISENS_DIR=$HOME/projects/MOLISENS
export ADE_PATH=$MOLISENS_DIR/ade

PATH=$PATH:$ADE_PATH

# ade environment
alias molisense_ade_update="export ADE_NAME=molisens && cd $ADE_PATH && ade --rc $ADE_PATH/.aderc start --update"
alias molisense_ade_start="export ADE_NAME=molisens && ade --rc $ADE_PATH/.aderc start --enter"
alias molisense_ade_enter="export ADE_NAME=molisens && molisense_ade_start; ade enter"
alias molisense_ade_stop="export ADE_NAME=molisens && ade stop"

