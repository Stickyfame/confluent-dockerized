FROM centos:7
ENV container docker
RUN yum -y update; yum clean all
RUN rpm -ivh https://hpc.lenovo.com/yum/latest/el7/x86_64/lenovo-hpc-yum-1-1.x86_64.rpm
RUN yum --disablerepo=* --enablerepo=lenovo-hpc update
RUN yum -y install httpd lenovo-confluent

ARG CONFLUENT_USER
ARG CONFLUENT_PASSWORD
ENV user=$CONFLUENT_USER
ENV pswd=$CONFLUENT_PASSWORD

EXPOSE 4005

ADD run-confluent.sh /run-confluent.sh
RUN chmod -v +x /run-confluent.sh

CMD ["/run-confluent.sh", "${user}", "${pswd}"]
