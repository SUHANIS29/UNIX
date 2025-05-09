
#!/bin/bash

# Ask user for filename
read -p "Enter the filename: " filename


# Count lines using grep
lines=$(grep -c "" "$filename")

# Count words and characters using wc
words=$(wc -w < "$filename")
chars=$(wc -m < "$filename")


echo "File: $filename"
echo "Lines: $lines"
echo "Words: $words"
echo "Characters: $chars"
~
