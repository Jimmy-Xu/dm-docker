FROM centos:7
MAINTAINER Jimmy Xu <jimmy@hyper.sh>

ARG DOWNLOAD_URL
RUN yum install -y openssl openssl-devel e2fsprogs
ADD etc/config.xml /tmp/config.xml
RUN mkdir -p /opt/dm; \
    curl -O --progress-bar -o DMInstall.bin $DOWNLOAD_URL; \
    chmod +x ./DMInstall.bin; \
    ./DMInstall.bin -q /tmp/config.xml;\
    rm -rf DMInstall.bin

EXPOSE 5236
CMD ["/opt/dm/bin/dmserver", "/opt/dm/data/DAMENG/dm.ini", "-noconsole"]
