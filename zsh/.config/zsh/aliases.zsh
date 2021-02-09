# Basic file aliases
alias ll="ls -halF"
alias la="ls -A"
alias l="ls -CF"
alias rmdot="rm -rf .[!.]*"

# Find my IP address
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Open a path in the chosen GUI editor
alias edit='$GUIEDITOR'

# Edit a file as sudo
alias sudoedit='sudo $EDITOR'

# Edit hosts file
alias ehost='sudoedit /etc/hosts'

# Find a running process excluding the process list one
alias pu="ps aux | grep -v grep | grep"

# Restart SHELL
alias rs='exec $SHELL'

# Gron aliases
alias norg="gron --ungron"
alias ungron="gron --ungron"

alias plzdev='/Users/mark/Projects/contrib/please/plz-out/bin/src/please'

alias doco="docker-compose"

# Convert an image to favicon
alias favico="convert -resize x32 -gravity center -crop 32x32+0+0 -flatten -colors 256 -background transparent"

alias vim=nvim

# Unset 'duf' alias set by ohmyzsh in OMZ::plugins/common-aliases/common-aliases.plugin.zsh
unalias duf

if [[ $TERM == "xterm-kitty" ]]; then
	alias ssh="kitty +kitten ssh"
fi
