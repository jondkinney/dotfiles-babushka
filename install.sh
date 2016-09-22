#!/bin/bash

# get them home first
cd $HOME

cd &&
[ -d '.dotfiles' ] || git clone git://github.com/jondkinney/dotfiles.git .dotfiles &&
find .dotfiles/files -depth | while read f; do
  ln -vnsf "$f" $HOME
done

ln -vnsf $HOME/.dotfiles/zsh_conf/custom/j2fly_shortcuts.zsh $HOME/.oh-my-zsh/custom
ln -vnsf $HOME/.dotfiles/zsh_conf/j2fly.zsh-theme $HOME/.oh-my-zsh/themes
ln -vnsf $HOME/.dotfiles/scripts/pair /usr/local/bin

echo 'Successfully Installed'
echo '       _____   ______          ____        __  _____ __'
echo '      / /__ \ / __/ /__  __   / __ \____  / /_/ __(_) /___  _____'
echo ' __  / /__/ // /_/ // / / /  / / / / __ \/ __/ /_/ / // _ \/ ___/'
echo '/ /_/ // __// __/ // /_/ /  / /_/ / /_/ / /_/ __/ / //  __(__  )'
echo '\____//____/_/ /_/ \__, /  /_____/\____/\__/_/ /_/_/ \___/____/'
echo '                  /____/'
