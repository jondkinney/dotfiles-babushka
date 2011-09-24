#!/bin/bash

# get them home first
cd ~

cd &&
[ -d '.dotfiles' ] || git clone git://github.com/j2fly/dotfiles.git .dotfiles &&
find .dotfiles/files -depth 1 | while read f; do
  ([ "$f" == '.dotfiles/files/oh-my-zsh' ] && ln -vsf "$f" .oh-my-zsh) ||
  ln -vsf "$f" .
done

touch /Users/`whoami`/.dotfiles/successful_install

echo 'Successfully Installed'
echo '       _____   ______          ____        __  _____ __'
echo '      / /__ \ / __/ /__  __   / __ \____  / /_/ __(_) /___  _____'
echo ' __  / /__/ // /_/ // / / /  / / / / __ \/ __/ /_/ / // _ \/ ___/'
echo '/ /_/ // __// __/ // /_/ /  / /_/ / /_/ / /_/ __/ / //  __(__  )'
echo '\____//____/_/ /_/ \__, /  /_____/\____/\__/_/ /_/_/ \___/____/'
echo '                  /____/'