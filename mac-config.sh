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

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Hide dock
# https://discussions.apple.com/thread/5026935#21986392022
osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Show volume in the menu bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -int 0

# Show Bluetooth in the menu bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -int 0

# Setup the screen saver to require password after a few seconds
defaults write com.apple.screensaver "askForPassword" -int 1
defaults write com.apple.screensaver "askForPasswordDelay" -int 5
defaults write com.apple.screensaver "tokenRemovalAction" -int 0

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Don't create dreaded .DS_Store files.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Don't want Photos.app to open up as soon as you plug something in?
defaults write com.apple.ImageCapture disableHotPlug -bool true

# Allow tap to click for Apple trackpad devices
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
