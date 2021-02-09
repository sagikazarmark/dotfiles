#!/bin/bash


# Source: somewhere
# Source: https://gist.github.com/jcanfield/8966452

# Iterm settings
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.dotfiles/etc/mac/iterm"
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true
defaults write com.googlecode.iterm2 SUEnableAutomaticChecks -bool true

# Smart settings
# https://derflounder.wordpress.com/2014/02/01/disabling-smart-quotes-in-mavericks/
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defautlts write -g NSAutomaticCapitalizationEnabled -bool false
defautlts write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Configure Alfred
defaults write com.runningwithcrayons.Alfred-Preferences syncfolder -string "~/Google Drive/Profile/Mac"

echo "Make sure to disable Spotlight hotkeys manually (for now)!"

# Enable dark mode
defaults write -g AppleInterfaceStyle dark

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Hide dock
# https://discussions.apple.com/thread/5026935#21986392022
osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set keyboard speed
# defaults write -g InitialKeyRepeat -int 15
# defaults write -g KeyRepeat -int 1

# set repeat rate to 15ms, fastest value in system pref = 2 (30ms)
krp --repeat-rate 1.5

# set delay until repeat to 135ms, fastest value in system pref = 15 (225ms)
krp --delay-until-repeat 15

# Show volume in the menu bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -int 0

# Show Bluetooth in the menu bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -int 0

# Show battery life percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

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


# Mojave font issue
# https://github.com/Microsoft/vscode/issues/51132
# defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO


# Screenshot home directory
mkdir -p ~/Documents/Screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots


# Finder
# ======

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


# Displays have separate spaces
defaults write com.apple.spaces spans-displays -bool TRUE

# Disable automatic rearrange of spaces
defaults write com.apple.dock mru-spaces -bool FALSE

# Reduce motion (faster switching between spaces)
# Improves yabai experience when SIP is enabled
defaults write com.apple.universalaccess reduceMotion -bool TRUE
