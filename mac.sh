#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

if [[ $OSTYPE != darwin* ]]; then
    echo "This script should be run on a Mac."

    exit 1
fi

# Install brew if it's not already installed
which -s brew > /dev/null
if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install dependencies
brew bundle
$DIR/brew-post-hook.sh

$DIR/common.sh
$DIR/mac-config.sh

# Change shell
if [ $SHELL != "/bin/zsh" ]; then
    chsh -s /bin/zsh
    exec /bin/zsh
fi
