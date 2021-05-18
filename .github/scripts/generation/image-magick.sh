#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2021 Grégoire Boiron  All Rights Reserved.
#
# Run ImageMagick algorithms to create different versions of all images
#############################################################################

# See http://www.imagemagick.org/Usage/resize/#resize for more info
resize () {
  file=$1
  echo $file
  identify "$file"
  # Apply the command to override the image
  convert "$file" -resize $(echo $file | sed -e "s/.*r\([0-9]*x[0-9]*\).*/\1/") "$file"
  identify "$file"
}

# See http://www.imagemagick.org/Usage/crop/#crop_gravity for more info
crop_center () {
  file=$1
  echo $file
  identify "$file"
  # Apply the command to override the image once again
  convert "$file" -gravity Center -crop $(echo $file | sed -e "s/.*c\([0-9]*x[0-9]*\).*/\1/")+0+0 "$file"
  identify "$file"
}

# Parameters check
echo "$#"
if [ "$#" -eq 0 ]; then
  echo "you need to provide a .txt file and a destination folder to run algorithm on it."
  exit
fi

# 
resizing_pattern=".*r.*"
crop_pattern=".*c.*"

pattern=".*(\[.[0-9]+x[0-9]+\])?(\[.[0-9]+x[0-9]+\])?.*"

# Create destination folder if not already there (jekyll/assets/output)
destination_folder=$2
if [[ ! -d "$destination_folder" ]]
then
  mkdir $destination_folder
fi

asset_path=$(cat $1)
for file in $asset_path
do
  echo "Processing $file file..."
  filename="${file##*/}"
  extension="${file##*.}"
  
  # Debug
  echo "$filename"
  echo "$extension"

  # Copy the file in the output folder
  copied_file="$destination_folder/$filename"
  cp "$file" "$copied_file"

  copied_file="$destination_folder/$filename"
  
  if [[ "$file" =~ $pattern ]]; then
    for (( i=1; i<${#BASH_REMATCH[@]}; i++ ))
    for i in ""
    do
      echo "$i"
      echo "${BASH_REMATCH[$i]}"
      if [[ "${BASH_REMATCH[$i]}" =~ $resizing_pattern ]]; then
        echo "Resize the file found"
        resize "$copied_file"
      elif [[ "${BASH_REMATCH[$i]}" =~ $crop_pattern ]]; then
        echo "Crop the file found"
        crop_center "$copied_file"
      fi
    done
  fi
done

# Debug
git status
