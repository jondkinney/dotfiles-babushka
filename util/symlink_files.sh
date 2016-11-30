#!/bin/bash

function symlink_files(){
  shopt -s dotglob # Enable globbing over hidden files

  local_dir=$1
  destination_dir=$2

  files="$local_dir/*"

  for file_path in $files
  do
    file_name=$(basename $file_path)
    ln -vnsFf $file_path "$destination_dir/$file_name"
  done

  shopt -u dotglob # Disable globbing over hidden files
}
