#!/usr/bin/env bash

if [ -d ~/.j2fly-dotfiles ]
then
  echo "You already have 'j2fly-dotfiles' installed. You'll need to remove ~/.j2fly-dotfiles if you want to install"
  exit
fi

echo "Cloning dotfiles from github to your local home directory..."
/usr/bin/env git clone https://github.com/j2fly/dotfiles.git ~/.j2fly-dotfiles


echo "Createing the necessary directory structure to allow the dotfiles to be used."

directories=("~/.bundle" "~/.config/pianobar" "~/.oh-my-zsh/custom" "~/.ssh")
for directory in "${directories[@]}"
do
  if [ ! -d $directory ]
  then
    echo "Creating the following directory $directory \n"
    mkdir -p $directory
  fi
done



echo "Looking for existing dotfile configs...\n"

# Move files to backup versions and install my j2fly-dotfiles versions
dotfiles=("bundle/config" "config/pianobar/config" "gemrc" "gitconfig" "gvimrc.local" "janus.rake" "oh-my-zsh/custom/j2fly_shortcuts.zsh" "ssh")

for dotfile in "${dotfiles[@]}"
do
  if [ -f ~/.$dotfile ] || [ -h ~/.$dotfile ]
  then
    echo "Found ~/.$dotfile Backing up to ~/.$dotfile.pre-j2fly-dotfiles";
    cp -r ~/.$dotfile ~/.$dotfile.pre-j2fly-dotfiles;
    rm -r ~/.$dotfile;
  fi
  
  echo "Copying the j2fly-dotfiles template for ~/.$dotfile to your home directory \n"
  ln -nsf ~/.j2fly-dotfiles/home/$dotfile ~/.$dotfile
done

echo '       _____   ______          ____        __  _____ __'
echo '      / /__ \ / __/ /__  __   / __ \____  / /_/ __(_) /___  _____'
echo ' __  / /__/ // /_/ // / / /  / / / / __ \/ __/ /_/ / // _ \/ ___/'
echo '/ /_/ // __// __/ // /_/ /  / /_/ / /_/ / /_/ __/ / //  __(__  )'
echo '\____//____/_/ /_/ \__, /  /_____/\____/\__/_/ /_/_/ \___/____/'
echo '                  /____/'

echo "\n\n All done...launch a new terminal session (open a new tab) to use the new dotfiles."