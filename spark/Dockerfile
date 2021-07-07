FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN apt update && apt install -y wget tar sudo default-jre curl unzip
RUN wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
RUN tar xvfz spark-3.1.2-bin-hadoop3.2.tgz
RUN wget https://dl.k8s.io/v1.21.0/kubernetes-client-linux-amd64.tar.gz
RUN tar xvfz kubernetes-client-linux-amd64.tar.gz
RUN chmod 755 kubernetes/client/bin/kubectl
RUN mv kubernetes/client/bin/kubectl /bin/
RUN rm -Rf kubernetes
RUN rm kubernetes-client-linux-amd64.tar.gz
WORKDIR /spark-3.1.2-bin-hadoop3.2

