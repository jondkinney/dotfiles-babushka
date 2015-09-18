# Tunnels
# -------
alias tunnel_name='ssh -L 3307:example.com:3306 hostname' # Example for mysql ports. hostname would need to be in ~/.ssh/config
alias tunnel_pete='ssh -L 42000:localhost:4200 pete' # Example for mysql ports. hostname would need to be in ~/.ssh/config
alias tunnel_pete_rails='ssh -L 3000:localhost:3000 pete' # Example for mysql ports. hostname would need to be in ~/.ssh/config

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
alias flush_dns='dscacheutil -flushcache'
alias fixbrew='sudo chown -R `whoami` /usr/local'
alias fixpow='rvm env . -- --env > .powenv'
alias c='clear'
alias clera='clear'
alias rm_sym='find . ! -name . -prune -type l | xargs rm'

# Directories
alias l='ls -lah'

# Git
# -----------------
alias gboom='git add -A; git commit -m "Boom"; git push;'
alias gg='git goggles'
alias glg='git log --no-merges --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
alias glgl='git log --no-merges --reverse --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'
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
# compdef gmnff=git
alias mmts='git checkout staging; git merge --no-edit --no-ff master; git push; git push --tags'
alias mmtp='git checkout production; git merge --no-edit --no-ff master; git push; git push --tags'
alias mmte='mmts;mmtp'
alias gbc='git rev-parse --abbrev-ref HEAD 2>/dev/null | cut -d"/" -f 2 | tr -d "\n" | pbcopy' # copies the current branch to your clipboard (on os x)
alias gp='git push;git push --tags'
alias gs='git stash'
alias gsp='git stash pop'
alias gd='git diff'
alias zff='zenflow feature finish'
alias dev='git checkout development'
alias sta='git checkout staging'
alias prd='git checkout production'
alias mas='git checkout master'


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

# Project Shortcuts
# -----------------
alias fph='cd /rails/fans-park-here; setTerminalText 0 FPH; tmuxinator start fph'
alias mvc='cd /rails/clients/moulding_visions; setTerminalText 0 MVC; tmuxinator start mvc'
alias trista='cd /rails/clients/trista; setTerminalText 0 TRISTA; tmuxinator start trista'
alias allovue='cd /rails/allovue; setTerminalText 0 Allovue; tmuxinator start allovue'
alias mailtank='cd /rails/mailtank-enduser; setTerminalText 0 Mailtank; tmuxinator start mailtank'
alias cohealo='cd /rails/scheduler; setTerminalText 0 Cohealo; tmuxinator start cohealo'
alias garnethill='cd /rails/garnethill-clarity; setTerminalText 0 GarnetHill; tmuxinator start garnethill'
alias hack='tmuxinator start hack; setTerminalText 0 Hack'
alias blog='setTerminalText 0 Blog; tmuxinator start blog'
alias bolstr='cd /rails/bolstr/bolstr; setTerminalText 0 Bolstr; tmuxinator start bolstr'
alias bolstr_floobits='cd ~/floobits/BolstrInc/app-bolstr; setTerminalText 0 Bolstr Floobits; tmuxinator start bolstr_floobits'
alias petpb='cd /rails/faster_agile/PetPB-backend; setTerminalText 0 PetPB; tmuxinator start petpb'
alias tpc='cd /rails/faster_agile/tpc/tpc-payment-api; setTerminalText 0 TPC; tmuxinator start tpc'
alias adored='cd /rails/faster_agile/adored/adored-admin; setTerminalText 0 Adored; tmuxinator start adored'
alias fun='cd /rails/github/test; setTerminalText 0 Shell; tmuxinator start test'

alias hack_dev_setup='setTerminalText 0 Dev Setup; tmuxinator start dev_setup'

# VIM
# ---
#alias vim='nvim'
alias vbi='vim +BundleInstall +qall'
alias vbe='vim ~/.vim/vundle'
alias vbc='vim +BundleClean +qall'
alias vim_huge='vim -u NONE -U NONE -N $*'

alias jonvim='vim ~/Dropbox/Documents/Web\ Development/Vim/jons_vim_guide.txt'

# RAILS
# -----
# you need to use bundle exec before each command you run in a app controled by
# bundler so this alias helps make that easier
alias b='bundle exec $*'
alias p='bundle exec powder $*'
alias rdm='bin/rake db:migrate'
alias rc='bin/rails console'
alias rdbc='bin/rails dbconsole'
alias kr='kill -9 `cat tmp/pids/server.pid; echo;`'

# NODE
# ----
alias nombomb='trash node_modules; bower cache clean && trash bower_components'

# CAPISTRANO
# ----------
alias ds='git checkout staging; bundle exec cap deploy'
alias dsm='git checkout staging; bundle exec cap deploy:migrations'
alias dp='git checkout production; bundle exec cap production deploy'
alias dpm='git checkout production; bundle exec cap production deploy:migrations'

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
nt         () { setTerminalText 0 $@; }
stt_tab    () { setTerminalText 1 $@; }
stt_title  () { setTerminalText 2 $@; }


# after installing vim, this simplifies getting my setup symlinked back to the
# dev_setup_gist
symlink_dev_setup() {
  rm /Users/jon/.vimrc
  rm /Users/jon/.vim/vimrc_main
  rm /Users/jon/.vim/vundle
  rm /Users/jon/.vim/snippets/_.snippets
  rm /Users/jon/.tmux.conf
  rm /Users/jon/.tmux_mac.conf

  ln -nsf /rails/github/dev_setup_gist/vimrc /Users/jon/.vimrc
  ln -nsf /rails/github/dev_setup_gist/vimrc_main /Users/jon/.vim/
  ln -nsf /rails/github/dev_setup_gist/vundle /Users/jon/.vim
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
