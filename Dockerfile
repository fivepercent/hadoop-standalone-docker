FROM ubuntu:16.04

MAINTAINER Zhenle <zhuzhenle@gmail.com>

WORKDIR /root

RUN apt-get -qq update && apt-get -qq install -y openssh-server openjdk-8-jdk wget

RUN wget https://s3-us-west-1.amazonaws.com/apache-hadoop-2-8-0/hadoop-2.8.0.tar.gz && \
	tar -xzvf hadoop-2.8.0.tar.gz && \
	mv hadoop-2.8.0 /usr/local/hadoop && \
    rm hadoop-2.8.0.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY config/* /tmp/

RUN mv /tmp/run-wordcount.sh ~/run-wordcount.sh

RUN chmod +x ~/*.sh

RUN echo '\
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \n\
export PATH=${JAVA_HOME}/bin:${PATH} \n\
export HADOOP_CLASSPATH=export HADOOP_CLASSPATH=/usr/lib/jvm/java-7-openjdk-amd64/lib/tools.jar \n\
' >> ~/.bashrc

RUN mkdir /root/src/
VOLUME /root/src/

CMD [ "sh", "-c", "service ssh start; bash"]