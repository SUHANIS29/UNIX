#!/bin/bash

read -p "Enter the filename: " file


if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi


echo "Duplicate lines in $file:"
sort "$file" | uniq -d
