#!/bin/sh
function uploadFile {
    filename=$1
    env=$2
    greybel build -ci $1 -cia message-hook -cim $env -ac -id /home/bigd -ev $env/env.conf
}