#!/bin/bash

readonly DOCKER_LATEX_HOME=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# docker-latex
function docker-latex () {
  local command="docker run --rm -it -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/latex:full"
  echo "+ ${command} $@" && ${command} $@
}
readonly -f docker-latex
[ "$?" -eq "0" ] || return $?

# docker-latex-basic
function docker-latex-basic () {
  local command="docker run --rm -it -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/latex:basic"
  echo "+ ${command} $@" && ${command} $@
}
readonly -f docker-latex-basic
[ "$?" -eq "0" ] || return $?

# docker-latex-build
function docker-latex-build () {
  local command="docker build -t ckaserer/latex:full $@ ${DOCKER_LATEX_HOME}"
  echo "+ ${command}" && ${command}
}
readonly -f docker-latex-build
[ "$?" -eq "0" ] || return $?

# docker-latex-build-basic
function docker-latex-build-basic () {
  local command="docker build -t ckaserer/latex:basic --build-arg SCHEME=scheme-basic $@ ${DOCKER_LATEX_HOME}"
  echo "+ ${command}" && ${command}
}
readonly -f docker-latex-build-basic
[ "$?" -eq "0" ] || return $?
