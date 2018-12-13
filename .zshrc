# Dotfiles path
DOTFILES=$HOME/.dotfiles

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=5
export HISTFILE=$HOME/.zsh_history

#ENABLE_CORRECTION="true"

# Theme settings
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
#POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# Preferred editor for local and remote sessions
if [ -n $SSH_CONNECTION ]; then
    export EDITOR='nano'
    export GUIEDITOR='nano'
else
    export EDITOR='nano'
    export GUIEDITOR='code'
fi

if which goenv > /dev/null; then eval "$(goenv init -)"; fi
if which goenv > /dev/null; then export GOROOT="$(goenv prefix)/"; fi
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
#if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#if which thefuck > /dev/null; then eval "$(thefuck --alias)"; fi

# Workaround for kubectl plugin not working
# https://github.com/zsh-users/antigen/issues/603
# https://github.com/zsh-users/antigen/issues/583
#if which kubectl > /dev/null; then kubectl completion zsh > "${fpath[1]}/_kubectl"; fi

ZSHFW="zplug"

source $DOTFILES/.zshplugins

if [[ $ZSHFW == "ohmyzsh" ]]; then
    ZSH_THEME="powerlevel9k/powerlevel9k"
    export ZSH="$HOME/.oh-my-zsh"
    source $ZSH/oh-my-zsh.sh
    autoload -U compinit && compinit
elif [[ $ZSHFW == "zplug" ]]; then
    export ZPLUG_HOME=/usr/local/opt/zplug
    POWERLEVEL9K_INSTALLATION_PATH=$ZPLUG_HOME/repos/bhilburn/powerlevel9k
    source $ZPLUG_HOME/init.zsh

    zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh", defer:1

    for plugin in $plugins; do
        if [[ $plugin == "zsh-completions" ]]; then
            zplug "zsh-users/$plugin", defer:2

            continue
        elif [[ $plugin == "zsh-autosuggestions" || $plugin == "zsh-syntax-highlighting" ]]; then
            zplug "zsh-users/$plugin"

            continue
        fi

        zplug "plugins/$plugin", from:oh-my-zsh
        #, if:"[[ $OSTYPE == *darwin* ]]"
    done

    # Load the theme
    zplug "bhilburn/powerlevel9k", as:theme

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load
elif [[ $ZSHFW == "antigen" ]]; then
    POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

    source /usr/local/share/antigen/antigen.zsh

    antigen use oh-my-zsh

    for bundle in plugins; do
        if [[ $bundle == "zsh-syntax-highlighting" || $bundle == "zsh-autosuggestions" || $bundle == "zsh-completions" ]]; then
            antigen bundle zsh-users/$bundle

            continue
        fi

        antigen bundle $bundle
    done

    # Load the theme
    antigen theme bhilburn/powerlevel9k powerlevel9k

    antigen apply
fi

# Source files
source $DOTFILES/zsh/aliases
source $DOTFILES/zsh/apps
source $DOTFILES/zsh/functions
source $DOTFILES/zsh/fzf

export GOPATH="$HOME/.go:$HOME/Projects/go"
export PATH="$HOME/.bin:bin:$HOME/.go/bin:$HOME/Projects/go/bin:$HOME/.cargo/bin:$PATH"
