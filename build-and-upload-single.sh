#!/bin/sh
if [ -z "$1" ]; then
  echo "Please provide the first argument as public or local"
  exit 1
fi

env=$1

greybel build -ci $2 -cia message-hook -cim $env -ac -id /home/bigd -ev $env/env.conf