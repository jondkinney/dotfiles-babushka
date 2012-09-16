# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Ruby optimizations
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
# end Ruby optimizations

#Git options
GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT
#End Git options


export ZSH_THEME="j2fly"

export EDITOR=vim

export ARCHFLAGS="-arch x86_64"

#export POW_DOMAINS=dev,local,test

plugins=(git git-flow rails textmate ruby cap brew gem github mysql osx vagrant lol)

source $ZSH/oh-my-zsh.sh

#export TERM=screen-256color

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

