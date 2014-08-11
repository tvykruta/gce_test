#!/bin/sh

HADOOP_PATH="/home/hadoop/hadoop-install/share/hadoop"

INCLUDES="$HADOOP_PATH/common/hadoop-common-2.2.0.jar"
INCLUDES="$INCLUDES:$HADOOP_PATH/mapreduce/hadoop-mapreduce-client-core-2.2.0.jar"
INCLUDES="$INCLUDES:$HADOOP_PATH/mapreduce/lib/hadoop-annotations-2.2.0.jar"
INCLUDES="$INCLUDES:./jdom/build/jdom-1.1.3.jar"
echo  "Including: $INCLUDES"
javac -classpath $INCLUDES -d xmlinputformat_classes MyParserMapper.java  ParserDriver.java  XmlInputFormat.java
jar -cvf xmlinputformat.jar -C xmlinputformat_classes/ .
