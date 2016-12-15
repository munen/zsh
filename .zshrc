# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# smart-case and use user
alias ag='ag -S --pager=less'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# History
HISTSIZE=4000
SAVEHIST=4000

plugins=(git bundler vi-mode)

source $ZSH/oh-my-zsh.sh

case `uname` in
Darwin)
  # Customize to your needs...
  export PATH=/usr/local/bin/firefox:/Applications/MacVim.app/Contents/MacOS:/usr/local/bin:/Developer/usr/bin:opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mysql/bin:/usr/local/git/bin:/Applications/ImageMagick/bin:/usr/local/sbin:/usr/texbin:/Users/preek/.rvm/bin

  # nvm
  source $(brew --prefix nvm)/nvm.sh

  # JAVA
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0u.jdk/Contents/Home

  # Added by the Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"

  # NODE
  export NODE_PATH="/usr/local/lib/node"

  # Never use haml with jRuby, because syntax checking will be very slow
  #alias vim='PATH=/Users/preek/.rvm/gems/ruby-1.9.3-p0/bin/:$PATH vim'
  # tmp fix for mavericks. no macvim available atm.
  #alias vim='/usr/bin/vim'

  alias debian_vm_start='VBoxManage startvm "Debian - Rbenv+Rails" --type headless'

  # Debian VM
  debian_vm_login() {
    DEBIAN_IP=$(VBoxManage guestproperty enumerate "Debian - Rbenv+Rails" | grep IP | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])')
    if [[ $DEBIAN_IP != "" ]]
    then
      echo "Found Debian box at: " $DEBIAN_IP
      echo "Connecting to Debian box...\n\n==========================\n\n"

      # hack, because i'm using port forwarding
      ssh -p 2222 munen@127.0.0.1

      #ssh munen@$DEBIAN_IP
    else
      echo "No IP set yet. Sleep 1s and retry."
      sleep 1
      debian_vm_login
    fi
  }
  ;;
Linux)
  alias ls='ls -F --color=auto'

  # Activate NVM
  source ~/.nvm/nvm.sh

  # Scale GTK+ 3 apps for HiDPI
  export GDK_SCALE=2
  ;;
esac

export EDITOR=e

alias sqlite3='sqlite3 -line'
alias less='less -R' # Colors in Rails logs
export LESS=-RFX

# git aliases
alias cgs='clear; git status'
alias ga='git add'
alias gp='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gl="git log --pretty=format:'%Cred%h %Cgreen%ad %Cblue%aN %Creset%s' --date=iso --graph --branches"
alias gs='git status'
alias gd='git diff --color'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

# open files with vim without 'open' command
alias -s tex rb css sass haml js coffee=vim

# SSH Tunnel
alias ssh_tunnel='echo "Establishing SOCKS at localhost:9999"; ssh -D 9999 app@staging.voicerepublic.com'
alias ips="sudo ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

alias pgdump='pg_dump dental_development > ~/pgdump_`date +%F`.sql && gzip ~/pgdump_`date +%F`.sql && ls -lh pgdump_*'

alias e='emacsclient -nw'

# Key bindings
bindkey "^p" history-beginning-search-backward
bindkey "^[n" history-beginning-search-forward
bindkey -M viins '^r' history-incremental-pattern-search-backward
bindkey -M vicmd '^r' history-incremental-pattern-search-backward
# I do not really want 'beep' to be bound to M+v, but normally M+v is bound to edit-command-line which is a problem, because I want M+v to be solely used by I3
bindkey -M vicmd v beep

# Edit current command line in emacs
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# rails
export PATH=./bin:$PATH

unsetopt correct_all

# vi mode
set -o vi

# Recomy
export JS_DRIVER=phantomjs

function ssh() {
    dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:Tango
    /usr/bin/ssh $@
    dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID string:solarized-dark
}

# pivotaltracker
source ~/.zsh/pivotal_tracker_api.sh

alias serve_directory="ruby -run -e httpd . -p 8080"

# mass rename file extension
# Usage:
#   $ mmv *m4a *m4b
autoload -U zmv
alias mmv='noglob zmv -W'

export VIM_APP_DIR=/usr/local/Cellar/macvim/7.4-73_1/MacVim.app
alias slime='tmux new-session -s default irb'

alias dmenu_run="dmenu_run -fn arial"

export TERM=xterm-256color

# alias curl="proxychains curl"

# Add Phils sourceme hook
# 200ok.ch/contextual-helpers-with-zsh-hooks/index.html
autoload -U add-zsh-hook

# source .sourceme files
load-local-conf() {
  # check file exists, is regular file and is readable:
  if [[ -f .sourceme && -r .sourceme ]]; then
  	source .sourceme
  fi
}
add-zsh-hook chpwd load-local-conf
