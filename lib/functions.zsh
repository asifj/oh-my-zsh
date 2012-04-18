function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function uninstall_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

function extract() {
    unset REMOVE_ARCHIVE
    if test "$1" = "-r"; then
        REMOVE=1
        shift
    fi
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
      *.tar.xz) tar xvJf $1;;
      *.tar.lzma) tar --lzma -xvf $1;;
      *.bz2) bunzip $1;;
      *.rar) unrar $1;;
      *.gz) gunzip $1;;
      *.tar) tar xvf $1;;
      *.tbz2) tar xvjf $1;;
      *.tgz) tar xvzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7z x $1;;
      *) echo "'$1' cannot be extracted via >extract<";;
    esac

    if [[ $REMOVE_ARCHIVE -eq 1 ]]; then
        echo removing "$1";
        /bin/rm "$1";
    fi

  else
    echo "'$1' is not a valid file"
  fi
}

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
