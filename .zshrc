# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Customize to your needs...
export PATH=/Applications/MacVim.app/Contents/MacOS:/usr/local/bin:/Developer/usr/bin:opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/mysql/bin:/usr/local/git/bin:/Applications/ImageMagick/bin:/usr/local/sbin:/usr/texbin:/Users/preek/.rvm/bin

# JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0u.jdk/Contents/Home

# Never use haml with jRuby, because syntax checking will be very slow
#alias vim='PATH=/Users/preek/.rvm/gems/ruby-1.9.3-p0/bin/:$PATH vim'
# tmp fix for mavericks. no macvim available atm.
#alias vim='/usr/bin/vim'


export EDITOR=vim

alias ls='ls -G'
alias sqlite3='sqlite3 -line'
alias less='less -R' # Colors in Rails logs
export LESS=-RFX

# commented so homebrew does not complain
#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# git aliases
alias cgs='clear; git status'
alias ga='git add'
alias gp='git push'
alias gl="git log --pretty=format:'%Cred%h %Cgreen%ad %Cblue%aN %Creset%s' --date=iso"
alias gs='git status'
alias gd='git diff'
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

# NODE ->
#export NODE_PATH="/usr/local/homebrew/lib/node"
export NODE_PATH="/usr/local/lib/node"


# SSH Tunnel
alias ssh_tunnel='echo "Establishing SOCKS at localhost:9999"; ssh -D 9999 -p 14690 dispatched.ch'

alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

alias pgdump='pg_dump dental_development > ~/pgdump_`date +%F`.sql && gzip ~/pgdump_`date +%F`.sql && ls -lh pgdump_*'


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

#export http_proxy=igw-ktsg-al.abxsec.com:8080
#export KANTON=SG

# Key bindings
bindkey "^p" history-beginning-search-backward
bindkey "^[n" history-beginning-search-forward
bindkey -M viins '^r' history-incremental-pattern-search-backward
bindkey -M vicmd '^r' history-incremental-pattern-search-backward
bindkey -M vicmd v edit-command-line

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Paths
unset RUBYOPT
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/node_modules/.bin # Add node executables to path

#unsetopt correct_all

# vi mode
set -o vi


# pivotaltracker
source ~/.zsh/pivotal_tracker_api.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
