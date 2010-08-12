#!/bin/zsh

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

alias ss='thin --stats "/thin/stats" start'
alias sg='ruby script/generate'
alias sd='ruby script/destroy'
alias sp='ruby script/plugin'
alias ssp='ruby script/spec'
alias rdbm='rake db:migrate'
alias sc='ruby script/console'
alias sd='ruby script/server --debugger'
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
alias gdb='git branch -d'
alias gcount='git shortlog -sn --no-merges'
alias gcp='git cherry-pick'

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

# Find ruby file
alias rfind='find . -name *.rb | xargs grep -n'
alias afind='ack-grep -il'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'

# TextMate
alias et='mate . &'
alias ett='mate app config lib db public spec test Rakefile Capfile Todo &'
alias etp='mate app config lib db public spec test vendor/plugins vendor/gems Rakefile Capfile Todo &'
alias etts='mate app config lib db public script spec test vendor/plugins vendor/gems Rakefile Capfile Todo &'


# Editor Ruby file in TextMate
alias mr='mate CHANGELOG app config db lib public script spec test'

alias ralias="source ~/.oh-my-zsh/lib/aliases.zsh"
alias ealias="$EDITOR ~/.oh-my-zsh/lib/aliases.zsh && ralias"

alias rzsh="source ~/.zshrc"

# Bundler aliases
alias bi="bundle install"
alias bu="bundle update"
alias bx="bundle exec"
alias bp="bundle package"