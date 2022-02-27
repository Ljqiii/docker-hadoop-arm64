#!/bin/bash
echo 'Waiting for hdfs safemode off, time:'+`date`
hdfs dfsadmin -safemode wait
echo 'hdfs safemode off, time:'+`date`

$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR resourcemanager >>/resourcemanager_log.txt 2>&1
