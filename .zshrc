# Dotfiles path
DOTFILES=$HOME/.dotfiles

# Theme settings
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv)
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

antigen init $DOTFILES/.antigenrc

antigen apply

# Source files
source $DOTFILES/zsh/aliases
source $DOTFILES/zsh/apps
source $DOTFILES/zsh/functions
source $DOTFILES/zsh/fzf

export GOPATH="$HOME/.go:$HOME/Projects/go"
export PATH="$HOME/.bin:bin:$HOME/.go/bin:$HOME/Projects/go/bin:$PATH"
