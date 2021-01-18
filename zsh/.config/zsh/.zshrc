# vim: filetype=zsh syntax=zsh

# zmodload zsh/zprof     # Enable this when you want to profile your zshrc

# Custom completions directory
fpath+=("${XDG_DATA_HOME:-$HOME/.local/share}/zsh/completions")

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
#
# See https://github.com/romkatv/powerlevel10k#instant-prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Create XDG directories for zsh
mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/ ${XDG_DATA_HOME:-$HOME/.local/share}/zsh/ ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/

# Dotfiles path
DOTFILES=$HOME/.dotfiles

# ZSH settings
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=5
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history
mkdir -p $(dirname $HISTFILE)

LESSHISTFILE=/dev/null

source $ZDOTDIR/theme.zsh
source $ZDOTDIR/zinit.zsh



export AWS_SESSION_TOKEN_TTL=4h

#export GCLOUD_CONFIG=$DOTFILES/.gcloudrc

if [[ -f ${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zshrc ]]; then source ${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zshrc; fi


source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/func.zsh
