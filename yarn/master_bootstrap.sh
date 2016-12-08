#!/bin/sh

export JAVA_HOME=/usr

HADOOP_PREFIX=/opt/hadoop-2.7.2
HADOOP_YARN_HOME=$HADOOP_PREFIX
HADOOP_CONF_DIR=/opt/hadoop-2.7.2/etc/hadoop
HDFS_DIR=/opt/hadoop272

sed "s/__HOSTNAME__/"$(hostname)"/g" /root/core-site.xml.template   > $HADOOP_CONF_DIR/core-site.xml
sed "s/__HOSTNAME__/"$(hostname)"/g" /root/yarn-site.xml.template   > $HADOOP_CONF_DIR/yarn-site.xml
sed "s/__HOSTNAME__/"$(hostname)"/g" /root/hdfs-site.xml.template   > $HADOOP_CONF_DIR/hdfs-site.xml
sed "s/__HOSTNAME__/"$(hostname)"/g" /root/mapred-site.xml.template > $HADOOP_CONF_DIR/mapred-site.xml

if [ ! -e "${HDFS_DIR}/dfs/name" ]
then
  mkdir ${HDFS_DIR}/dfs/name -p
  mkdir ${HDFS_DIR}/dfs/data -p
  
  $HADOOP_PREFIX/bin/hdfs namenode -format yarn_272_hdfs
fi

$HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode
$HADOOP_PREFIX/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager

while true;
do
  sleep 1000;
# TODO(k82cn): if no java process, exit.
done
