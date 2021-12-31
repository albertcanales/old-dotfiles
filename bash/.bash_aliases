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
alias cleanup-packages='(set -x; sudo pacman -R $(pacman -Qdtq))'
alias ifconfig="nmcli"

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

# Folders
alias uni="cd ~/Dropbox/Universitat/Q3"
alias dp="cd ~/Dropbox"
alias dot="cd ~/dotfiles"
alias algo="cd ~/Dropbox/Work/Codelearn/AventuraAlgorismia"
alias aliasedit="vim ~/.bash_aliases; source ~/.bashrc"
alias stowedit="vim ~/dotfiles/autostow && autostow"
alias postinstalledit="vim ~/dotfiles/postinstall.sh"
