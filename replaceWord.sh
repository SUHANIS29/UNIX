#Write a script using grep command to find the number of words character,
#words and lines in a file.
#!/bin/bash


read -p "Enter the filename: " file


if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi


read -p "Enter the word to be replaced: " old_word
read -p "Enter the new word: " new_word


sed -i "s/\b$old_word\b/$new_word/g" "$file"

echo "All occurrences of '$old_word' have been replaced with '$new_word' in $file."
