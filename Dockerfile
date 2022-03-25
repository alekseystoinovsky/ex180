FROM registry.access.redhat.com/ubi7-init

MAINTAINER Ohubohu

USER root

RUN useradd -m app && mkdir -p /home/app/src

COPY Containerfile /home/app/src
COPY pom.xml /home/app

#ERROR
#RUN nocmd

RUN mkdir -p /var/local/SP

RUN yum -y update && yum install -y openssh sudo && yum clean all

EXPOSE 8080

ENTRYPOINT ["/usr/sbin/init"]
CMD ["/bin/bash"]
