#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR/util/symlink_files.sh"

# get them home first
cd $HOME

[ -d '.dotfiles' ] || git clone git://github.com/jondkinney/dotfiles.git .dotfiles
symlink_files "$(pwd)/.dotfiles/files" $HOME

ln -vnsf $HOME/.dotfiles/zsh_conf/custom/j2fly_shortcuts.zsh $HOME/.oh-my-zsh/custom
ln -vnsf $HOME/.dotfiles/zsh_conf/j2fly.zsh-theme $HOME/.oh-my-zsh/themes
ln -vnsf $HOME/.dotfiles/scripts/pair /usr/local/bin
ln -vnsf $HOME/.dotfiles/files/karabiner.json $HOME/.config/karabiner

echo 'Successfully Installed'
echo '       _____   ______          ____        __  _____ __'
echo '      / /__ \ / __/ /__  __   / __ \____  / /_/ __(_) /___  _____'
echo ' __  / /__/ // /_/ // / / /  / / / / __ \/ __/ /_/ / // _ \/ ___/'
echo '/ /_/ // __// __/ // /_/ /  / /_/ / /_/ / /_/ __/ / //  __(__  )'
echo '\____//____/_/ /_/ \__, /  /_____/\____/\__/_/ /_/_/ \___/____/'
echo '                  /____/'
