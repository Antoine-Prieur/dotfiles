# Basic zsh configuration
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

autoload -U compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
bindkey '^[[1;5C' forward-word
# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory

# Load plugins
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Git support (simple alternative to oh-my-zsh git plugin)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
setopt prompt_subst

# Example aliases
alias f='cd $(find * -type d | fzf)'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/home/antoine/.local/bin:$PATH"
export PATH="/home/antoine/.config/tofi/scripts:$PATH"
export PATH="/usr/local/spark_3.3.2/bin:$PATH"
source /home/antoine/.secrets
