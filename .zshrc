# Export
export EDITOR="nvim"
export VISUAL="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Enable colors
autoload -U colors && colors

# Prompt
function git_branch_name()
{
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]];
    then
        :
    else
        echo ' ('$branch')'
    fi
}
setopt prompt_subst
PS1='[%n %~$(git_branch_name)]$ '

# Aliases
alias ls='ls -l -A -g -G -h --color=auto'
alias grep='grep --color=auto'
alias pacman='sudo pacman --color auto'
alias shutdown='shutdown now'

alias pacman-list="sudo pacman -Qqe" # This will generate a list of explicitly installed packages
alias pacman-listt="sudo pacman -Qqet" #This will generate a list of explicitly installed packages without dependencies
alias pacman-listaur="sudo pacman -Qqem" # list of AUR packages
alias pamac-unlock="sudo rm /var/tmp/pamac/dbs/db.lock"

alias python="python3"
alias pip="pip3"

# Word separators
WORDCHARS='?_-~=&#$%^'

# History size and cache dir
HISTSIZE=10000
export HISTFILE="/home/PawelHermansdorfer/.cache/zsh/history"
SAVEHIST=10000
setopt appendhistory # append history to history file
setopt sharehistory # share history across terminals
setopt incappendhistory # append history not only when terminal is killed

# Tab completion
autoload -Uz compinit
zstyle '*completion:*' menu select
zstyle '*completion:*' file-list all
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files

# History complete
bindkey "^k" history-beginning-search-backward
bindkey "^j" history-beginning-search-forward

# Mappings
bindkey -M menuselect '^k' up-line-or-history
bindkey -M menuselect '^j' down-line-or-history
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word

function_depends()
{
    search=$(echo "$1")
    sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
}
alias depends='function_depends'

# Load syntax highlighting (should be last)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


# Created by `userpath` on 2023-05-19 16:47:15
export PATH="$PATH:/home/PawelHermansdorfer/.local/bin"
