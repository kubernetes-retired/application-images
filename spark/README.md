# Spark

This is a Docker image appropriate for running Spark on Kuberenetes. It produces three main images:
* `spark-master` - Runs a Spark master in Standalone mode and exposes a port for Spark and a port for the WebUI.
* `spark-worker` - Runs a Spark worer in Standalone mode and connects to the Spark master via DNS name `spark-master`.
* `zeppelin` - Runs a Zeppelin web notebook and connects to the Spark master via DNS name `spark-master` and exposes a port for the WebUI.

In addition, there are two additional pushed images:
* `spark-base` - This base image for `spark-master` and `spark-worker` that starts nothing.
* `spark-driver` - This image, just like the `zeppelin` image, allows running things like `pyspark` to connect to `spark-master`, but is lighter weight than the `zeppelin` image.
