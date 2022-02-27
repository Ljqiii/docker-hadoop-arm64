#!/bin/bash

$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR historyserver >>/history_server_log.txt 2>&1
