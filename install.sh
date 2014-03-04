#!/bin/bash

FORCE=false

for arg in "$@"; do
  if [ "$arg" = "-f" ]; then FORCE=true; fi
done

[ $FORCE = true ] && echo "INFO: Forcing overwrite of existing files"

function exec_if_file_doesnt_exist() {
  if [ -a "$HOME/$1" -a $FORCE != true ]; then
    echo "WARN: $HOME/$1 already exists (use -f to overwrite)"
  else
    $2
  fi
}

function install_file() {
  exec_if_file_doesnt_exist $1 "cp -v ./$1 $HOME/$1"
}

function install_dir() {
  exec_if_file_doesnt_exist $1 "cp -Rv ./$1 $HOME"
}

function clone_vim_plugins() {
  git submodule init
  git submodule update --recursive
}

clone_vim_plugins

install_file ".gitconfig"
install_file ".vimrc"
install_dir  ".vim"

