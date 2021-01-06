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

chmod -R 755 /usr/local/share/zsh/site-functions
chmod -R 755 /usr/local/share/zsh

# Set global UNAME env var
launchctl setenv UNAME Darwin
export UNAME=Darwin # Set for this session

$DIR/config-mac.sh

stow \
    asdf \
    git \
    karabiner \
    kitty \
    nvim \
    skhd \
    wd \
    yabai \
    zsh

# Change shell
if [ $SHELL != "/bin/zsh" ]; then
    chsh -s /bin/zsh
    export SHELL="/bin/zsh"
    exec $SHELL
fi

echo "Installation was successful!"
