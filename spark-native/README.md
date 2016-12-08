The repository this points to k8s4spark/spark.

# Steps to build the docker image

1. Build your spark distribution (typically from sources) with kubernetes support.

```
./dev/make-distribution.sh --tgz -Pkubernetes -Phadoop-2.4 -Darguments="-DskipTests" -Dhadoop.version=2.4.0
```

For further details, refer to: https://github.com/foxish/spark/tree/k8s-support/kubernetes


2. Build and push the docker image by running the following:

```
make push DISTRO_PATH=~/spark.tgz REPO=docker.io/foxish/kube-spark
```

3. Use the newly pushed image in launching a new Spark Job with k8s support using spark-submit.


