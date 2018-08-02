FROM buildpack-deps:sid-scm
MAINTAINER Idan Roz <rozidan@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN apt-get -qq update && \
    apt-get -qq install --no-install-recommends \
    openjdk-8-jdk \
    openjdk-10-jdk > /dev/null && \
    apt-get -qq clean && \
    apt-get -qq autoclean && \
    apt-get -qq autoremove
RUN wget -q -O /intellij-2018.2.tar.gz https://download-cf.jetbrains.com/idea/ideaIC-2018.2.tar.gz && \
    mkdir -p /usr/share/intellij && \
    tar -xf /intellij-2018.2.tar.gz --strip-components=1 -C /usr/share/intellij && \
    rm /intellij-2018.2.tar.gz
ENV DEBIAN_FRONTEND teletype
CMD /usr/share/intellij/bin/idea.sh
