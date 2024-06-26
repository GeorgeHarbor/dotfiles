# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/luka/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cd='z'

# Exa aliases
# general use
alias ls='exa'                                                          # ls
alias l='exa -lbF --git'                                                # list, size, type, git
alias ll='exa -lbGF --git'                                              # long list
alias llm='exa -lbGd --git --sort=modified'                             # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'   # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'  # all + extended list

# specialty views
alias lS='exa -1'                                                       # one column, just names
alias lt='exa --tree --level=2'                                         # tree

# Neofetch alias
alias neofetch='fastfetch'

# Doas alias
alias sudo='doas'
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Spotify alias
alias spt='spotify_player'

# Prompt
PROMPT='[%n@%m %1~]$ '

# fzf Aliases
alias ff='fzf --preview="bat --color=always {}"'
alias ffn='nvim $(fzf --preview="bat --color=always {}")'

# love alias
alias hawktuah='git push'


# Initialize starship and zoxide
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Environment variables
export LIBVIRT_DEFAULT_URI=qemu:///system
export EDITOR="nvim"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
# export OPENAI_API_KEY=$(pass openai)

# pnpm
export PNPM_HOME="/home/luka/.local/share/pnpm"
if [[ ":$PATH:" != *":$PNPM_HOME:"* ]]; then
    export PATH="$PNPM_HOME:$PATH"
fi
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh pnpm end
source ~/.zsh/antigen.zsh

# bun completions
[ -s "/home/luka/.bun/_bun" ] && source "/home/luka/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
