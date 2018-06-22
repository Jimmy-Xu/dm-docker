#!/bin/bash
HOSTIP=$(hostname -I | awk '{print $1}')
docker build --build-arg "DOWNLOAD_URL=http://${HOSTIP}:8000/DMInstall.bin" -t hyperhq/dmserver:x86 .
