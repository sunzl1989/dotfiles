# Here my private stuff
[ -r ~/.bash_custom ] && source ~/.bash_custom

# Set Lang
export LC_ALL="en_US.UTF-8"

# Set a better prompt
# PS1="\[\033[00;36m\]\u\[\033[00;33m\]@\[\033[00;31m\]\h \[\033[00;33m\]\w \[\033[00;35m\]# \[\033[00m\]"
PS1="\[\033[00;36m\]\u\[\033[00;33m\]:\[\033[00;33m\]\W \[\033[00;35m\] \[\033[00m\]"

# Utilities
alias ls="ls -alh"
alias tail="tail -f -n 150"
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias update="sudo softwareupdate -i -a -v; brew update; brew upgrade; npm update; gem update; cd ~/.vim && rake && cd -"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias cleanup.ds_store="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanup.user.cache="rm -rf ~/Library/Caches/*; sudo rm -rf /Library/Caches/*;"
alias cleanup.system.cache="sudo rm -rf /System/Library/Caches/* && echo && echo 'You must reboot to rebuild ktext and fonts...'"
alias cleanup.brew="brew cleanup"
alias rebuild.launchservices="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
alias locate.updatedb="sudo /usr/libexec/locate.updatedb"

# Editor
export EDITOR="vim"

# Mysql
export PATH="/usr/local/mysql/bin:$PATH"

# Local (s)bin
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Node Modules
export NODE_PATH="/usr/local/lib/node_modules"

# Colorize
export CLICOLOR=1

# Larger bash history (allow 32ÃÂ³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# RBENV setup
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# Brew stuff
if which brew > /dev/null; then
  [ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion
fi

# Add tab completion for `defaults read|write`
# complete -W "NSGlobalDomain  $(find {,~}/Library/Preferences -type f -name '*.plist' -exec basename {} '.plist' \;)" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall
