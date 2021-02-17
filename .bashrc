export BASH_SILENCE_DEPRECATION_WARNING=1
source ~/.bash/git-prompt.sh
source ~/.bash/git.sh

export EDITOR=vim

alias ls="ls -G"

export PATH="$PATH:~/.bin"

. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

alias gdno="git diff master --name-only"
