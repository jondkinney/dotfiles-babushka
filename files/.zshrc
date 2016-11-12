# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Ruby optimizations
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_GC_HEAP_FREE_SLOTS=500000
export RUBY_GC_HEAP_INIT_SLOTS=40000
# end Ruby optimizations

#Git options
GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT
#End Git options

export ZSH_THEME="j2fly"

export DISABLE_AUTO_TITLE='true'

export EDITOR=vim

export ARCHFLAGS="-arch x86_64"

export TERM=xterm-256color

plugins=(sudo tmuxinator web-search wd brew cap cloudapp gem git-remote-branch npm osx zsh-syntax-highlighting git)

source $ZSH/oh-my-zsh.sh

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

PATH=$PATH:$HOME/.rvm/bin:~/bin # Add RVM to PATH for scripting

function zle-keymap-select {
  zle reset-prompt
}
zle -N zle-keymap-select

bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

case `uname` in
  Darwin)
    # auto switch between bin/rspec and rspec by loading bin dir in front of RVM
    eval "$(direnv hook $0)"
  ;;
  Linux)
    # commands for Linux go here
  ;;
esac

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
