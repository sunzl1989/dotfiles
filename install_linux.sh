##
# Install with:
#
#   $ curl -sL http://git.io/t5f0Pg | bash
#
cd ~

for dotfile in inputrc irbrc ackrc bash_linux bash_colors tmux.conf; do
  echo "> Installing ~/.$dotfile"
  curl -sOL https://raw.github.com/DAddYE/dotfiles/master/.$dotfile
done

bootstrap="[[ -r ~/.bash_linux ]] && . ~/.bash_linux"

if [ -z "`cat ~/.bash_profile | grep bash_linux`" ]; then
  echo -e "> Adding \033[1m$bootstrap\033[0m at bottom of your \033[1m~/.bash_profile\033[0m"
  echo $bootstrap >> ~/.bash_profile
fi

cd - > /dev/null

mkdir -p ~/.vim
cd ~/.vim

for vimfile in vimrc; do
  echo "> Installing ~/.vim/$vimfile"
  curl -sOL https://raw.github.com/DAddYE/dotfiles/master/.vim/$vimfile
done

echo "> Setup vim"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd - > /dev/null

. ~/.bash_profile

echo -e "\033[32mAll set! That's it! Have fun and thanks for giving your bash some \033[1mlove\033[0m!!!"
