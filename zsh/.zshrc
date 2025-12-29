# ~/.zshrc

# --- 1. History Settings (Optimized) ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY          # Append history instead of rewriting
setopt SHARE_HISTORY           # Share history between tabs instantly
setopt HIST_IGNORE_DUPS        # Don't record dupes
setopt HIST_IGNORE_SPACE       # Don't record commands starting with space

# --- 2. Completion System (The "Menu" feeling) ---
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select  # Use a selection menu for tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case insensitive tab completion

# --- 3. Aliases ---
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Zoxide (Smart CD) replacement
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi

# --- 4. Load Plugins (Must be near the end) ---
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- 5. Performance Tweaks for Autosuggestions ---
# Fetch suggestions asynchronously to prevent lag while typing
ZSH_AUTOSUGGEST_USE_ASYNC=1

# --- 6. Starship Prompt (Must be LAST) ---
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi
