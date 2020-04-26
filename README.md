[![Travis](https://img.shields.io/travis/com/ckaserer/docker-latex/master?style=flat-square&label=pipeline)](https://travis-ci.com/ckaserer/docker-latex?label=integration)
![Docker Bzuild](https://img.shields.io/docker/cloud/automated/ckaserer/latex?color=brightgreen&style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/ckaserer/latex?color=brightgreen&style=flat-square)
![gplv3](https://img.shields.io/badge/license-GPL%20v3.0-brightgreen.svg?style=flat-square)
![Maintenance](https://img.shields.io/maintenance/yes/2020?style=flat-square)
<br>
<br>

# docker-latex

This container helps compiling latex sources without the need to install all latex packages on your system.

## Why should I use this container?

- Easy setup, compile immediately after image download
- Preserves UID and GID of local user
- Use the container like a regular cli command: `docker-latex pdflatex main.tex`
- Customiziable to fit your particular need

---


<!--
## Versions

All versions are based on Debian: ([See all tags](https://hub.docker.com/r/ckaserer/latex/))

- [ckaserer/latex:full](https://raw.githubusercontent.com/ckaserer/docker-latex/master/Dockerfile)<br>CTAN TexLive Scheme-full
    - Up-to-date
    - all packages (3.9GB)

- [ckaserer/latex:basic - Dockerfile](https://raw.githubusercontent.com/ckaserer/docker-latex/master/Dockerfilel)<br> CTAN TexLive Scheme-basic
    - Up-to-date
    - only basic packages
    - base for custom builds (350MB)
If you need

- it to just work, go for `ckaserer/latex:full`
- a texlive base installation to build your custom image from, go for `ckaserer/latex:basic`
-->

## Getting started

```
git clone https://github.com/ckaserer/docker-latex.git
source docker-latex/bashrc

docker-latex pdflatex main.tex

# Or use latexmk (best option)
docker-latex pdflatex latexmk -cd -f -interaction=batchmode -pdf main.tex

# Or make multiple passes (does not start container twice)
docker-latex /bin/sh -c "pdflatex main.tex && pdflatex main.tex"
```

## Customize

If packages are missing, extend the image to your liking.

1) Create a Dockerfile

```
FROM ckaserer/latex:full

# Minted + Pygments
RUN tlmgr install minted
```

2) Build your custom image
```bash
docker build -t mycustomlateximg .
```

3) Edit `bashrc` to add a shortcut to build and use your new image `mycustomlateximg`.

A list of available ctan packages can be found here

- [http://mirror.ctan.org/systems/texlive/tlnet/archive](http://mirror.ctan.org/systems/texlive/tlnet/archive)