#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

if [[ $OSTYPE != darwin* ]]; then
    echo "This script should be run on a Mac."

    exit 1
fi

# Install brew if it's not already installed
if ! which -s brew > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install dependencies
brew bundle -v
$DIR/brew-post-hook.sh

cp $DIR/.zshrc.mac $HOME/.zshrc

chmod -R 755 /usr/local/share/zsh/site-functions
chmod -R 755 /usr/local/share/zsh

# Change shell
if [ $SHELL != "/bin/zsh" ]; then
    chsh -s /bin/zsh
    export SHELL="/bin/zsh"
    exec $SHELL
fi

#source ~/.zshrc

$DIR/common.sh
$DIR/mac-config.sh

echo "Installation was successful!"
