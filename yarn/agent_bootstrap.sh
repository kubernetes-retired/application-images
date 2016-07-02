#!/bin/sh

export JAVA_HOME=/usr

HADOOP_PREFIX=/opt/hadoop-2.7.2
HADOOP_YARN_HOME=$HADOOP_PREFIX
HADOOP_CONF_DIR=/opt/hadoop-2.7.2/etc/hadoop

service ssh start

sed "s/__HOSTNAME__/yarn-master/g" /root/core-site.xml.template   > $HADOOP_CONF_DIR/core-site.xml
sed "s/__HOSTNAME__/yarn-master/g" /root/yarn-site.xml.template   > $HADOOP_CONF_DIR/yarn-site.xml
sed "s/__HOSTNAME__/yarn-master/g" /root/hdfs-site.xml.template   > $HADOOP_CONF_DIR/hdfs-site.xml
sed "s/__HOSTNAME__/yarn-master/g" /root/mapred-site.xml.template > $HADOOP_CONF_DIR/mapred-site.xml

echo "export JAVA_HOME=/usr" >> $HADOOP_CONF_DIR/hadoop-env.sh

mkdir /opt/hadoop272/dfs/name -p
mkdir /opt/hadoop272/dfs/data -p

$HADOOP_PREFIX/bin/hdfs namenode -format yarn_272_hdfs

$HADOOP_YARN_HOME/sbin/yarn-daemons.sh --config $HADOOP_CONF_DIR start nodemanager
$HADOOP_PREFIX/sbin/hadoop-daemons.sh --config $HADOOP_CONF_DIR --script hdfs start datanode

while true; do sleep 1000; done
