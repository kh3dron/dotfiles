PATH=$PATH:/Users/tsald3/Documents/Github/nike/dev-utils/bin

alias notes="code-insiders /Users/tsald3/Documents/Github/nike/notes"

alias getplatforms="kubectl get platforms -o custom-columns=\"NAMESPACE:.metadata.labels.crossplane\.io/claim-namespace,ACCOUNT:.spec.forProvider.clusters[0].accountID,NAME:.metadata.name,ZONE:.spec.forProvider.runtime.vars.internal-hosted-zone,NRF:.spec.forProvider.runtime.git.targetRevision,READY:.status.conditions[?(@.type=='Ready')].status,PAUSED:.metadata.annotations.crossplane\.io/paused\""

alias cbt='xbt() { crossplane beta trace nrfruntime -n $1 $2 };xbt'
alias cbtw='xbtw() { crossplane beta trace nrfruntime -n $1 $2 --output=wide };xbtw'

alias argopf='kubectl port-forward svc/nrf-argocd-server -n argocd-system 8080:443'

alias asc='aws sts get-caller-identity'
alias aelc='zelc() { aws eks list-clusters --region $1 };zelc'

alias npectll='LOCAL_API=true npe-npectl'
alias npectld='DEV_API=true npe-npectl'
alias npectlt='TEST_API=true npe-npectl'
alias npectlq='QA_API=true npe-npectl'
alias npectlp='npe-npectl'

alias kgr='kubectl get nrfruntime -A -o custom-columns="NAMESPACE:.metadata.labels.crossplane\.io/claim-namespace,NAME:.metadata.name,REGION:.spec.region,NRF:.spec.platformTemplate.runtime.git.targetRevision,EKS:.spec.eks.kubernetesVersion,READY:.status.conditions[?(@.type=='\''Ready'\'')].status,PAUSED:.metadata.annotations.crossplane\.io/paused,RLT_PAUSED:.metadata.annotations.rollout/paused"'

alias rlt='kubectl get rollouts.release.nrf.crossplane.nike.com -o "custom-columns=NAME:.metadata.name,TARGET_REV:.spec.forProvider.tenants[0].targetRevision,TARGET_REV_NRF:.spec.forProvider.nrf.targetRevision,READY:.status.conditions[?(@.type=='\''Ready'\'')].status,SYNCED:.status.conditions[?(@.type=='\''Synced'\'')].status"'
alias kga='kubectl get application -n argocd-system -o custom-columns="NAME:.metadata.name,SYNC:.status.sync.status,HEALTH:.status.health.status,WAVE:.metadata.annotations.argocd\.argoproj\.io/sync-wave"'
alias kgar='kubectl get application -n argocd-system -o custom-columns="NAME:.metadata.name,SYNC:.status.sync.status,HEALTH:.status.health.status,WAVE:.metadata.annotations.argocd\.argoproj\.io/sync-wave,REV:.status.sync.revision,REVISION:.status.operationState.operation.sync.revision"'
alias kgap='kubectl get application -n argocd-system -o custom-columns="NAME:.metadata.name,SYNC:.status.sync.status,HEALTH:.status.health.status,PATH:.spec.source.path"'
alias kgas='kubectl get application -n argocd-system -o custom-columns="NAME:.metadata.name,SYNC:.status.sync.status,HEALTH:.status.health.status,WAVE:.metadata.annotations.argocd\.argoproj\.io/sync-wave" --sort-by='\''{.metadata.annotations.argocd\.argoproj\.io/sync-wave}'\'''

alias setns='kubectl config set-context --current --namespace $1' # usage: setns team-sp-refinement-bot
alias rfin='kubectl patch --type=merge -p "{\"metadata\":{\"finalizers\":null}}"' # usage: rfin $KIND $NAME -n $NAMESPACEalias zsh="sudo nvim ~/.zshrc"

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

# eval "$(mcfly init zsh)"
# eval "$(oh-my-posh init zsh --config ~/.config/starship/starship.json)"

#fortune | cowsay