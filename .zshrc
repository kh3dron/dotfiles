alias zsh="sudo nvim ~/.zshrc"
# alias code="code-insiders"
alias gc="git clone"
alias ls="ls -alhF --color"
alias cat="bat --plain"
alias treesize='du -shx ./* | sort -h'
alias tf="terraform"
alias go-build-linux='env GOOS=linux GOARCH=amd64 go build'
alias nv="nvim ."

alias k="kubecolor"
alias kubectl="kubecolor"
alias kge='kubectl get events --sort-by={.lastTimestamp}'
alias kgn='kubectl get nodes --sort-by={.metadata.creationTimestamp}'
alias kgp='kubectl get pods'
alias kcc='kubectl config current-context'

alias ls='ls --color=auto'

alias gc='git clone'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gcm='git commit -m'
alias gco='git checkout'
alias gpl='git pull'
alias gps='git push'

alias lg='lazygit'
alias y='yazi'
alias t='tmux'
alias p='python3'
alias pp='pip3'

for i in {1..9}; do
  bindkey -s "^$i" "tmux select-window -t $i\n"
done

alias tmmw='tmux move-window -t '
alias tsource="tmux source-file ~/.tmux.conf"

# Auto-attach to tmux session 0
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t 0 || tmux new-session -s 0
fi


eval "$(oh-my-posh init zsh --config ~/.config/starship.omp.json)"
eval "$(mcfly init zsh)"
cd /Users/$USER/Documents/Github
