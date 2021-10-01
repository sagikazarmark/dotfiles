# vim: filetype=zsh syntax=zsh

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
if [ -e /Users/marksk/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/marksk/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
