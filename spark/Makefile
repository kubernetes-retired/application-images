all: spark zeppelin
push: push-spark push-zeppelin
.PHONY: push push-spark push-zeppelin spark zeppelin zeppelin-build

# To bump the Spark version, bump the spark_ver in Dockerfile, bump
# this tag and reset to v1. You should also double check the native
# Hadoop libs at that point (we grab the 2.6.1 libs, which are
# appropriate for 1.5.2-with-2.6). Note that you'll need to re-test
# Zeppelin (and it may not have caught up to newest Spark).
TAG = 1.5.2_v1

# To bump the Zeppelin version, bump the version in
# zeppelin/Dockerfile and bump this tag and reset to v1.
ZEPPELIN_TAG = v0.5.6_v1

spark:
	docker build -t gcr.io/google_containers/spark .
	docker tag gcr.io/google_containers/spark gcr.io/google_containers/spark:$(TAG)

# This target is useful when needing to use an unreleased version of Zeppelin
zeppelin-build:
	docker build -t gcr.io/google_containers/zeppelin-build zeppelin-build
	docker tag -f gcr.io/google_containers/zeppelin-build gcr.io/google_containers/zeppelin-build:$(ZEPPELIN_TAG)

zeppelin:
	docker build -t gcr.io/google_containers/zeppelin zeppelin
	docker tag -f gcr.io/google_containers/zeppelin gcr.io/google_containers/zeppelin:$(ZEPPELIN_TAG)

push-spark: spark
	gcloud docker push gcr.io/google_containers/spark
	gcloud docker push gcr.io/google_containers/spark:$(TAG)

push-zeppelin: zeppelin
	gcloud docker push gcr.io/google_containers/zeppelin
	gcloud docker push gcr.io/google_containers/zeppelin:$(ZEPPELIN_TAG)

clean:
	docker rmi gcr.io/google_containers/spark:$(TAG) || :
	docker rmi gcr.io/google_containers/spark || :

	docker rmi gcr.io/google_containers/zeppelin:$(ZEPPELIN_TAG) || :
	docker rmi gcr.io/google_containers/zeppelin || :
