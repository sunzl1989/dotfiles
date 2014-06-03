# Here my private stuff
[ -r ~/.bash_custom ]  && source ~/.bash_custom
# [ -r ~/.bash_colors ]  && source ~/.bash_colors

# Set Lang
export LC_ALL="en_US.UTF-8"

# Set a better prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n 1) != "nothing to commit (working directory clean)" ]] && echo "*"
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
alias update="sudo softwareupdate -i -a -v; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; gem update; cd ~/.vim && rake && cd -"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias cleanup.ds_store="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanup.user.cache="rm -rf ~/Library/Caches/*; sudo rm -rf /Library/Caches/*;"
alias cleanup.system.cache="sudo rm -rf /System/Library/Caches/* && echo && echo 'You must reboot to rebuild ktext and fonts...'"
alias cleanup.brew="brew cleanup"
alias rebuild.launchservices="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
alias locate.updatedb="sudo /usr/libexec/locate.updatedb"
alias portal.rev="curl -sI https://portal.triggit.com/login | grep Revision | awk '{print \$2}' | tr -d '\r' | open https://github.com/triggit/triggit-rails/commit/\$(cat)"
alias rspec.one="RAILS_ENV=test rake db:setup &>/dev/null; bundle exec rspec"

# Editor
export EDITOR="vim"

# Go
export GOPATH="/usr/src/go"

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
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$GOROOT/bin:$PATH"

# Mov to Gif
gify() {
  if [[ -n "$1" && -n "$2" ]]; then
    ffmpeg -i $1 -pix_fmt rgb24 temp.gif
    convert -layers Optimize temp.gif $2
    rm temp.gif
  else
    echo "proper usage: gify <input_movie.mov> <output_file.gif>. You DO need to include extensions."
  fi
}

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
export HISTCONTROL=ignoredups

# Ruby
# export RUBY_HEAP_MIN_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=100000000
# export RUBY_HEAP_FREE_MIN=500000
export RAILS_ENV=development
export RACK_ENV=development

# Detective
[[ `which rbenv` ]] && eval "$(rbenv init -)"
[[ `which npm` ]]   && eval "$(npm completion -)"
[ -f /usr/local/etc/profile.d/z.sh ]  && . /usr/local/etc/profile.d/z.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
