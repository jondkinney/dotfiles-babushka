#!/bin/bash

cd &&
[ -d '.j2lfy-dotfiles' ] || git clone git://github.com/dgoodlad/dotfiles.git .j2lfy-dotfiles &&
find .j2fly-dotfiles/home -depth 1 | while read f; do
  #[ "$f" == '.j2lfy-dotfiles/files/.git' ] ||
  ([ "$f" == '.j2lfy-dotfiles/home/.oh-my-zsh' ] && ln -vsf "$f" .oh-my-zsh) ||
  ln -vsf "$f" .
done


# #!/usr/bin/env bash
# 
# #if [ -d ~/.j2fly-dotfiles ]
# #then
# #  echo "You already have 'j2fly-dotfiles' installed. You'll need to remove ~/.j2fly-dotfiles if you want to install"
# #  exit
# #fi
# #
# #echo "Cloning dotfiles from github to your local home directory..."
# #/usr/bin/env git clone https://github.com/j2fly/dotfiles.git ~/.j2fly-dotfiles
# 
# 
# # echo "Createing the necessary directory structure to allow the dotfiles to be used."
# # 
# # directories=("~/.bundle" "~/.config/pianobar" "~/.oh-my-zsh/custom")
# # for directory in "${directories[@]}"
# # do
# #   if [ ! -d $directory ]
# #   then
# #     echo "Creating the following directory $directory \n"
# #     mkdir -p $directory
# #   fi
# # done
# 
# 
# echo "Looking for existing dotfile configs...\n"
# 
# # Move files to backup versions and install my j2fly-dotfiles versions
# dotfiles=(".bundle" ".config" ".gemrc" ".gitconfig" ".gvimrc.local" ".janus.rake" ".oh-my-zsh" ".ssh")
# 
# for dotfile in "${dotfiles[@]}"
# do
#   if [ -f ~/$dotfile ] || [ -h ~/$dotfile ]
#   then
#     echo "Found ~/$dotfile Backing up to ~/$dotfile.pre-j2fly-dotfiles";
#     sudo mv ~/$dotfile ~/$dotfile.bak;
#   fi
#   
#   echo "Copying the j2fly-dotfiles template for ~/$dotfile to your home directory \n"
#   sudo ln -nsf /Users/`whoami`/.j2fly-dotfiles/home/$dotfile /Users/`whoami`
# done
# 
# 
# echo "Setting up the proper permissions for the ~/.ssh folder"
# chmod -R 700 /Users/`whoami`/.ssh
# chmod 644 /Users/`whoami`/.ssh/authorized_keys
# 
# echo '       _____   ______          ____        __  _____ __'
# echo '      / /__ \ / __/ /__  __   / __ \____  / /_/ __(_) /___  _____'
# echo ' __  / /__/ // /_/ // / / /  / / / / __ \/ __/ /_/ / // _ \/ ___/'
# echo '/ /_/ // __// __/ // /_/ /  / /_/ / /_/ / /_/ __/ / //  __(__  )'
# echo '\____//____/_/ /_/ \__, /  /_____/\____/\__/_/ /_/_/ \___/____/'
# echo '                  /____/'
# 
# echo "\n\n All done...launch a new terminal session (open a new tab) to use the new dotfiles."
# 
# touch ~/.j2fly-dotfiles/installed_successfully