FROM anapsix/alpine-java:8_server-jre
MAINTAINER Jimmy Chuang <ogre0403@gmail.com>

ENV MIRROR=http://apache.mirrors.pair.com
ENV VERSION=3.4.8

LABEL name="zookeeper" version=$VERSION

RUN apk add --no-cache wget bash \
    && wget -q -O - $MIRROR/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-$VERSION /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /tmp/zookeeper

WORKDIR /opt/zookeeper

#VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
