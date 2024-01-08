# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS

zstyle :compinstall filename '$HOME/.zshrc'

# Enable Colors
autoload -U colors && colors

# Key bindings
bindkey "5C" forward-word
bindkey "5D" backward-word

# Basic auto/tab complete:
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# Auto cd
setopt autocd

# add winget to PATH
export PATH="/mnt/c/Users/resul/AppData/Local/Microsoft/WinGet/Packages/equalsraf.win32yank_Microsoft.Winget.Source_8wekyb3d8bbwe/:$PATH"

# NVM, nodejs manager for wsl 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# TMUX tmp directory under wsl
export TMUX_TMPDIR='/tmp'

# custom aliases
alias so='source $HOME/.zshrc'
alias la="lsd -lhAtU --color=always"
alias ls="lsd -U --color=always"
alias ll="lsd -lhtU --color=always"
alias untar='tar xvf'
alias rf='rm -rvf'
alias mv='mv -i'
alias suv='sudo nvim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias cp='cp -r'
alias cat='bat'
alias t='tmux'

unzipf() {
    if [ -z "$2" ]; then
        folder=$(echo "$1" | head -c -5)
    else
        folder=$(echo "$2")
    fi
    command unzip $1 -d $folder
}


# bun completions
[ -s "/home/rasul/.bun/_bun" ] && source "/home/rasul/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source "$HOME/Git/minimal/minimal.zsh"
