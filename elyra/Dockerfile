FROM quay.io/elyra/elyra:3.10.1
USER root
RUN apt update && apt install -y wget vim tree zip unzip ssh rclone nmap telnet
RUN apt update && alt install -y expect
USER jovyan
#RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
RUN mkdir -p /home/jovyan/.local/share/jupyter/metadata
ADD start.sh /home/jovyan/start.sh
EXPOSE 8888 
CMD /home/jovyan/start.sh
