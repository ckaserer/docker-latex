[![Build Status](https://travis-ci.com/ckaserer/docker-latex.svg?branch=master)](https://travis-ci.com/ckaserer/docker-latex)
![Docker Pulls](https://img.shields.io/docker/pulls/ckaserer/latex)
![GitHub](https://img.shields.io/github/license/ckaserer/latex)
![Maintenance](https://img.shields.io/maintenance/yes/2020)
<br>
<br>

# docker-latex

This container helps compiling latex sources without the need to install all latex packages on your system.

## Why should I use this container?

- Easy setup, compile immediately after image download
- Preserves UID and GID of local user
- Use container like local command: `docker-latex pdflatex main.tex`
- Multiple versions to fit your need

---

## Versions

All versions are based on Debian: ([See all tags](https://hub.docker.com/r/ckaserer/latex/))

- [ckaserer/latex:basic - Dockerfile](https://raw.githubusercontent.com/ckaserer/docker-latex/master/Dockerfilel)<br> CTAN TexLive Scheme-basic
    - Up-to-date
    - only basic packages
    - base for custom builds (500MB)
- [ckaserer/latex:full](https://raw.githubusercontent.com/ckaserer/docker-latex/master/Dockerfile)<br>CTAN TexLive Scheme-full
    - Up-to-date
    - all packages (5.6GB)

If you need

- it to just work, go for `ckaserer/latex:full`
- a texlive base installation to build your custom image from, go for `ckaserer/latex:basic`

## Getting started

```
git clone https://github.com/ckaserer/docker-travis-cli.git
source docker-travis-cli/bashrc

docker-latex pdflatex main.tex

# Or use latexmk (best option)
docker-latex pdflatex latexmk -cd -f -interaction=batchmode -pdf main.tex

# Or make multiple passes (does not start container twice)
docker-latex /bin/sh -c "pdflatex main.tex && pdflatex main.tex"
```

## Customize

If packages are missing, extend the base image to your liking.

1) Create a Dockerfile

```
FROM ckaserer/latex:basic

# Minted + Pygments
RUN tlmgr install minted
```

2) Build your custom image
```bash
docker build -t mycustomlateximg .
```

3) Edit `bashrc` to use your image `mycustomlateximg`.

A list of available ctan packages can be found here

- [http://mirror.ctan.org/systems/texlive/tlnet/archive](http://mirror.ctan.org/systems/texlive/tlnet/archive)