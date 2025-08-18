# Basic zsh configuration
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

autoload -U compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Navigation keybindings
bindkey '^[[1;5C' forward-word              # Ctrl+Right Arrow
bindkey '^[[1;5D' backward-word             # Ctrl+Left Arrow
bindkey '^[[H' beginning-of-line            # Home key
bindkey '^[[F' end-of-line                  # End key
bindkey '^[[3~' delete-char                 # Delete key

# History search keybindings
bindkey "^[[A" history-beginning-search-backward    # Up arrow
bindkey "^[[B" history-beginning-search-forward     # Down arrow
bindkey '^R' history-incremental-search-backward    # Ctrl+R for reverse search

# Edit command line
bindkey '^X^E' edit-command-line            # Ctrl+X, Ctrl+E to edit in $EDITOR

# Completion navigation
bindkey '^[[Z' reverse-menu-complete        # Shift+Tab for reverse completion

# Quick directory navigation
bindkey -s '^[h' 'cd ~\n'                  # Alt+h for home directory
bindkey -s '^[u' 'cd ..\n'                 # Alt+u for parent directory

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory                         # Share history between sessions
setopt hist_ignore_dups                     # Ignore duplicate commands
setopt hist_ignore_space                    # Ignore commands starting with space

# Load plugins
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Configure autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'    # Gray color for suggestions
bindkey '^[[C' forward-char                 # Right arrow to accept suggestion partially
bindkey '^[f' autosuggest-accept            # Alt+f to accept full suggestion

# Configure history substring search
bindkey '^[[A' history-substring-search-up      # Up arrow for substring search
bindkey '^[[B' history-substring-search-down    # Down arrow for substring search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

# Load direnv
eval "$(direnv hook zsh)"

# Git support (simple alternative to oh-my-zsh git plugin)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
setopt prompt_subst

# Additional useful options
setopt auto_cd                              # Type directory name to cd into it
setopt correct                              # Spelling correction for commands
setopt extended_glob                        # Extended globbing patterns

# ls replacement
if command -v eza &> /dev/null; then
    alias ls='eza --group-directories-first'
    alias ll='eza -la --group-directories-first --header --git'
    alias la='eza -a --group-directories-first'
    alias l='eza -1 --group-directories-first'
    alias lah='eza -lah --group-directories-first --header --git'
    alias tree='eza --tree'
    alias lt='eza --tree --level=2'
else
    alias ls='ls --color=auto'
    alias ll='ls -alF --color=auto'
    alias la='ls -A --color=auto'
    alias l='ls -CF --color=auto'  
    alias lah='ls -lah --color=auto'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# Fzf
alias f='cd $(find * -type d | fzf)'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/home/antoine/.local/bin:$PATH"
export PATH="/home/antoine/.config/tofi/scripts:$PATH"
export PATH="/usr/local/spark_3.3.2/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
