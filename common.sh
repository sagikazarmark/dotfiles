#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Source zsh config
if [ -f $HOME/.zshrc ]; then
    grep -q -F 'source $HOME/.dotfiles/.zshrc.mac' $HOME/.zshrc || echo -e "source \$HOME/.dotfiles/.zshrc.mac\n$(cat $HOME/.zshrc)" > $HOME/.zshrc
else
    grep -q -F 'source $HOME/.dotfiles/.zshrc.mac' $HOME/.zshrc || echo 'source $HOME/.dotfiles/.zshrc.mac' > $HOME/.zshrc
fi

# Link .warprc
ln -sf $DIR/.warprc $HOME/.warprc

# Link git configs
ln -sf $DIR/.gitconfig $HOME/.gitconfig
ln -sf $DIR/.gitignore $HOME/.gitignore
