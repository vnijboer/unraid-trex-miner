FROM nvidia/cuda:11.1.1-base

ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"

ENV WALLET=3Be4LxKiS2piyiQxdQ8TZ2DDjV9SkBebbL
ENV SERVER=stratum+tcp://daggerhashimoto.eu-west.nicehash.com:3353
ENV WORKER=Rig
ENV ALGO=ethash
ENV PASS=x
ENV FAN=70
ENV POWERLIMIT=37
ENV CCLOCK=-502
ENV MCLOCK=1000

ENV TREX_URL="https://github.com/trexminer/T-Rex/releases/download/0.21.4/t-rex-0.21.4-linux.tar.gz"

ADD config/config.json /home/nobody/

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /trex \
    && wget --no-check-certificate $TREX_URL \
    && tar -xvf ./*.tar.gz  -C /trex \
    && rm *.tar.gz

WORKDIR /trex

ADD init.sh /trex/

VOLUME ["/config"]

CMD ["/bin/bash", "init.sh"]
