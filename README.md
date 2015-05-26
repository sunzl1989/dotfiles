# DAddYE's dotfiles

Here my dotfiles, different than others repos, this is though for people that love hacking vim and osx
from a terminal.

### MacVim

![MacVim Version](http://f.cl.ly/items/3a2H2O2T2X3A390o063T/tomorrow.macvim.png)

### Terminal Version

![Termnal Version](http://f.cl.ly/items/2F2T3U1U080m2M1k110B/tomorrow.term.png)

## Installation

```bash
git clone https://github.com/DAddYE/dotfiles.git && cd dotfiles && ./install.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
./install.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
./install.sh
```

This also boostrap your vim, with sensible defaults for your terminal!

### Add custom commands without creating a new fork

If `~/.bash_custom` exists, it will be sourced along with the other files.
You can use this to add a few custom commands without the need to fork this entire repository,
or to add commands you don’t want to commit to a public repository.

My `~/.bash_custom` looks something like this:

```bash
# PATH additions
export PATH="~/bin:$PATH"

# Git/Npm credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Davide D'Agostino"
GIT_AUTHOR_EMAIL="info@daddye.it"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"

npm config set email d.dagostino@lipsiasoft.com
```

## Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx_defaults
```

If you like my defaults you can avoid prompt with

```bash
./.osx_defaults -s
```

## Extras

### Maybe better if you install from [brew](https://github.com/mxcl/homebrew)

```bash
brew install macvim --custom-icons --override-system-vim
brew install node ack bash git tmux wget sshfs ssh-copy-id
```

### Iterm2

Since `iTerm2` is much much more faster than `Terminal.app` I highly suggest to [install it](https://github.com/gnachman/iTerm2)

Is free and opensource

### Colors

Vim has a nice new [Tomorrow Theme](https://github.com/chriskempson/vim-tomorrow-theme/tree/dev/colors), but to see correctly colors
like with [solarized](https://github.com/altercation/solarized) I suggest to install color profile to your terminal from `extra` folder.

### Fonts

Under `extras/fonts` you can find some of my preferred fixed-width fonts for your terminal, patched for `powerline` fancy.

## Thanks to

[Mathias Bynens](https://github.com/mathiasbynens) Heavily based on it's dotfiles

## Author

DAddYE, you can follow me on twitter [@daddye](http://twitter.com/daddye) or take a look at my site [daddye.it](http://www.daddye.it)
