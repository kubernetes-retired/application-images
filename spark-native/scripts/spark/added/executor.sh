#!/bin/sh

set -e
set -x

cd $SPARK_HOME
$SPARK_HOME/bin/spark-class $@
