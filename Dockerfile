FROM openjdk:8u171-jdk-alpine
LABEL maintainer="Idan Roz <rozidan@gmail.com>"
RUN apk -q --update add fontconfig ttf-dejavu
RUN wget -q -O /intellij-2018.2.tar.gz https://download-cf.jetbrains.com/idea/ideaIC-2018.2.tar.gz && \
    mkdir -p /usr/share/intellij && \
    tar -xf /intellij-2018.2.tar.gz --strip-components=1 -C /usr/share/intellij && \
    rm /intellij-2018.2.tar.gz
CMD /usr/share/intellij/bin/idea.sh
