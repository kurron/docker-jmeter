FROM kurron/docker-jetbrains-base:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="Apache JMeter" org.kurron.ide.version=2.13

ADD http://mirrors.ibiblio.org/apache//jmeter/binaries/apache-jmeter-2.13.tgz /tmp/ide.tar.gz

RUN mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    rm /tmp/ide.tar.gz

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/opt/ide/bin/jmeter"]
