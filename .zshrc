# -------------------------------
# Zsh configuration
# -------------------------------

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Completion system
autoload -Uz compinit
compinit
zstyle :compinstall filename '/home/luka/.zshrc'

# Don't continue if not interactive
[[ $- != *i* ]] && return

# -------------------------------
# Environment variables
# -------------------------------

export EDITOR="nvim"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.dotnet/tools:$PATH"
export SPOTIFY_ID="c0e20cab14f7491ab721169bc3532977"
export SPOTIFY_SECRET="7ea4952c2afa4016bc4d39796ff3b746"
# export OPENAI_API_KEY=$(pass openai)  # Uncomment if needed

# -------------------------------
# Aliases
# -------------------------------

alias ls='exa'
alias l='exa -lbF --git'
alias ll='exa -lbGF --git'
alias llm='exa -lbGd --git --sort=modified'
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
alias lS='exa -1'
alias lt='exa --tree --level=2'

alias grep='grep --color=auto'
alias neofetch='fastfetch'
alias sudo='doas'
alias cd='z'
alias cat='bat'
alias spt='spotify_player'
alias hawktuah='git push'

# fzf aliases
alias ff='fzf --preview="bat --color=always {}"'
alias ffn='nvim $(fzf --preview="bat --color=always {}")'

# dotnet ASP.NET generator
alias dac='dotnet aspnet-codegenerator'

# ChatGPT + glow
cg() {
  chatgpt "$@" | glow
}
cgp -p() {
  chatgpt "$@" | glow -p
}

# yazi cd wrapper
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

function ffds() {
  fzf --preview="bat --style=numbers --color=always --highlight-line {2} {1}" \
      --bind "enter:execute(nvim {1} +{2})" \
      --delimiter : \
      --ansi
}

# -------------------------------
# Antigen + Plugins
# -------------------------------

source ~/.zsh/antigen.zsh

# vi-mode config before plugin is loaded
function zvm_config() {
  ZVM_VI_INSERT_SYMBOL="❯"
  ZVM_VI_NORMAL_SYMBOL="❮"
  ZVM_CURSOR_STYLE_ENABLED=true
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_VI_INSERT_ESCAPE_BINDTIMEOUT=0.2
}

# Plugins
antigen bundle jeffreytse/zsh-vi-mode
antigen apply

# Enable vi mode and custom keybindings
bindkey -v
bindkey -M viins '^g' autosuggest-accept

# -------------------------------
# Tool Initialization
# -------------------------------

# Disable Starship vi-mode module to prevent recursion
# export STARSHIP_VI_MODE_INSERT=""
# export STARSHIP_VI_MODE_NORMAL=""
# export STARSHIP_VI_MODE_SYMBOL=""

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source /usr/share/nvm/init-nvm.sh
source <(ng completion script)
source <(fzf --zsh)

# Syntax Highlighting & Suggestions
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# -------------------------------
# Prompt
# -------------------------------

# PROMPT='[%n@%m %1~]$ '
