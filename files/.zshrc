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

# Allows setTerminalText to work
export DISABLE_AUTO_TITLE='true'

export EDITOR=nvim

export ARCHFLAGS="-arch x86_64"

plugins=(sudo tmuxinator web-search wd brew cloudapp gem git-remote-branch npm osx git)

eval "$(nodenv init -)"

source $ZSH/oh-my-zsh.sh

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

PATH=$PATH:$HOME/.rvm/bin:~/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/Library/Python/2.7/bin

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

# FZF
# TODO: (2018-02-28) jon => see about using ag for fzf to auto-ignore the .gitignore files
export FZF_DEFAULT_COMMAND='find . -name .git -prune -o -name node_modules -prune -o -name coverage -prune -o -name tmp -prune -o -type f -print'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Auto fallback for NPX. Will try to execute what you typed from your node_modules bin directories
# https://www.npmjs.com/package/npx
source <(npx --shell-auto-fallback zsh)
