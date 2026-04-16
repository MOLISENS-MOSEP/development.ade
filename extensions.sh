#!/bin/sh

# MOSEP development environment
MOSEP_ADE_DIR=$MOSEP_DIR/ade

# Set COMPOSE_FILE based on architecture
ARCHITECTURE=$(uname -m)
if [[ $ARCHITECTURE == aarch64* ]] || [[ $ARCHITECTURE == arm64 ]]; then
  export COMPOSE_FILE="compose.yaml:compose.aarch64.yaml"
else
  export COMPOSE_FILE="compose.yaml"
fi

# Append profile-specific compose file (e.g. MOSEP_PROFILE=met or cam)
if [[ -n "$MOSEP_PROFILE" ]]; then
  export COMPOSE_FILE="$COMPOSE_FILE:compose.${MOSEP_PROFILE}.yaml"
fi

# Environment variables consumed by compose.yaml
export USER=$(whoami)
export GROUP=$(id -gn)
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
export VIDEO_GROUP_ID=$(getent group video | cut -d: -f3 2>/dev/null || echo 44)

# Convenience aliases
alias mosep_enter="cd $MOSEP_ADE_DIR && just enter"
alias mosep_stop="cd $MOSEP_ADE_DIR && just stop"
alias mosep_update="cd $MOSEP_ADE_DIR && just update"
