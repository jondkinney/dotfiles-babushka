#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR/util/symlink_files.sh"

# get them home first
cd $HOME

[ -d '.dotfiles' ] || git clone git@github.com:jondkinney/dotfiles.git .dotfiles
symlink_files "$(pwd)/.dotfiles/files" $HOME

ln -vnsf $HOME/.dotfiles/zsh_conf/custom/j2fly_shortcuts.zsh $HOME/.oh-my-zsh/custom
ln -vnsf $HOME/.dotfiles/zsh_conf/j2fly.zsh-theme $HOME/.oh-my-zsh/themes
ln -vnsf $HOME/.dotfiles/scripts/pair /usr/local/bin
ln -vnsf $HOME/.dotfiles/files/karabiner.json $HOME/.config/karabiner

# read -p  "????? What name do you want to display on your git commits? "
# if [[ $REPLY != '' ]]; then
#   sed -i -e "s/Jon\ Kinney/$REPLY/" $HOME/.gitconfig_private
# fi

# read -p  "????? What email do you want to display on your git commits? "
# if [[ $REPLY != '' ]]; then
#   sed -i -e "s/jonkinney@gmail.com/$REPLY/" $HOME/.gitconfig_private
# fi

echo 'Successfully Installed'
echo '    ____        __  _____ __'
echo '   / __ \____  / /_/ __(_) /___  _____'
echo '  / / / / __ \/ __/ /_/ / // _ \/ ___/'
echo ' / /_/ / /_/ / /_/ __/ / //  __(__  )'
echo '/_____/\____/\__/_/ /_/_/ \___/____/'
echo
