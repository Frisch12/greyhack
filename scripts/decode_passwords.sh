#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

file_content=$(cat $filename)
password_hashes=$(grep -Eo '[a-f0-9]{32}' $filename)

for hash in $password_hashes; do
    decoded=$(grep $hash password_hashes.txt | cut -d':' -f2)

    if [ -z "$decoded" ]; then
        echo "Hash not found: $hash"
        continue
    fi
    sed -i -e "s/$hash/$decoded/g" $filename
done