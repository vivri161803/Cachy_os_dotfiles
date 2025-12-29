# ~/.bashrc

# --- 1. Early Exit (Performance & Safety) ---
# If this shell is NOT interactive (e.g. scp, scripts), stop here.
[[ $- != *i* ]] && return

# --- 2. Ble.sh (Must be loaded FIRST in interactive mode) ---
# Enables syntax highlighting and autosuggestions
[[ -f /usr/share/blesh/ble.sh ]] && source /usr/share/blesh/ble.sh

# --- 3. Shell History Settings ---
# Append to history immediately (don't wait for session exit)
shopt -s histappend
# Large history file, ignore duplicates and spaces
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups
# Sync history between tabs immediately
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# --- 4. Aliases & Colors ---
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# --- 5. Tool Integrations ---

# FZF (Fuzzy Finder)
# Checks if installed, then loads bindings + completion
if command -v fzf &>/dev/null; then
  eval "$(fzf --bash)"
fi

# Zoxide (Better 'cd')
# Checks if installed, then initializes
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
  alias cd='z' # Optional: replaces cd with z
fi

# --- 6. Starship Prompt (Must be LAST) ---
# Takes over the prompt (PS1)
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
else
  # Fallback prompt if starship is missing
  PS1='[\u@\h \W]\$ '
fi
