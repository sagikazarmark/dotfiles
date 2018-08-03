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

# Iterm settings
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "/Users/mark/Google Drive/Profile/Mac/iterm"
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true
defaults write com.googlecode.iterm2 SUEnableAutomaticChecks -bool true

# Smart settings
# https://derflounder.wordpress.com/2014/02/01/disabling-smart-quotes-in-mavericks/
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Configure Alfred
defaults write com.runningwithcrayons.Alfred-Preferences-3 syncfolder -string "~/Google Drive/Profile/Mac"

echo "Make sure to disable Spotlight hotkeys manually (for now)!"

# Hide dock
osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"

# Change shell
if [ $SHELL != "/bin/zsh" ]; then
    chsh -s /bin/zsh
    exec /bin/zsh
fi
