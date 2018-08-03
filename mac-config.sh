#!/bin/bash

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
