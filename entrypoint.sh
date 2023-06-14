#!/bin/bash

# Check for a dev folder and create it if it doesn't exist.
cd $HOME
if [ ! -d "dev" ]; then
  mkdir dev
fi

cd dev

exec "$@"
