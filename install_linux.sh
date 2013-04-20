##
# Install with:
#
#   $ curl -sL http://git.io/bTdvZw | bash
#
 
cd ~
 
for dotfile in inputrc irbrc ackrc bash_linux tmux.conf; do
  echo "> Installing ~/.$dotfile"
  curl -sO https://raw.github.com/DAddYE/dotfiles/master/.$dotfile
done
 
bootstrap="[ -r ~/.bash_linux ] && . ~/.bash_linux"
 
if [ -z "`cat ~/.bash_profile | grep bash_linux`" ]; then
  echo -e "> Adding \033[1m$bootstrap\033[0m at bottom of your \033[1m~/.bash_profile\033[0m"
  echo $bootstrap >> ~/.bash_profile
fi
 
cd - > /dev/null
 
mkdir -p ~/.vim
cd ~/.vim
 
for vimfile in Rakefile bundle.rb vimrc gvimrc; do
  echo "> Installing ~/.vim/$vimfile"
  curl -sO https://raw.github.com/DAddYE/dotfiles/master/.vim/$vimfile
done
 
echo "> Setup vim"
rake
 
cd - > /dev/null
 
. ~/.bash_profile
 
echo -e "\033[32mAll set! That's it! Have fun and thanks for giving your bash some \033[1mlove\033[0m!!!"
