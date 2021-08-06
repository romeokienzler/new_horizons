FROM elyra/elyra:dev
#FROM elyra/elyra:2.3.0b0
#FROM elyra/elyra@sha256:6c4c2178bde39eb2c22ae5ef7b043cf514e67c637e07918ea054b54318adbef8
USER root
RUN apt update && apt install -y wget vim tree zip unzip ssh 
USER jovyan
RUN pip install scikit-learn==0.24.1 aif360==0.3.0 lime==0.2.0.1 nodejs==0.1.1 ipywidgets==8.0.0a5 import_ipynb==0.1.3 import_ipynb==0.1.3 wget==3.2 ansible==3.1.0 wget==3.2 gitpython==3.1.14 ansible==3.1.0 pandas==1.2.1 scikit-learn==0.24.1 aif360==0.3.0 nodejs==0.1.1 lime==0.2.0.1 wget==3.2 kfserving==0.4.1 pyspark==3.1.2 #aix360==0.2.1
RUN conda install -y tensorflow==2.4.0
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN mkdir -p /home/jovyan/.local/share/jupyter/metadata
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
USER root
RUN apt update && apt install -y openjdk-11-jdk
USER jovyan

RUN git config --global user.email "romeo.kienzler@ch.ibm.com"
RUN git config --global user.name "Romeo Kienzer"
EXPOSE 8888
CMD jupyter-lab --no-browser
