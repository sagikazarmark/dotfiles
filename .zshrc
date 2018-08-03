antigen use oh-my-zsh

antigen bundle <<EOBUNDLES
    # Bundles from the default repo (robbyrussell's oh-my-zsh)
    wd
    zsh_reload
    common-aliases
    gpg-agent
    urltools
    encode64
    httpie
    screen
    web-search
    command-not-found

    # Development
    git
    git-extras
    docker
    docker-compose

    # Programming languages
    node
    npm
    golang

    # OSX specific
    osx
    iterm2

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions
EOBUNDLES

# Load the theme.
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
#POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='nano'
fi

# Source files
for f in $(find -L $HOME/.dotfiles/zsh/ -type f); do source $f; done

export GOPATH="$HOME/.go:$HOME/Projects/go"

export PATH="$HOME/.bin:bin:$HOME/.go/bin:$HOME/Projects/go/bin:$PATH"

if which firefox > /dev/null; then export BROWSER=$(which firefox); fi
