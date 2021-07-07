#id=`docker run -d -p 8888:8888 -v elyra:/home/jovyan/work elyra-ai jupyter-lab`
#sleep 3
#docker exec -it $id jupyter notebook list |sed -s 's/0.0.0.0/127.0.0.1/'
#docker run -it -p 8888:8888 -p 8050:8050 --shm-size=10G -v elyra_work:/home/jovyan/work elyra-ai /bin/bash
docker run -it -p 8888:8888 -p 8050:8050 --shm-size=10G -v elyra_work:/home/jovyan/work -v elyra_runtimes:/home/jovyan/.local/share/jupyter/metadata elyra-ai  jupyter-lab --no-browser

