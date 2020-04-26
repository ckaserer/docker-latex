FROM debian:10

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

ARG SCHEME_FULL=false
RUN mkdir /opt/texlive && \
    wget -q http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
        -P /opt/texlive && \
    tar -xvf /opt/texlive/install-tl-unx.tar.gz \
        -C /opt/texlive \
        --strip-components=1 && \ 
    if [ "${SCHEME_FULL}" = true ]; then \
      echo "selected_scheme scheme-full" \
        >> /opt/texlive/texlive.profile; \
    else \
      echo "selected_scheme scheme-basic" \
        >> /opt/texlive/texlive.profile; \
    fi && \
	/opt/texlive/install-tl \
        -profile /opt/texlive/texlive.profile && \
    rm -rf /opt/texlive && \
    if [ -d "/usr/local/texlive/$(date +'%Y')" ]; then \
        ln -s /usr/local/texlive/$(date +'%Y')/bin/x86_64-linux /usr/local/texlive/bin; \
    else \
        ln -s /usr/local/texlive/$(date --date="$(date +%Y-%m-15) -1 year" +'%Y')/bin/x86_64-linux /usr/local/texlive/bin; \
    fi

ENV PATH=${PATH}:/usr/local/texlive/bin/ \
    HOME=/data
WORKDIR /data

RUN tlmgr install \
        latexmk \
        minted

VOLUME ["/data"]