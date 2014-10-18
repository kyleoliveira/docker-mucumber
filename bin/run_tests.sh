#!/usr/bin/env bash
source $HOME/.bashrc
source /etc/profile.d/rvm.sh
if [ "$PARALLEL" = "true" ]; then
  parallel_cucumber "$@"
else
  cucumber "$@"
fi
