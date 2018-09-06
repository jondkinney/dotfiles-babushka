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
alias redis='redis-server /usr/local/etc/redis.conf'

# System Level
# ------------
alias uldb='sudo /usr/libexec/locate.updatedb' #update the location database
alias flush_dns='sudo killall -HUP mDNSResponder'
alias fixbrew='sudo chown -R `whoami` /usr/local'
alias c='clear'
alias clera='clear'
alias rm_sym='find . ! -name . -prune -type l | xargs rm'
alias fixcam='sudo killall VDCAssistant'
alias fixterm='stty sane'

# Git
# -----------------
alias gboom='git add -A; git commit -m "Boom"; git push;'
alias gg='git goggles'
alias gwc='git whatchanged --no-merges --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias gt='git tag'
alias gtl='git tag -l'
alias gtlr='git ls-remote --tags'
alias gbm='git branch --merged'
alias gbnm='git branch --no-merged'
alias co_remote='~/.dotfiles/scripts/git_goggles_ruby_checkout.rb'
alias prune_merged='~/.dotfiles/scripts/git_goggles_prune_merged.rb'
alias gf='git fetch'
alias ptl='bundle exec rake pt:list'
alias ptc='cat /rails/bolstr/bolstr/doc/current_pt_story.txt'
alias gmnff='git merge --no-edit --no-ff $*'
alias mmts='git checkout staging; git merge --no-edit --no-ff master; git push; git push --tags'
alias mmtp='git checkout production; git merge --no-edit --no-ff master; git push; git push --tags'
alias mmte='mmts;mmtp'
alias gbc='git rev-parse --abbrev-ref HEAD 2>/dev/null | cut -d"/" -f 2 | tr -d "\n" | pbcopy' # copies the current branch to your clipboard (on os x)
alias gp='git push;git push --tags'
alias gs='git stash'
alias gsp='git stash pop'
alias zff='zenflow feature finish'
alias dev='git checkout development'
alias sta='git checkout staging'
alias prd='git checkout production'
alias mas='git checkout master'
alias gauthor='f() { GIT_COMMITTER_DATE=$1 git commit --amend --date=$1 }; f' # Wed Mar 14 14:08 2018 -0600


# Nocorrect Aliases
# -----------------
unsetopt correct_all

# Apps
# ----
alias tl='tmux ls'
alias ta='tmux attach -t $*'
alias tk='tmux kill-session -t $*'
alias tks='tmux kill-server'
alias to='tmuxinator open $*'
alias ts='tmuxinator start $@'
alias ml='tmuxinator list'

# Wemux
# -----
alias wl='wemux list'
alias wj='wemux join $*'
alias wr='wemux rogue $*'
alias wp='wemux pair $*'
alias wsj='f() { wemux join $1; wemux start }; f'
alias wk='wemux stop $*'
alias wks='wemux stop'


# Project Shortcuts
# -----------------
alias hack='tmuxinator start hack; set_tab_name Hack'
alias blog='set_tab_name Blog; tmuxinator start blog'
alias attacktracker='cd /rails/headway/attacktracker; set_tab_name AttackTracker; tmuxinator start attacktracker'
alias conover='cd /rails/headway/conover; set_tab_name Conover; tmuxinator start conover'
alias irememba='cd /rails/headway/irememba; set_tab_name Irememba; tmuxinator start irememba'
alias webinar='cd ~/Sites/Rails/headway/webinars/selfstarter; set_tab_name Webinar; tmuxinator start webinar'
alias athletefit='cd /rails/headway/athletefit_backend; set_tab_name AthleteFit; tmuxinator start athletefit'
alias hypremium='cd /rails/headway/hypremium_backend; set_tab_name Hypremium; tmuxinator start hypremium'
alias voyage='cd /rails/headway/suspenders; set_tab_name Voyage; tmuxinator start voyage'
alias dosis='cd /rails/headway/dosis; set_tab_name Dosis; tmuxinator start dosis'
alias 26letters='cd /rails/headway/inclusion; set_tab_name 26 Letters; tmuxinator start 26letters'
alias ttl='cd /rails/headway/ttl; set_tab_name TTL; tmuxinator start ttl'

alias hack_dev_setup='set_tab_name Dev Setup; tmuxinator start dev_setup'

# VIM
# ---
#alias vim='nvim'
alias vbi='vim +BundleInstall +qall'
alias vpe='vim ~/.vim/plugins.vim'
alias vbc='vim +BundleClean +qall'
alias vim_huge='vim -u NONE -U NONE -N $*'

# RAILS
# -----
# you need to use bundle exec before each command you run in a app controled by
# bundler so this alias helps make that easier
alias b='bundle exec $*'
alias rdm='bin/rake db:migrate'
alias rc='bin/rails console'
alias rdbc='bin/rails dbconsole'
alias kr='kill -9 `cat tmp/pids/server.pid; echo;`'

# NODE
# ----
alias nombomb='trash node_modules; bower cache clean && trash bower_components'

# PAIR
#-----
unpair () { gh-auth remove --users=$1 }

alias webserver='python -m SimpleHTTPServer'

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}

set_tab_name () { setTerminalText 1 $@; }
set_title_name () { setTerminalText 2 $@; }
set_tab_and_title_name () { setTerminalText 0 $@; }

# Set Window Title initially, then setting tab titles won't override it
set_title_name Let\'s Make Headway

# Set new tab titles to the machine's name
case `uname` in
  Darwin)
    # auto switch between bin/rspec and rspec by loading bin dir in front of RVM
    set_tab_name `hostname | cut -d'.' -f 1`
  ;;
esac

# after installing vim, this simplifies getting my setup symlinked back to the
# dev_setup_gist
symlink_dev_setup() {
  rm /Users/jon/.vimrc
  rm /Users/jon/.vim/vimrc_main
  rm /Users/jon/.vimrc_custom
  rm /Users/jon/.vim/plugins.vim
  rm /Users/jon/.vim/snippets/_.snippets
  rm /Users/jon/.tmux.conf
  rm /Users/jon/.tmux_mac.conf

  ln -nsf /rails/github/dev_setup_gist/vimrc /Users/jon/.vimrc
  ln -nsf /rails/github/dev_setup_gist/vimrc_main /Users/jon/.vim/
  ln -nsf /rails/github/dev_setup_gist/vimrc_custom /Users/jon/.vimrc_custom
  ln -nsf /rails/github/dev_setup_gist/plugins.vim /Users/jon/.vim
  ln -nsf /rails/github/dev_setup_gist/snippets /Users/jon/.vim/snippets/_.snippets
  ln -nsf /rails/github/dev_setup_gist/tmux.conf /Users/jon/.tmux.conf
  ln -nsf /rails/github/dev_setup_gist/tmux_mac.conf /Users/jon/.tmux_mac.conf
}

overwrite_dev_setup_with_current() {
  mv /Users/jon/.vimrc /rails/github/dev_setup_gist/vimrc
  mv /Users/jon/.vim/vimrc_main /rails/github/dev_setup_gist/
  mv /Users/jon/.vim/vundle /rails/github/dev_setup_gist/
  mv /Users/jon/.vim/snippets/_.snippets /rails/github/dev_setup_gist/snippets
  mv /Users/jon/.tmux.conf /rails/github/dev_setup_gist/tmux.conf
  mv /Users/jon/.tmux_mac.conf /rails/github/dev_setup_gist/tmux_mac.conf
}

# Edit this file
alias ea='vim ~/.oh-my-zsh/custom/j2fly_shortcuts.zsh'

#Source this file
alias ea_source='source $HOME/.oh-my-zsh/custom/j2fly_shortcuts.zsh'
