#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filename> <out>"
    exit 1
fi

filename=$1
out=$2

echo -n "" > $out
lines=$(wc -l $filename | awk '{print $1}')

while IFS= read -r line; do
    echo "$(echo -n $line | md5sum -t | cut -d ' ' -f 1):$line" >> $out
done < <(pv -l -s $lines $filename)