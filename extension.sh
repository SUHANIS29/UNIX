# Write a script using egrep command to display a list of specific types of files in the directory.

echo "Enter directory name:"
read dir

echo "Enter file extension (e.g., txt, sh, c):"
read ext

echo "Files with .$ext in $dir:"

ls "$dir" | egrep "\.$ext$"
