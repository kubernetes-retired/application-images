FROM centos:latest

MAINTAINER Erik Erlandson <eje@redhat.com>

# when the containers are not run w/ uid 0, the uid may not map in
# /etc/passwd and it may not be possible to modify things like
# /etc/hosts. nss_wrapper provides an LD_PRELOAD way to modify passwd
# and hosts.
RUN yum install -y epel-release tar java && \
    yum install -y nss_wrapper && \
    yum clean all

ENV PATH=$PATH:/opt/spark/bin
ENV SPARK_HOME=/opt/spark

# Add scripts used to configure the image
COPY scripts /opt/scripts/

COPY spark-distro.tgz /opt/spark/

RUN cd /opt/spark && tar --strip-components=1 -xzf spark-distro.tgz && rm spark-distro.tgz && bash -x /opt/scripts/spark/install
