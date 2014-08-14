#!/bin/sh

${HADOOP_COMMON_HOME?"Need to set HADOOP_COMMON_HOME"}

HADOOP_PATH="$HADOOP_COMMON_HOME/share/hadoop"
INCLUDES="$HADOOP_PATH/common/hadoop-common-2.2.0.jar"
INCLUDES="$INCLUDES:$HADOOP_PATH/mapreduce/hadoop-mapreduce-client-core-2.2.0.jar"
INCLUDES="$INCLUDES:$HADOOP_PATH/mapreduce/lib/hadoop-annotations-2.2.0.jar"
INCLUDES="$INCLUDES:./xmlinputformat_classes/jdom-1.1.3.jar"

javac -classpath $INCLUDES -d xmlinputformat_classes XmlDriver.java
jar -cvf xmlinputformat.jar -C xmlinputformat_classes/ .
