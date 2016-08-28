# Here my private stuff

[ -r ~/.bash_custom ]  && source ~/.bash_custom

# Set Lang
export LC_ALL="en_US.UTF-8"

# Set a better prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n 1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)] /"
}

export PS1='\W \[\033[32m\]$(parse_git_branch)\[\033[00;01m\]$\[\033[00m\] '

# Pretty go coverage
go-cover () {
  t="/tmp/go-cover.$$.tmp"
  go test -coverprofile=$t "$@" && go tool cover -html=$t && unlink $t
}

go-cover-fancy () {
  [[ `which gocov` ]] || go get -u -v github.com/axw/gocov/gocov
  [[ `which gocov-html` ]] || go get -u -v github.com/matm/gocov-html
  t="/tmp/go-cover.$$.html"
  gocov test "$@" | gocov-html >| $t && open $t
}

go-build () {
  go install -gcflags "-trimpath $GOPATH/src" "$@"
}

# Editor
if [[ `which nvim` ]]; then
	export EDITOR="nvim"
else
	export EDITOR="vim"
fi

# Utilities
alias ls="ls -alhG"

# alias tail="tail -f -n 150"
# sudo softwareupdate -i -a -v;
alias update="brew update; brew upgrade --all; brew cleanup; npm -g upgrade; vim +BundleUpdate +qall"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias vim="nvim"
alias vi="nvim"

# Source files
export SRC=~/.src

# Go
if [[ `which go` ]]; then
	export GOPATH=$SRC/go
	export GOROOT=$(go env GOROOT)
	launchctl setenv GOROOT $GOROOT
	launchctl setenv GOPATH $GOPATH
	export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
fi

# MRUBY
export MRUBY="/usr/src/mruby"

# OOC
export OOC_LIBS="/usr/src/ooc"

# Node/Npm
export NODE_PATH="/usr/local/lib/node_modules"

# Allow insecure downloads
# export HTTP_CLIENT="curl --insecure -f -L -o"

# Add some local bin
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"

# Recursive match
# shopt -s globstar

# Colorize
export CLICOLOR=1

# Colored grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# Larger bash history
export HISTSIZE="" # Infinite
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# Ruby
export RAILS_ENV=development
export RACK_ENV=development

# Node
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


# Load completions and others things
[[ `which rbenv` ]] && eval "$(rbenv init -)"
[ -f /usr/local/etc/profile.d/z.sh ]  && . /usr/local/etc/profile.d/z.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/bin/virtualenvwrapper.sh ] && . /usr/local/bin/virtualenvwrapper.sh
