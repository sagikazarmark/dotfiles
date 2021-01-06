# Prompt for Turbo mode
# See http://zdharma.org/zinit/wiki/INTRODUCTION/#turbo_mode_zsh_53
PS1="READY > "

declare -A ZINIT
export ZINIT[HOME_DIR]="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"
export ZINIT[BIN_DIR]="$ZINIT[HOME_DIR]/bin"

### Added by Zinit's installer
if [[ ! -f $ZINIT[BIN_DIR]/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$ZINIT[HOME_DIR]" && command chmod g-rwX "$ZINIT[HOME_DIR]"
    command git clone https://github.com/zdharma/zinit "$ZINIT[BIN_DIR]" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$ZINIT[BIN_DIR]/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

# I don't know what this is
# Maybe https://github.com/zdharma/zinit#zinit-module ?
module_path+=( "$ZINIT[BIN_DIR]/zmodules/Src" )
zmodload zdharma/zplugin &>/dev/null

_zsh_finish_setup() {
    command -v kitty >/dev/null && . <(kitty + complete setup zsh 2>/dev/null)

    # Use vim keys in tab complete menu:
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
    bindkey -M menuselect 'j' vi-down-line-or-history
}

autoload -Uz compinit
compinit -d ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump

# Load theme
# Turbo mode is not used here (theme is fast and instant prompt is used)
# See https://www.reddit.com/r/zinit/comments/glp6bz/zinit_vsplus_powerlevel10k/
zinit ice depth=1 lucid
zinit light romkatv/powerlevel10k

# Load core OMZ snippets
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/misc.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh

# Load OMZ plugins
zinit wait lucid for \
    OMZ::plugins/sudo/sudo.plugin.zsh \
    OMZ::plugins/helm/helm.plugin.zsh \
    OMZ::plugins/fzf/fzf.plugin.zsh
    # OMZ::plugins/golang/golang.plugin.zsh
    # OMZ::plugins/osx/osx.plugin.zsh
    # OMZ::plugins/iterm2/iterm2.plugin.zsh

# Load plugins with completion
zinit wait lucid for \
    OMZ::plugins/git/git.plugin.zsh \
    OMZ::plugins/kubectl/kubectl.plugin.zsh \
    OMZ::plugins/gcloud/gcloud.plugin.zsh \
    light-mode @asdf-vm/asdf
zinit cdclear -q

zinit ice wait lucid blockf as"program" pick"wd.sh" mv"_wd.sh -> _wd" atload="wd() { source wd.sh }"
zinit light mfaerevaag/wd

# Load completions
zinit wait lucid as"completion" for \
    https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker \
    https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose

# Fast-syntax-highlighting & autosuggestions
zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions

zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

zinit ice wait'!' lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay; _zsh_finish_setup"
zinit light zdharma/fast-syntax-highlighting
