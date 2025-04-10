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

alias ls='eza -la --icons=always'

eval "$(oh-my-posh init zsh --config ~/.config/starship.omp.json)"
eval "$(mcfly init zsh)"
