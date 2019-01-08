# ------------------------------------------------------------------------------
#          FILE:  j2fly.zsh-theme
#   DESCRIPTION:  oh-my-zsh theme file.
#        AUTHOR:  Jon Kinney (jonkinney@gmail.com)
#       VERSION:  1.0.0
#    SCREENSHOT:
# ------------------------------------------------------------------------------

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

function pair_name {
    string=`git config --get user.initials 2>/dev/null`;
    if [[ "$string" == '' ]] ; then
        echo `whoami`;
    else
        name=${string// //}
        echo $name
    fi
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}


# VIM MODE STUFF
#---------------
# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%} <<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}
# END VIM MODE STUFF

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RUBY_PROMPT_="%{$fg_bold[blue]%}rvm:(%{$fg[green]%}\$(~/.rvm/bin/rvm-prompt s i v g)%{$fg_bold[blue]%})%{$reset_color%} "
else
  if which rbenv &> /dev/null; then
    RUBY_PROMPT_="%{$fg_bold[blue]%}rbenv:(%{$fg[green]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg_bold[blue]%})%{$reset_color%} "
  fi
fi

if which node &> /dev/null; then
  NODE_PROMPT_="%{$fg_bold[blue]%}node(%{$fg[red]%}$(node -v)%{$fg[blue]%}) %{$reset_color%} "
fi

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
    PROMPT='%{$fg[magenta]%}$(pair_name)%{$reset_color%} %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)${return_code}$(git_prompt_status)%{$reset_color%}
$(virtualenv_info)$(prompt_char)$(vi_mode_prompt_info) '

    ZSH_THEME_GIT_PROMPT_PREFIX=" | %{$fg[magenta]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

    RPROMPT="${RUBY_PROMPT_}| ${NODE_PROMPT_}"

    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else
    PROMPT='[%n@%m:%~$(git_prompt_info)]
%# '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on"
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%? ↵)"

    RPROMPT='${return_code}$(git_prompt_status)'

    ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
    ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi
