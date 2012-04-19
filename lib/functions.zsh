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

function grsync {
  rsync --verbose --recursive --append --copy-links --human-readable --progress --bwlimit=$1 $2 .
}

function catalog {
  catalog_path=$1
  catalog_name=$catalog_path[(ws:/:)-1]
  tree -D -h $catalog_path > "$catalog_name.txt"
}
