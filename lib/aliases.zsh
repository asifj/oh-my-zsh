#!/bin/zsh

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# OS X specific
alias pbc='pbcopy'
alias pbp='pbpaste'

alias rs='unicorn_rails'
alias rsd='rails server'
alias rg='rails generate'
alias rd='rails destroy'
alias rp='rails plugin'
alias ras='rake spec'
alias rdd='rake db:drop'
alias rdc='rake db:create'
alias rdtc='rake db:test:clone'
alias rdbm='rake db:migrate'
alias rc='rails console'
alias devlog='tail -f log/development.log'
alias rmodapp='rails application ./ -OTJs -m'

# Basic directory operations
alias .='pwd'
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

# grep & ack fu
alias g='grep -in'
alias a='ack -i'

# Git related
alias gst='git status'
alias gco='git checkout'
alias gpu='git pull'
alias gup='git pull --rebase'
alias gf='git fetch'
alias gp='git push'
alias gd='git diff | mate'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gcount='git shortlog -sn --no-merges'
alias gcp='git cherry-pick'
alias gsi='git submodule init'
alias gsu='git submodule update'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -alr'
alias sl=ls # often screw this up

# Gem aliases
alias sgem='sudo gem'
alias gs='gem search'
alias gsr='gem search -r'
alias gsrp='gem search -r --pre'

# Bundler aliases
alias bi="bundle install"
alias bu="bundle update"
alias bx="bundle exec"
alias bp="bundle package"

# Find ruby file
alias rfind='find . -name *.rb | xargs grep -n'
alias afind='ack-grep -il'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'

# ZSH
alias ralias="source ~/.oh-my-zsh/lib/aliases.zsh"
alias ealias="$EDITOR ~/.oh-my-zsh/lib/aliases.zsh && ralias"
alias rzsh="source ~/.zshrc"

# MacVim
alias M='mvim'

# tmux
alias T='tmux'

# cucumber
alias C='CUCUMBER_FORMAT=pretty bx cucumber -r features'
