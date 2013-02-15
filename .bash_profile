# Here my private stuff
[ -r ~/.bash_custom ] && source ~/.bash_custom

# Set Lang
export LC_ALL="en_US.UTF-8"

# Set a better prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n 1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)] /"
}

export PS1='\033[G\W \[\033[32m\]$(parse_git_branch)\[\033[00;01m\]$\[\033[00m\] '

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

# Mysql
export PATH="/usr/local/mysql/bin:$PATH"

# Go
export GOROOT="/usr/local/Cellar/go/1.0.3"
export GOBIN="$GOROOT/bin"

# Java
export JRUBY_OPTS="-Xcompile.invokedynamic=true -J-server -J-Xmn512m -J-Xms2048m -J-Xmx2048m"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export JRUBY_HOME="/Users/DAddYE/.rbenv/versions/jruby-1.7.2"

if which drip > /dev/null; then
  export JAVACMD=$(which drip)
fi

# RBX
export RBXOPT=-X19

# Local (s)bin
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$GOBIN:$PATH"

# Node Modules
# export NODE_PATH="/usr/local/share/lib/node_modules"

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

# Colorize
export CLICOLOR=1

# Larger bash history
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Fontforge
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# Ruby
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000
export RAILS_ENV=development
export RACK_ENV=development

# RBENV setup
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if which npm > /dev/null; then
  eval "$(npm completion -)"
fi

if which grunt > /dev/null; then
  eval "$(grunt --completion=bash)"
fi

# Brew stuff
if which brew > /dev/null; then
  [ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion
  if which ruby-build > /dev/null; then
    export CONFIGURE_OPTS="\
      --disable-install-doc \
      --with-readline-dir=$(brew --prefix readline) \
      --with-openssl-dir=$(brew --prefix openssl)
      --with-yaml-dir=$(brew --prefix yaml) \
      --with-gdbm-dir=$(brew --prefix gdbm) \
      --with-libffi-dir=$(brew --prefix libffi)"
  fi
fi

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall
