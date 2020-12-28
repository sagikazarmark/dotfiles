# SPEEEEEED: https://blog.jonlu.ca/posts/speeding-up-zsh

zmodload zsh/zprof


# https://asdf-vm.com/#/

# https://github.com/romkatv/powerlevel10k
# https://zdharma.org/zinit/wiki/
# https://www.reddit.com/r/zsh/comments/ak0vgi/a_comparison_of_all_the_zsh_plugin_mangers_i_used/

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Dotfiles path
DOTFILES=$HOME/.dotfiles

#export ZDOTDIR=$DOTFILES

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=5
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000000
export SAVEHIST=10000000

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

export WD_CONFIG=$DOTFILES/.warprc
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=$DOTFILES/.tool-versions

#ENABLE_CORRECTION="true"

#source $DOTFILES/zsh/prompts
#POWERLEVEL9K_CUSTOM_TERRAFORM="terraform_workflow"
#POWERLEVEL9K_CUSTOM_TERRAFORM_BACKGROUND="magenta"
#POWERLEVEL9K_CUSTOM_TERRAFORM_FOREGROUND="white"

# Theme settings
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_terraform vcs)
#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
#POWERLEVEL9K_MODE='awesome-patched'
#POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# Preferred editor for local and remote sessions
if [ -n $SSH_CONNECTION ]; then
    export EDITOR='nano'
    export GUIEDITOR='nano'
else
    export EDITOR='nano'
    export GUIEDITOR='code'
fi

[[ ! -f $DOTFILES/.p10k.zsh ]] || source $DOTFILES/.p10k.zsh
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

PS1="READY > "

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

module_path+=( "${HOME}/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin &>/dev/null

autoload -Uz compinit
compinit

zinit ice depth=1 lucid
zinit light romkatv/powerlevel10k

zinit ice wait lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit cdclear -q

zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/misc.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

zinit ice lucid
zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
#zinit snippet OMZ::plugins/golang/golang.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zinit cdclear -q

zinit ice wait lucid
zinit snippet OMZ::plugins/helm/helm.plugin.zsh

#zinit ice wait lucid
#zinit snippet OMZ::plugins/osx/osx.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/iterm2/iterm2.plugin.zsh

zinit ice wait lucid
zplugin light asdf-vm/asdf
zinit cdclear -q

#zinit ice as"program" cp"wd.sh -> wd" mv"_wd.sh -> _wd" atpull'!git reset --hard' pick"wd"
zinit ice wait lucid blockf as"program" pick"wd.sh" mv"_wd.sh -> _wd" atload"wd() { source wd.sh }"
zinit light mfaerevaag/wd

zinit ice wait lucid as"completion"
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zinit ice wait lucid as"completion"
zinit snippet https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose

# Fast-syntax-highlighting & autosuggestions
zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions

zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

zinit ice wait'!' lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# Source files
source $DOTFILES/zsh/aliases
source $DOTFILES/zsh/apps
source $DOTFILES/zsh/functions
source $DOTFILES/zsh/fzf

export GOPATH="$HOME/.go:$HOME/Projects/go"
export PATH="bin:$HOME/.bin:$HOME/.go/bin:$HOME/Projects/go/bin:$HOME/.cargo/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export AWS_SESSION_TOKEN_TTL=4h

#export GCLOUD_CONFIG=$DOTFILES/.gcloudrc

if [[ -f $HOME/.zshrc.local ]]; then source $HOME/.zshrc.local; fi

# Unset 'duf' alias set by ohmyzsh in OMZ::plugins/common-aliases/common-aliases.plugin.zsh
unalias duf
