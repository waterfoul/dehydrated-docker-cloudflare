FROM waterfoul/dehydrated:0.3.1

RUN cd /dehydrated && \
    apk --no-cache add git python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    mkdir hooks && \
    git clone https://github.com/kappataumu/letsencrypt-cloudflare-hook hooks/cloudflare && \
    pip3 install -r hooks/cloudflare/requirements.txt && \
    ln /usr/bin/python3 /usr/bin/python && \
    rm -r /root/.cache

CMD ["-h"]
