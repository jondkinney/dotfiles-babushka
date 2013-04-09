# Tunnels
# -------
#alias ec2_tunnel_theda='ssh -L 3307:thedacareprod.cqgtmgitcxs6.us-east-1.rds.amazonaws.com:3306 theda-ec2'
#alias bbg_tunnel_theda='ssh -L 3307:ds608.blueboxgrid.com:3306 theda_prod_db'
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
alias startdbs='pgstart;mysqlstart' # now both at once!
alias stopdbs='pgstop;mysqlstop' # now both at once!
alias restartdbs='stopdbs;startdbs' # now both at once!

# System Level
# ------------
alias goodbye='sudo shutdown -r now'
alias uldb='sudo /usr/libexec/locate.updatedb' #update the location database
alias rvm_install_shortcut='bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)'
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
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Empty the Trash
alias emptytrash="rm -rfv ~/.Trash"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias desktop_white="open /Users/macpro/Dropbox/Pictures/Desktop\ Backgrounds/White\ Desktop\ Background.app"


# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"


# RUBY / RAILS
# ------------
# you need to use bundle exec before each command you run in a app controled by bundler so this alias helps make that easier
alias b='bundle exec $*'
alias p='bundle exec powder $*'
alias migrate="bundle exec rake db:migrate && rake db:test:prepare"
alias rdm='bundle exec rake db:migrate'

# Git
# -----------------
alias gg='git goggles'
# alias ggc='git goggles codereview'
alias ggc='git log -p --reverse master..'
alias ggcc='git goggles codereview complete'
alias -g bd='git diff --name-status'
alias glg='git log --no-merges --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias glgwc='git log $(git describe --tags `git rev-list --tags --max-count=1`)..HEAD --no-merges --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias glgl='git log --no-merges --reverse --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias gt='git tag'
alias gtl='git tag -l'
alias gtlr='git ls-remote --tags'
alias gwc='git whatchanged'
alias gbm='git branch --merged'
alias gbnm='git branch --no-merged'
alias gmt='git mergetool'
alias co_remote='ruby /rails/github/gg_utility/git_goggles_ruby_checkout.rb'
alias prune_merged='ruby /rails/github/gg_utility/git_goggles_prune_merged.rb'
alias ptl='bundle exec rake pt:list'
alias ptc='cat /rails/bolstr/bolstr/doc/current_pt_story.txt'
alias gmnff='git merge --no-edit --no-ff $*'
compdef gmnff=git
alias mtm='git checkout master; git merge --no-edit --no-ff develop; git push; git push --tags'
alias mtd='git checkout develop; git merge --no-edit --no-ff master; git push; git push --tags'
alias gbc='git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3 | tr -d '\n' | pbcopy'
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

alias cs='echo -n -e "\e[3J" && clear && exec zsh'


# Documentation Shortcuts
alias docs='cd /rails/bolstr/docs; subl .; open /Applications/DevDocs.app; b guard'

# Project Shortcuts
# -----------------
alias app='cd /rails/bolstr/bolstr; setTerminalText 0 App; tmuxinator start app'
alias cms='cd /rails/bolstr/public; setTerminalText 0 CMS; tmuxinator start cms'
alias bolstr='cd /rails/bolstr/bolstr'
alias public='cd /rails/bolstr/public'

# VIM
# ---
alias vim="stty stop '' -ixoff ; mvim -v"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

alias ev="cd /rails/github/dev_setup_gist; stty stop '' -ixoff; mvim -v .vimrc_main"
alias eb="cd ~/.vim/bundles;"
alias jonvim='stty stop '' -ixoff ; mvim -v ~/Dropbox/Documents/Web\ Development/Vim/jons_vim_guide.txt'

# RAILS
# -----
alias rc='bundle exec pry -r ./config/environment'
alias rdbc='rails dbconsole'

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


# Edit this file
alias ea="cd ~/.oh-my-zsh/custom/; stty stop '' -ixoff; mvim -v j2fly_shortcuts.zsh"
