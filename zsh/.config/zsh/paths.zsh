# This file configures config, data and cache file paths for various programs
# As a thumb rule everything should go into XDG standard base directories
#
# See https://wiki.archlinux.org/index.php/XDG_Base_Directory
#
# Although XDG environment variables are defined at the beginning of this file
# further variables should use the fallback syntax for portability.

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CONFIG_HOME

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$HOME/.local/bin"

# We don't have to export this as it's used by the shell
HISTFILE=${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history
mkdir -p $(dirname $HISTFILE)

export LESSHISTFILE=/dev/null

# Create cache dir for zsh
mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/

export REDISCLI_HISTFILE=${XDG_DATA_HOME:-$HOME/.local/share}/rediscli/history
mkdir -p $(dirname $REDISCLI_HISTFILE)

export WD_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/wd/warprc"
export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/asdf/asdfrc"
export ASDF_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/asdf"
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="${XDG_CONFIG_HOME:-$HOME/.config}/asdf/tool-versions"
export K9SCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/k9s"

export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

# Deprecated: project should be moved out of this gopath
export GOPATH="$GOPATH:$HOME/Projects/go"

export KREW_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/krew"
export COMPOSER_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/composer"
export COMPOSER_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/composer"





# Go binaries
export PATH="$(echo $GOPATH | cut -d ':' -f1)/bin:$HOME/Projects/go/bin:$PATH"

# Rust binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Krew binaries
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"

# Local binaries
export PATH="bin:$PATH"
