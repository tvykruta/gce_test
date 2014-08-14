#!/bin/sh
HADOOP_PATH="$HADOOP_COMMON_HOME/share/hadoop"
INCLUDES="$HADOOP_PATH/common/hadoop-common-2.2.0.jar"
INCLUDES="$INCLUDES:$HADOOP_PATH/mapreduce/hadoop-mapreduce-client-core-2.2.0.jar"
INCLUDES="$INCLUDES:$HADOOP_PATH/mapreduce/lib/hadoop-annotations-2.2.0.jar"
INCLUDES="$INCLUDES:./jdom/build/jdom-1.1.3.jar"

javac -classpath $INCLUDES -d wordcount_classes WordCount.java
jar -cvf wordcount.jar -C wordcount_classes/ .
