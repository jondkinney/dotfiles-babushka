# Tunnels
# -------
alias bbg_tunnel_bolstr='ssh -L 54321:db01.c45431.blueboxgrid.com:5432 bolstr_db'

# DB Stuff
# --------
# PG
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgtail='tail -f /usr/local/var/postgres/server.log'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
# MySQL
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'
# Both
alias startdbs='pgstart;mysqlstart'
alias stopdbs='pgstop;mysqlstop'
alias restartdbs='stopdbs;startdbs'

# System Level
# ------------
alias goodbye='sudo shutdown -r now'
alias uldb='sudo /usr/libexec/locate.updatedb' #update the location database
alias flush_dns='dscacheutil -flushcache'
alias fixbrew='sudo chown -R `whoami` /usr/local'
alias fixpow='rvm env . -- --env > .powenv'
alias c='clear'
alias clera='clear'
alias rm_sym='find . ! -name . -prune -type l|xargs rm'

# Directories
alias l='ls -lah'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ipl="ipconfig getifaddr en0; echo; ipconfig getifaddr en1"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias desktop_white="open /Users/macpro/Dropbox/Pictures/Desktop\ Backgrounds/White\ Desktop\ Background.app"

alias spotoff="sudo mdutil -a -i off"  # Disable Spotlight
alias spoton="sudo mdutil -a -i on"    # Enable Spotlight

# Git
# -----------------
alias gg='git goggles'
# alias ggc='git goggles codereview'
alias ggc='git log -p --reverse master..'
alias ggcc='git goggles codereview complete'
alias glg='git log --no-merges --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias glgl='git log --no-merges --reverse --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias gwc='git whatchanged --no-merges --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias gt='git tag'
alias gtl='git tag -l'
alias gtlr='git ls-remote --tags'
alias gbm='git branch --merged'
alias gbnm='git branch --no-merged'
alias gmt='git mergetool'
alias co_remote='ruby /rails/gg_utility/git_goggles_ruby_checkout.rb'
alias prune_merged='ruby /rails/gg_utility/git_goggles_prune_merged.rb'
alias ptl='bundle exec rake pt:list'
alias ptc='cat /rails/bolstr/bolstr/doc/current_pt_story.txt'
alias gmnff='git merge --no-edit --no-ff $*'
compdef gmnff=git
alias mts='git checkout staging; git merge --no-edit --no-ff develop; git push; git push --tags'
alias mtm='git checkout master; git merge --no-edit --no-ff develop; git push; git push --tags'
alias mte='mts;mtm'
alias mtd='git checkout develop; git merge --no-edit --no-ff master; git push; git push --tags'
alias gbc='git rev-parse --abbrev-ref HEAD 2>/dev/null | cut -d"/" -f 2 | tr -d "\n" | pbcopy'
alias gp='git push;git push --tags'
alias gs='git stash'
alias gsp='git stash pop'
alias gd='git diff'

# Nocorrect Aliases
# -----------------
unsetopt correct_all

# Apps
# ----
alias pandora='pianobar'
alias tl='tmux ls'
alias ta='tmux attach -t $*'
alias tk='tmux kill-session -t $*'
alias to='tmuxinator open $*'
alias ts='tmuxinator start $@'
alias ml='tmuxinator list'
alias rp='relish push bolstr/rails-app'

# Documentation Shortcuts
alias docs='cd /rails/bolstr/docs; subl .; open /Applications/DevDocs.app; b guard'

# Project Shortcuts
# -----------------
alias app='cd /rails/bolstr/bolstr; setTerminalText 0 App; tmuxinator start app'
alias cms='cd /rails/bolstr/public; setTerminalText 0 CMS; tmuxinator start cms'
alias bolstr='cd /rails/bolstr/bolstr'
alias dev='git checkout develop'
alias public='cd /rails/bolstr/public'
alias dot='cd ~/.dotfiles'
alias pdot='cd ~/.private-dotfiles'

alias mvc='cd /rails/github/moulding_visions; setTerminalText 0 Moulding Visions; tmuxinator start mvc'

# VIM
# ---
#alias vim="mvim -v"
alias em="vim `git status | grep modified | awk '{print $3}' | tr '\n' ' '`"
#alias em="vim `git status --porcelain | sed -ne 's/^ M //p' | tr '\n' ' '`"

alias ev="cd /rails/github/dev_setup_gist; vim .vimrc_main"
alias evb="cd ~/.vim/bundles;"
alias jonvim='vim ~/Dropbox/Documents/Web\ Development/Vim/jons_vim_guide.txt'

# RAILS
# -----
# you need to use bundle exec before each command you run in a app controled by
# bundler so this alias helps make that easier
alias b='bundle exec $*'
alias p='bundle exec powder $*'
alias rdm='bundle exec rake db:migrate'
alias rc='bundle exec rails console'
alias rdbc='rails dbconsole'

# CAPISTRANO
# ----------
alias ds='git checkout staging; bundle exec cap deploy'
alias dsm='git checkout staging; bundle exec cap deploy:migrations'
alias dp='git checkout master; bundle exec cap production deploy'
alias dpm='git checkout master; bundle exec cap production deploy:migrations'


alias webserver='python -m SimpleHTTPServer'

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
nt         () { setTerminalText 0 $@; }
stt_tab    () { setTerminalText 1 $@; }
stt_title  () { setTerminalText 2 $@; }

# Store an empty TODO: commit in git log that needs to be rebased out. Short,
# quick reminders
todo() {
  git commit --allow-empty -m "TODO: $*"
}

# Edit this file
alias ea="cd ~/.oh-my-zsh/custom/; vim j2fly_shortcuts.zsh"

#Source this file
alias aup="source ~/.oh-my-zsh/custom/j2fly_shortcuts.zsh"




typeset -Ag abbreviations

abbreviations=(
    "em"      "vim `git status --porcelain | sed -ne 's/^ M //p' | tr '\n' ' '`"
)

magic-abbrev-expand() {
     local left prefix
     left=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
     prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")
     LBUFFER=$left${abbreviations[$prefix]:-$prefix}" "
}

no-magic-abbrev-expand() {
    LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey   " "    magic-abbrev-expand
bindkey   "^x "  no-magic-abbrev-expand
