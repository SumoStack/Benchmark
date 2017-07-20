#
# Quick and dirty contained environment for running a SumoStack Benchmark
#
# Reference:
# * https://github.com/SumoStack/Benchmark
#
FROM ubuntu:14.04

MAINTAINER SumoStack <hello@sumostack.com>

ENV DEBIAN_FRONTEND noninteractive

ADD sb.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/sb.sh && \
    apt-get update && \
    apt-get install -y build-essential curl wget traceroute libaio-dev && \
    apt-get clean && apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/test"]
WORKDIR /test

ENTRYPOINT ["sb.sh"]
