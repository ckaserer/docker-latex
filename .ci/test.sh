#!/bin/bash

source bashrc

set -e
docker-latex-build-basic --no-cache 
docker-latex-build
docker-latex-basic tlmgr list --only-installed
docker-latex tlmgr list --only-installed
set +e