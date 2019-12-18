#!/bin/bash

# add-slack-token
function docker-latex () {
  local command="docker run --rm -it -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/latex"
  echo "+ ${command} $@" && ${command} $@
}
readonly -f docker-latex
[ "$?" -eq "0" ] || return $?
