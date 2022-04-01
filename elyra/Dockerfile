FROM quay.io/elyra/elyra:3.2.2
USER root
RUN apt update && apt install -y wget vim tree zip unzip ssh 
USER jovyan
#RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
RUN mkdir -p /home/jovyan/.local/share/jupyter/metadata
USER root
RUN apt update && apt install -y nmap telnet
USER jovyan
EXPOSE 8888
CMD jupyter-lab --no-browser
