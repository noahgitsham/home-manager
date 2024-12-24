# zmodload zsh/zprof
# History
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt histignorealldups
HISTSIZE=50000
SAVEHIST=50000

# Set the default WORDCHARS
WORDCHARS='*?_[]~=&;|!#$%^(){}<>'

bindkey -v '^?' backward-delete-char
bindkey '^R' history-incremental-search-backward
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^W" backward-kill-word
bindkey '^_' backward-kill-word
KEYTIMEOUT=1

# Completion
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
# XDG
mkdir -p "$XDG_CACHE_HOME"/zsh
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
#Cache
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"

# Completion style
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}did you mean:%f'


# Custom prompt
setopt PROMPT_SUBST

# Git prompt
autoload -Uz vcs_info
precmd_functions+=( vcs_info )

make_prompt() {
	PROMPT="%F{yellow}%n%f "
	if [[ -n ${vcs_info_msg_0_} ]] then
		case ${vcs_info_msg_0_} in
			"main"|"master") local color=magenta ;;
			*) local color=blue ;;
		esac
		PROMPT+="%F{$color}${vcs_info_msg_0_}%f "
	fi
	if [[ -n "$IN_NIX_SHELL" ]]; then
		PROMPT+="%F{blue}N%f "
	fi
	PROMPT+="%F{gray}$%f "
}

precmd_functions+=make_prompt

# RPROMPT='%F{${vcs_colour}}${vcs_info_msg_0_}%f'

# Format to branch name only
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" formats "%b" # %u %c


#eval "$(starship init zsh)"

# Autofill
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)

# Rehash after package install


zsh_OS=$(grep -Po "(?<=^ID=).*(?=$)" /etc/os-release)
if [ "$zsh_OS" = "arch" ]; then
	zshcache_time="$(date +%s%N)"
	autoload -Uz add-zsh-hook

	rehash_precmd() {
		if [[ -a /var/cache/zsh/pacman ]]; then
			local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
			if (( zshcache_time < paccache_time )); then
				rehash
				zshcache_time="$paccache_time"
			fi
		fi
	}
	add-zsh-hook -Uz precmd rehash_precmd

elif [ $zsh_OS = "nixos" ]; then
	nixos_build="$(readlink /run/current-system)"
	hm_build="$(readlink ~/.local/state/nix/profiles/profile)"
	autoload -Uz add-zsh-hook
	rehash_precmd() {
		local new_nixos_build="$(readlink /run/current-system)"
		local new_hm_build="$(readlink ~/.local/state/nix/profiles/profile)"
		if [ "$nixos_build" != "$new_nixos_build" ] || [ "$hm_build" != "$new_hm_build" ]; then
			rehash
			zsh_system_build="$new_nixos_build"
			hm_system_build="$new_hm_build"
		fi
	}
	add-zsh-hook -Uz precmd rehash_precmd
fi

# OSC 133
precmd() {
    print -Pn "\e]133;A\e\\"
}


# Aliases
alias ls="ls --color"
alias less="less --color=always | less -R"
alias tree="tree -C"
alias tmuxa="tmux a || tmux"

#alias emacs="emacs -nw"

INITIAL_QUERY="${*:-}"
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
alias fzrg=": | fzf --ansi --disabled --query \"$INITIAL_QUERY\" \
    --bind \"start:reload:$RG_PREFIX {q}\" \
    --bind \"change:reload:sleep 0.1; $RG_PREFIX {q} || true\" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --bind 'enter:become(nvim {1} +{2})'"

RG_HIDDEN_PREFIX="${RG_PREFIX}--hidden "
alias fzrgh=": | fzf --ansi --disabled --query \"$INITIAL_QUERY\" \
    --bind \"start:reload:$RG_HIDDEN_PREFIX {q}\" \
    --bind \"change:reload:sleep 0.1; $RG_HIDDEN_PREFIX {q} || true\" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --bind 'enter:become(nvim {1} +{2})'"

lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

# zprof
