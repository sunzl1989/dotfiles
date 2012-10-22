# Here my private stuff
[ -r ~/.bash_colors ] && source ~/.bash_colors
[ -r ~/.bash_custom ] && source ~/.bash_custom

# Set Lang
export LC_ALL="en_US.UTF-8"

# Set a better prompt
PS1="\W \[\033[01;34m\]$ \[\033[00m\]"

# Utilities
alias ls="ls -alh"
alias tail="tail -f -n 150"
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias update="sudo softwareupdate -i -a -v; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; gem update; cd ~/.vim && rake && cd -"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias cleanup.ds_store="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanup.user.cache="rm -rf ~/Library/Caches/*; sudo rm -rf /Library/Caches/*;"
alias cleanup.system.cache="sudo rm -rf /System/Library/Caches/* && echo && echo 'You must reboot to rebuild ktext and fonts...'"
alias cleanup.brew="brew cleanup"
alias rebuild.launchservices="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
alias locate.updatedb="sudo /usr/libexec/locate.updatedb"
alias portal.rev="curl -sI https://portal.triggit.com/login | grep Revision | awk '{print \$2}' | tr -d '\r' | open https://github.com/triggit/triggit-rails/commit/\$(cat)"

# Editor
export EDITOR="vim"

# Mysql
export PATH="/usr/local/mysql/bin:$PATH"

# Local (s)bin
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"

# Node Modules
export NODE_PATH="/usr/local/lib/node_modules"

# Colorize
export CLICOLOR=1

# Larger bash history (allow 32ÃÂ³ entries; default is 500)
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

# RBENV setup
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

if which npm > /dev/null; then
  eval "$(npm completion -)"
fi

# Brew stuff
if which brew > /dev/null; then
  [ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion
fi

# Add tab completion for `defaults read|write`
# complete -W "NSGlobalDomain  $(find {,~}/Library/Preferences -type f -name '*.plist' -exec basename {} '.plist' \;)" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall
