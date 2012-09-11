# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# OS X specific
alias pbc='pbcopy'
alias pbp='pbpaste'

# Basic directory operations
alias ...='cd ../..'

# grep & ack fu
alias g='grep -in'
alias a='ack -i'

# Show history
alias history='fc -l 1'

# List directory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'

# Gem aliases
alias gsr='gem search -r'
alias gsrp='gem search -r --pre'

# Bundler aliases
#alias bi="bundle install"
#alias bu="bundle update"
#alias bx="bundle exec"
#alias bp="bundle package"

# ZSH
alias ralias="source ~/.oh-my-zsh/lib/aliases.zsh"
alias ealias="$EDITOR ~/.oh-my-zsh/lib/aliases.zsh && ralias"
alias rzsh="source ~/.zshrc"

# MacVim
alias M='mvim'

# tmux
alias T='tmux'

# misc
alias x='extract'
alias shasum256='openssl dgst -sha256'
