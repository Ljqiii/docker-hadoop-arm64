#!/bin/bash

hdfs dfs -mkdir -p /input/
hdfs dfs -copyFromLocal -f /opt/hadoop-${HADOOP_VERSION}/README.txt /input/
$HADOOP_HOME/bin/hadoop jar $JAR_FILEPATH $CLASS_TO_RUN $PARAMS

hdfs dfs -cat /output/*
hdfs dfs -rm -r /output
hdfs dfs -rm -r /input