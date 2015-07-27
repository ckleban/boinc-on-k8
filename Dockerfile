## File to build docker image for Boinc
#
# Forked from  ozzyjohnson/boinc with original MAINTAINER Ozzy Johnson <docker@ozzy.io>
# I'd advise pulling from that repo for most up to date version for this. 
# I'm using and forking this over mainly as an example for kubernetes. 

FROM debian:wheezy

MAINTAINER Chris Klebna <ckleban@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Versions.
ENV BOINC_CLIENT 7.0.27+dfsg-5

# Update and install minimal.
RUN \
  apt-get update \
    --quiet \
  && apt-get install \
         --yes \
         --no-install-recommends \
         --no-install-suggests \
       boinc-client=${BOINC_CLIENT} \

# Clean up packages.
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Data volume.
ONBUILD VOLUME /data

# Getting ready.
WORKDIR /data

# Default command.
ENTRYPOINT ["/usr/bin/boinc"]
