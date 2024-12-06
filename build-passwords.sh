#!/bin/bash

f="all_passwords.txt"
split -d -a1 -l18000 "$f" "${f%.txt}-"