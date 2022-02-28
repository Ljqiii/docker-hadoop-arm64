FROM ljqiii/hadoop-base:hadoop3.3.1-java8-arm64-1.0.0

MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

ENV HIVE_VERSION 3.1.2

ENV HIVE_URL https://dlcdn.apache.org/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz

RUN set -x \
    && curl -fSL "HIVE_URL" -o /tmp/hive.tar.gz \
    && tar -xvf /tmp/hive.tar.gz -C /opt/ \
    && rm /tmp/hive.tar.gz*

RUN ln -s /opt/hive-HIVE_VERSION/etc/conf /etc/hive


