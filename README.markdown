#What is this?
These are the dotfiles that I use on my system. I'll be writing a shell script to put them into place and configure my system in an easy to manage way

##How to get going:
  1. Install Xcode (I use the AppStore these days)
    - Alternatively you can try GCC For Lion here (get the latest): https://github.com/kennethreitz/osx-gcc-installer/downloads

  1. Install laptop
  $> `bash < <(curl -s https://raw.github.com/j2fly/laptop/master/mac)`

  1. Install Oh-My-ZSH  
  $> `bash < <(curl -s https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)`
  
  1. Install dotfiles
  $> `bash < <(curl -s https://raw.github.com/j2fly/dotfiles/master/tools/install.sh)`
  
  1. Install Growl


##TODO (manual steps necessary to complete the install):
  - Set GitHub Token in ~/.gitconfig
  - Set PianoBar password in ~/.config/pianobar/config

##Note:
  - growlnotify for pianobar relies on the following image - Users/jon/Dropbox/Pictures/Fluid App Icons/pandora.png
  - 