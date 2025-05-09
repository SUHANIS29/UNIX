#vi) Write a shell script to search whether an element is present in the list or not.

#!/bin/bash
echo "Enter list of numbers"
read -a arr
echo "Enter element to search"
read search
for num in "${arr[@]}"; do
        if [ "$num" -eq "$search" ]; then
                echo "$search is found"
                exit 0
        fi
done

echo "$search is not found"
