# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Ruby optimizations
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_GC_HEAP_FREE_SLOTS=500000
export RUBY_GC_HEAP_INIT_SLOTS=40000
# end Ruby optimizations

export PIVOTAL_TOKEN='5b12651ad30e4d75272d09176c42b172'

#Git options
GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT
#End Git options

export ZSH_THEME="j2fly"

export DISABLE_AUTO_TITLE='true'

export EDITOR=vim

export ARCHFLAGS="-arch x86_64"

plugins=(git sudo tmuxinator web-search wd brew cap cloudapp gem git_remote_branch npm osx)

source $ZSH/oh-my-zsh.sh

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# bindkey -v

function zle-keymap-select {
  zle reset-prompt
}
zle -N zle-keymap-select

bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

#case $- in *i*)
#  if [ -z "$TMUX" ]; then
#    exec tmux;
#  fi
#esac

# auto switch between bin/rspec and rspec by loading bin dir in front of RVM
eval "$(direnv hook $0)"
