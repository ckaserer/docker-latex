FROM debian:10 as basic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -qy \
        build-essential \
        libfontconfig1 \
        wget \
        python \
        python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install \
        pygments 

RUN mkdir /opt/texlive && \
    wget -q http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
        -P /opt/texlive && \
    tar -xvf /opt/texlive/install-tl-unx.tar.gz \
        -C /opt/texlive \
        --strip-components=1 && \ 
    echo "selected_scheme scheme-basic" \
        >> /opt/texlive/texlive.profile && \
	/opt/texlive/install-tl \
        -profile /opt/texlive/texlive.profile && \
    rm -rf /opt/texlive && \
    ln -sf /usr/local/texlive/$(date +"%Y")/bin/x86_64-linux/* /usr/local/bin/

ENV HOME=/data
WORKDIR /data

RUN tlmgr install \
        latexmk \
        minted

VOLUME ["/data"]

FROM basic as full

RUN tlmgr install \
        scheme-full