## fixme, i duplicated this in xterms - oops
function title {
  if [[ $TERM == "screen" ]]; then
    # Use these two for GNU Screen:
    print -nR $'\033k'$1$'\033'\\\

    print -nR $'\033]0;'$2$'\a'
  elif [[ $TERM == "xterm" || $TERM == "rxvt" ]]; then
    # Use this one instead for XTerms:
    print -nR $'\033]0;'$*$'\a'
  fi
}

function precmd {
  title zsh "$PWD"
}

function preexec {
  emulate -L zsh
  local -a cmd; cmd=(${(z)1})
  title $cmd[1]:t "$cmd[2,-1]"
}

function remote_console() {
  /usr/bin/env ssh $1 "( cd $2 && ruby script/console production )"
}

function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function uninstall_oh_my_zsh() {
  /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /bin/sh $ZSH/tools/upgrade.sh
}

function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}

function take() {
  mkdir -p $1
  cd $1
}

function tm() {
  cd $1
  mate $1
}

# To use: add a .lighthouse file into your directory with the URL to the
# individual project. For example:
# https://rails.lighthouseapp.com/projects/8994
# Example usage: http://screencast.com/t/ZDgwNDUwNT
open_lighthouse_ticket () {
  if [ ! -f .lighthouse-url ]; then
    echo "There is no .lighthouse file in the current directory..."
    return 0;
  else
    lighthouse_url=$(cat .lighthouse-url);
    echo "Opening ticket #$1";
    `open $lighthouse_url/tickets/$1`;
  fi
}

alias lho='open_lighthouse_ticket'

function grsync {
  rsync --verbose --recursive --append --copy-links --human-readable --progress --bwlimit=$1 $2 .
}

function runrar {
  # if [ $1 ]; then pattern=$1; else pattern=**/*.rar; fi
  for f (**/*.rar) { unrar e $f }
}

function catalog {
  catalog_path=$1
  catalog_name=$catalog_path[(ws:/:)-1]
  tree -D -h $catalog_path > "$catalog_name.txt"
}

function whitespace {
  find . -name '*.rb' -exec sed -i '' 's/ *$//g' {} \;
}

function mongo_reload {
  echo "Started..."
  mongo_version=$(brew info mongo | head -1 | cut -d' ' -f 2)
  mongo_lock=/usr/local/var/mongodb/mongod.lock

  # if [ ps aux | grep [m]ongo ]; then
  #   echo "Stopping mongo"
  #   launchctl unload -w $HOME/Library/LaunchAgents/org.mongodb.mongod.plist
  # fi
  # if [ -f $mongo_lock ]; then
  #   rm $mongo_lock
  # fi
  # mongod run --repair --config /usr/local/Cellar/mongodb/$mongo_version/mongod.conf
  # launchctl load -w $HOME/Library/LaunchAgents/org.mongodb.mongod.plist
}