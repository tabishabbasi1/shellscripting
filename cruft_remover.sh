#!  /bin/bash

# The first script is a great utility that will help you to keep your system clear of
# unnecessary files (known informally as “cruft”) by allowing you to delete files that
# haven’t been modified for a certain period of time.

# Step 1: In this script we want to ask the user which folder they want to remove “cruft”
# from, and to define how many days files should be unmodified for to be considered
# “cruft”.
# Perhaps the read command will come in handy?
# Step 2: Next you need to create an array of the files that are eligible for removal
# To do this you will need to use the find command.
# You will need to do some research on how to use the find command, so be sure to
# read the man page!
# Hint: In particular, check out the -maxdepth, -type, and -mtime options.
# Hint: Remember to save the results into an array with the readarray command!
# Step 3: You then need to iterate over the array you created in the last step, and
# present the user with an option to delete each file in the array.


read -p "which folder they want to remove from : " folder
read -p "How many days it to old :" days

readarray -t files < <(find $folder -maxdepth 1 -type f -mtime "+$days")
for file in "${files[@]}" 
do 
   
    rm -i "$file"
    echo "Deleted files are : "$file
done

echo "Dev Branch"
# Git Directory
echo "Master Branch"
