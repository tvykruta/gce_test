#!/bin/sh

HADOOP_PATH="/usr/local/Cellar/hadoop/2.4.1/libexec/share/hadoop/"
HADOOP_PATH="/home/hadoop/hadoop-install/share/hadoop"

INCLUDES=$HADOOP_PATH/common/hadoop-common-2.2.0.jar:$HADOOP_PATH/mapreduce/hadoop-mapreduce-client-core-2.2.0.jar:$HADOOP_PATH/mapreduce/lib/hadoop-annotations-2.2.0.jar 
javac -classpath $INCLUDES -d wordcount_classes WordCount.java
jar -cvf wordcount.jar -C wordcount_classes/ .
