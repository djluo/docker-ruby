# vim:set et ts=2 sw=2 syntax=dockerfile:

FROM       docker.xlands-inc.com/baoyu/debian
MAINTAINER djluo <dj.luo@baoyugame.com>

COPY ./gemrc /etc/gemrc

RUN export http_proxy="http://172.17.42.1:8080/" \
    && export DEBIAN_FRONTEND=noninteractive     \
    && echo 'deb http://mirrors.163.com/debian-security/ wheezy/updates main non-free contrib' \
            >>/etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y ruby ruby1.9.1 \
    && apt-get clean \
    && unset http_proxy DEBIAN_FRONTEND \
    && rm -rf /usr/share/locale \
    && rm -rf /usr/share/man    \
    && rm -rf /usr/share/doc    \
    && rm -rf /usr/share/info   \
    && find /var/lib/apt -type f -exec rm -fv {} \;