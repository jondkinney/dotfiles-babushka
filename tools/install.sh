#!/bin/bash

cd &&
[ -d "/Users/`whoami`/.j2fly-dotfiles" ] || git clone git://github.com/j2fly/dotfiles.git /Users/`whoami`/.j2fly-dotfiles &&
find /Users/`whoami`/.j2fly-dotfiles/home -depth 1 | while read f; do
  ln -vsf "$f" /Users/`whoami`/
done

if [ -d "/Users/`whoami`/.ssh" ]; then
  sudo rm -r ~/.ssh
fi

sudo ln -nsF /Users/`whoami`/.j2fly-dotfiles/.ssh /Users/`whoami`

touch /Users/`whoami`/.j2fly-dotfiles/installed_successfully

echo 'Successfully Installed'
echo '       _____   ______          ____        __  _____ __'
echo '      / /__ \ / __/ /__  __   / __ \____  / /_/ __(_) /___  _____'
echo ' __  / /__/ // /_/ // / / /  / / / / __ \/ __/ /_/ / // _ \/ ___/'
echo '/ /_/ // __// __/ // /_/ /  / /_/ / /_/ / /_/ __/ / //  __(__  )'
echo '\____//____/_/ /_/ \__, /  /_____/\____/\__/_/ /_/_/ \___/____/'
echo '                  /____/'