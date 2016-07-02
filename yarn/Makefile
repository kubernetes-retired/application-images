all: yarn-agent yarn-master
push: push-agent push-master
.PHONY: push push-agent push-master yarn-agent yarn-master

TAG = 2.7.2

init:
	if [ ! -e "hadoop-2.7.2.tar.gz" ] ; then  wget http://apache.fayea.com/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz && tar zxvf hadoop-2.7.2.tar.gz; fi 

yarn-agent: init
	docker build -t gcr.io/google_containers/yarn-agent -f Dockerfile.agent .
	docker tag gcr.io/google_containers/yarn-agent gcr.io/google_containers/yarn-agent:$(TAG)

yarn-master: init
	docker build -t gcr.io/google_containers/yarn-master -f Dockerfile.master .
	docker tag -f gcr.io/google_containers/yarn-master gcr.io/google_containers/yarn-master:$(TAG)

push-agent: yarn-agent
	gcloud docker push gcr.io/google_containers/yarn-agent
	gcloud docker push gcr.io/google_containers/yarn-agent:$(TAG)

push-master: yarn-master
	gcloud docker push gcr.io/google_containers/yarn-master
	gcloud docker push gcr.io/google_containers/yarn-master:$(TAG)

clean:
	docker rmi gcr.io/google_containers/yarn-agent:$(TAG) || :
	docker rmi gcr.io/google_containers/yarn-agent || :

	docker rmi gcr.io/google_containers/yarn-master:$(TAG) || :
	docker rmi gcr.io/google_containers/yarn-master || :
