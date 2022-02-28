FROM ljqiii/hadoop-base:hadoop3.3.1-java8-arm64-1.0.0


MAINTAINER Yiannis Mouchakis <gmouchakis@iit.demokritos.gr>
MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

# Allow buildtime config of HIVE_VERSION
ARG HIVE_VERSION
# Set HIVE_VERSION from arg if provided at build, env if provided at run, or default
# https://docs.docker.com/engine/reference/builder/#using-arg-variables
# https://docs.docker.com/engine/reference/builder/#environment-replacement
ENV HIVE_VERSION=${HIVE_VERSION:-3.1.2}

ENV HIVE_HOME /opt/hive
ENV PATH $HIVE_HOME/bin:$PATH
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION

WORKDIR /opt

#Install Hive and PostgreSQL JDBC
RUN apt-get update && apt-get install -y procps

RUN  set -x && \
    curl -fSL https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz -o apache-hive-$HIVE_VERSION-bin.tar.gz

RUN	tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz
RUN	mv apache-hive-$HIVE_VERSION-bin hive
#	curl https://jdbc.postgresql.org/download/postgresql-42.3.3.jar -o $HIVE_HOME/lib/postgresql-jdbc.jar


#Spark should be compiled with Hive to be able to use it
#hive-site.xml should be copied to $SPARK_HOME/conf folder

#Custom configuration goes here
ADD conf/hive-site.xml $HIVE_HOME/conf
ADD conf/beeline-log4j2.properties $HIVE_HOME/conf
ADD conf/hive-env.sh $HIVE_HOME/conf
ADD conf/hive-exec-log4j2.properties $HIVE_HOME/conf
ADD conf/hive-log4j2.properties $HIVE_HOME/conf
ADD conf/ivysettings.xml $HIVE_HOME/conf
ADD conf/llap-daemon-log4j2.properties $HIVE_HOME/conf

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 10000
EXPOSE 10002

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#ENTRYPOINT ["/entrypoint.sh"]
CMD startup.sh
