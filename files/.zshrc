# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Ruby optimizations
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000
# end Ruby optimizations

#Git options
GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT
#End Git options

export ZSH_THEME="j2fly"

export DISABLE_AUTO_TITLE='true'

export EDITOR=vim

export ARCHFLAGS="-arch x86_64"

plugins=(git git-flow rails ruby cap brew gem github osx)

source $ZSH/oh-my-zsh.sh

#export TERM=screen-256color

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator


#. /Users/jon/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
