#!  /bin/bash

# The second script is another utility that will enable you to organise the files within a
# given folder into different subfolders based on their file types.

#Step 1: In this script you are going to use the output of an ls command to generate
#the list of files in a folder that you are going to organise.
#As a first step, construct a while loop that will iterate over the output of the ls
##command.
#Hint: Do you remember process substitution?

#Step 2: Use a case statement to glob the file names for their file extension and
#action commands based on their file extension.
#For each of the file extensions that you choose to organise, create some logic to
#Move each file into its appropriate folder, creating that folder if necessary.
#Here is where you should move each file type:

read -p "Which folder do you want to organise?: " folder
while read file
do
    echo "$file"
    case $file in 
        *.txt)
                subfolder="text";;
        *.cer)
                subfolder="cer";;
        *.crt)
                subfolder="crt";;
        *.pdf)
                subfolder="pdf";;
        *)
                subfolder="other";;       
    esac        
    if [ ! -d "$folder/$subfolder" ]; then
       mkdir "$folder/$subfolder"
    fi
    
    mv "$folder/$file" "$folder/$subfolder"
done < <(ls "$folder")

# while read filename; do
#     case "$filename" in
#         *.jpg|*.jpeg|*.png)
#             subfolder="images" ;;
#         *.doc|*.docx|*.txt|*.pdf)
#             subfolder="documents" ;;
#         *.xls|*.xlsx|*.csv)
#             subfolder="spreadsheets" ;;
#         *.sh)
#             subfolder="scripts" ;;
#         *.zip|*.tar|*.tar.gz|*.tar.gz.bz2)
#             subfolder="archives" ;;
#         *.ppt|*.pptx)
#             subfolder="presentations" ;;
#         *.mp3)
#             subfolder="audio" ;;
#         *.mp4)
#             subfolder="video" ;;
#         *)
#             subfolder="." ;;
#     esac

#     if [ ! -d "$folder/$subfolder" ]; then
#        mkdir "$folder/$subfolder"
#     fi

#     mv "$filename" "$folder/$subfolder"
# done < <(ls "$folder")



# while file in ${files[@]}
# do
#    echo $folder
#     case $file in 
#         *.txt)
#             mkdir $folder/text;;
#             mv $folder/$file $folder/text;;
#         *.cer)
#             mkdir $folder/cer;;
#             mv $folder/$file $folder/cer;;
#         *.crt)
#             mkdir $folder/crt;;
#             mv $folder/$file $folder/crt;;
#          *.pdf)
#             mkdir $folder/pdf;;
#             mv $folder/$file $folder/pdf;;
#         *)
#             mkdir $folder/other;;
#             mv $folder/$file $folder/other;;        
#     esac
# done