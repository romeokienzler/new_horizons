FROM quay.io/elyra/elyra:3.10.1
USER root
RUN apt update && apt install -y wget vim tree zip unzip ssh duplicity python3-boto nmap telnet
RUN apt update && apt install -y expect
USER jovyan
#RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
RUN mkdir -p /home/jovyan/.local/share/jupyter/metadata
ADD start.sh /home/jovyan/start.sh
ADD expect_ssh.sh /home/jovyan/expect_ssh.sh
USER root
RUN chmod 755 /home/jovyan/start.sh
RUN chown jovyan:users /home/jovyan/start.sh
RUN chmod 755 /home/jovyan/expect_ssh.sh
RUN chown jovyan:users /home/jovyan/expect_ssh.sh
USER jovyan
ENV AWS_CREDENTIAL_FILE=/home/jovyan/.duplicity_credentials.txt
RUN echo "c.NotebookApp.rate_limit_window = 10" >> /home/jovyan/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.iopub_data_rate_limit = 10000000" >> /home/jovyan/.jupyter/jupyter_notebook_config.py
EXPOSE 8888 
CMD /home/jovyan/start.sh
