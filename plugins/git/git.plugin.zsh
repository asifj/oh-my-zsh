# Aliases
alias g='git'
compdef g=git
alias gst='git status'
compdef _git gst=git-status
alias gl='git pull'
compdef _git gl=git-pull
alias gf='git fetch'
compdef _git gf=git-fetch
alias gup='git fetch && git rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
alias gpt='git push --tags'
compdef _git gp=git-push
gpn() {
  local _remote="${1:-origin}"
  git push --set-upstream "$_remote" "$(current_branch)"
}
compdef _git gpn=git-push
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gc='git commit -v'
compdef _git gc=git-commit
alias gca='git commit -v -a'
compdef _git gca=git-commit
alias gcam='git commit --amend'
compdef _git gcam=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gn='git checkout -b'
compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gcount='git shortlog -sn --no-merges'
compdef gcount=git
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=5'
compdef _git glg=git-log
alias glgg='git log --graph --max-count=5'
compdef _git glgg=git-log
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias gap='git add -p'
compdef _git gap=git-add
alias gm='git merge'
compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grc='git rebase --continue'
compdef _git grc=git-rebase
alias gra='git rebase --abort'
compdef _git gra=git-rebase
alias gs='git submodule'
compdef _git gs=git-submodule
alias gsi='git submodule init'
compdef _git gsi=git-submodule
alias gsu='git submodule update'
compdef _git gsu=git-submodule
alias gss='git submodule sync'
compdef _git gss=git-submodule
alias ta='tig --all'
compdef _git ta=tig

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
compdef git-svn-dcommit-push=git

# No SVN business on my watch!
#alias gsr='git svn rebase'
#alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
compdef ggpull=git
alias ggpush='git push origin $(current_branch)'
compdef ggpush=git
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
compdef ggpnp=git
