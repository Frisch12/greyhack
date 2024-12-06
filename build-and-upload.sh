#!/bin/sh
if [ -z "$1" ]; then
  echo "Please provide the first argument as public or local"
  exit 1
fi

env=$1

# scan for *.src and not *.inc.src files and build them
for file in $(find . -name '*.src' ! -name '*.inc.src'); do
  echo "Building $file"
  greybel build -ci $file -cia message-hook -cim $env -ac -id /home/bigd -ev $env/env.conf
done