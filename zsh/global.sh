alias zsh="sudo nvim ~/.zshrc"

alias code="code-insiders"

alias gc="git clone"

alias ls="ls -alhF --color"
alias cat="bat --plain"

alias tf="terraform"

alias k="kubecolor"
alias kubectl="kubecolor"
alias kge='kubectl get events --sort-by={.lastTimestamp}'
alias kgn='kubectl get nodes --sort-by={.metadata.creationTimestamp}'
alias kgp='kubectl get pods'
alias kcc='kubectl config current-context'

alias treesize='du -shx ./* | sort -h'
alias go-build-linux='env GOOS=linux GOARCH=amd64 go build'

eval "$(mcfly init zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/starship/starship.json)"

#fortune | cowsay