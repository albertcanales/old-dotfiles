# System alias
alias sudo="sudo "
alias ..="cd .."
alias ...="cd ../.."
alias mkdir="mkdir -p"
alias rm="rm -r"
alias ls="ls --human-readable --color=auto"
alias la="ls -la"
alias untar="tar -zxvf"
alias sdn="sudo shutdown -h now"
alias cl="clear"
alias ccat="cat"
alias cat="bat"
alias icat="kitty +kitten icat"
alias lls="ls"
alias ls="lsd"
alias cleanup-packages='(set -x; sudo pacman -R $(pacman -Qdtq))'
alias ifconfig="nmcli"
alias bt-reset="systemctl restart bluetooth.service"
alias homeup="sudo wg-quick up home"
alias homedown="sudo wg-quick down home"

# Programs
alias gs="git status"
alias addall="git add --all"
alias vim="nvim"
alias eog="gwenview"
alias g++c="g++ --std=c++17 -Wall -O2 -fsanitize=address"
alias autostow="cd ~/dotfiles && ~/dotfiles/autostow"
alias serve="browser-sync start --server --files ."
alias dades="source dades"
alias scp="scp -F $HOME/.ssh/config "
alias f5upc="f5fpc -s -x -t https://upclink.upc.edu"

# Folders
next="$HOME/nextcloud"
uni="$next/Acadèmic/Universitat/Q4"
ec="$uni/ec"
ci="$uni/ci"
so="$uni/so"
bd="$uni/bd"
top="$uni/top"
fvc="$uni/fvc"

# Files
alias uni="cd $uni"
alias next="cd $next"
alias dot="cd ~/dotfiles"
alias aliasedit="vim ~/.bash_aliases; source ~/.bashrc"
alias stowedit="vim ~/dotfiles/autostow && autostow"
alias postinstalledit="vim ~/dotfiles/postinstall.sh"
alias cronedit="vim ~/dotfiles/cron/crontab && crontab ~/dotfiles/cron/crontab"



