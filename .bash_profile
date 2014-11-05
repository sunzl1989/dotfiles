# Here my private stuff
[ -r ~/.bash_custom ]  && source ~/.bash_custom
# [ -r ~/.bash_colors ]  && source ~/.bash_colors

# Set Lang
export LC_ALL="en_US.UTF-8"

# Set a better prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n 1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)] /"
}

function findpid {
  ps aux | grep $1 | awk '{print $2}'
}

function killmatch {
  pid=$1; shift
  findpid $pid | xargs kill "$@"
}

export PS1='\W \[\033[32m\]$(parse_git_branch)\[\033[00;01m\]$\[\033[00m\] '

# Utilities
alias ls="ls -alhG"
# alias tail="tail -f -n 150"
alias update="sudo softwareupdate -i -a -v; brew update; brew upgrade; brew cleanup; gem update; cd ~/.vim && rake && cd -"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias cleanup.ds_store="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanup.brew="brew cleanup"
alias rebuild.launchservices="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
alias locate.updatedb="sudo /usr/libexec/locate.updatedb"

# Editor
export EDITOR="vim"

# Go
export GOROOT=
export GOPATH="/usr/src/go"
export GOROOT=$(go env GOROOT)

launchctl setenv GOROOT $GOROOT
launchctl setenv GOPATH $GOPATH

# MRUBY
export MRUBY="/usr/src/mruby"

# OOC
export OOC_LIBS="/usr/src/ooc"

# Java
# export JRUBY_OPTS="-Xcompile.invokedynamic=true -J-server -J-Xmn512m -J-Xms2048m -J-Xmx2048m"
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
# export JRUBY_HOME="/Users/DAddYE/.rbenv/versions/jruby-1.7.2"
# export TORQUEBOX_HOME=~/.lein/immutant/current="$TORQUEBOX_HOME/jruby/bin:$PATH"
# export LEIN_FAST_TRAMPOLINE=1
# export CLJ_ENV="development"

# Allow insecure downloads
export HTTP_CLIENT="wget --no-check-certificate -O" # or
export HTTP_CLIENT="curl --insecure -f -L -o"

if [[ `which drip` ]]; then
  export JAVACMD=$(which drip)
  export LEIN_JAVA_CMD=$JAVACMD
fi

# RBX
export RBXOPT=-X19

# Add some local bin
export PATH="/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$GOROOT/bin:$MRUBY/bin:$OOC_LIBS/sam:$OOC_LIBS/rock/bin:$HOME/.cabal/bin:$PATH"

# Recursive match
# shopt -s globstar

# Colorize
export CLICOLOR=1

# Colored grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# Larger bash history
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Ruby
export RAILS_ENV=development
export RACK_ENV=development

# Detective
[[ `which rbenv` ]] && eval "$(rbenv init -)"
[ -f /usr/local/etc/profile.d/z.sh ]  && . /usr/local/etc/profile.d/z.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
