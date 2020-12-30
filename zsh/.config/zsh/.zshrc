# vim: filetype=zsh syntax=zsh

# zmodload zsh/zprof     # Enable this when you want to profile your zshrc

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

source $ZDOTDIR/directories.zsh
source $ZDOTDIR/theme.zsh
source $ZDOTDIR/zinit.zsh


# TODO: move these to somewhere else?
export GOPATH="$HOME/.go:$HOME/Projects/go"
export PATH="bin:$HOME/.local/bin:$HOME/.go/bin:$HOME/Projects/go/bin:$HOME/.cargo/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"

export AWS_SESSION_TOKEN_TTL=4h

#export GCLOUD_CONFIG=$DOTFILES/.gcloudrc

if [[ -f $HOME/.zshrc.local ]]; then source $HOME/.zshrc.local; fi

# Preferred editor for local and remote sessions
if [ -n $SSH_CONNECTION ]; then
    export EDITOR='nano'
    export GUIEDITOR='nano'
else
    export EDITOR='nano'
    export GUIEDITOR='code'
fi



source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/func.zsh
