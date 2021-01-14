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

# Dotfiles path
DOTFILES=$HOME/.dotfiles

# ZSH settings
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=5
HISTSIZE=10000000
SAVEHIST=10000000

source $ZDOTDIR/paths.zsh
source $ZDOTDIR/theme.zsh
source $ZDOTDIR/zinit.zsh



export AWS_SESSION_TOKEN_TTL=4h

#export GCLOUD_CONFIG=$DOTFILES/.gcloudrc

if [[ -f ${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zshrc ]]; then source ${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zshrc; fi

# Preferred editor for local and remote sessions
if [ -n $SSH_CONNECTION ]; then
    export EDITOR='nvim'
    export GUIEDITOR='nvim'
else
    export EDITOR='nvim'
    export GUIEDITOR='code'
fi



source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/func.zsh
