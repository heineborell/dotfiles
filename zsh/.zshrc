
# starship shell prompt

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/deniz/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/deniz/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/deniz/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/deniz/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2024-09-20 10:52:06
export PATH="$PATH:/Users/deniz/.local/bin"




# Aliases for the git graph

alias graph='git log --all --decorate --oneline --graph'



source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# setup fzf keybinding and fuzzy complete
source <(fzf --zsh)

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#BF616A"
blue="#81A1C1"
cyan="#8FBCBB"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# ---- Eza (better ls) -----

alias ls="eza --color=always --long --git --icons=always --no-time --no-user --no-permissions"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
# Alias dust (ignore git files)
alias dust="dust -X .git"

# alias for cpp
# alias cppc="clang++ -std=c++20 -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion"

cpp() {
    if [ $# -lt 1 ]; then
        echo "Usage: cpp file1.cpp [file2.cpp ...]"
        return 1
    fi
    
    # Get the name for the output executable from the first file
    first_src="$1"
    out="${first_src%.*}"
    
    # Compile all input files
    clang++ -std=c++23 -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion "$@" -o "$out"
}

alias lg='lazygit'
alias ld='lazydocker'
alias oo='cd $HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/stuffvault/'


# alias nvim
alias nv="nvim"

alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias code="open -a 'Visual Studio Code'"

function nvims() {
  items=("default" "kickstart" "bare", "nvim_alt", "kickstart_bare")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

# vim keybindings for zsh
#source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# syntax highlightning
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#This is for yazi. To use it, copy the function into the configuration file of your respective
#shell. Then use y instead of yazi to start, and press q to quit, you'll see
#the CWD changed. Sometimes, you don't want to change, press Q to quit. 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# zoxide completion
eval "$(zoxide init zsh)"
export PATH="$HOME/bin:$PATH"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(atuin init zsh)"
