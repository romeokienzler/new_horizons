#!/bin/sh


echo AWSAccessKeyId=$ACCESS_KEY_ID >> /home/jovyan/duplicity_credentials.txt
echo AWSSecretKey=$SECRET_ACCESS_KEY >> /home/jovyan/duplicity_credentials.txt


#eval `ssh-agent`

#export PROJECT_EXISTS=`rclone ls ibm_cos:/$BUCKET/$PROJECT |wc -l`
#if [ $PROJECT_EXISTS -lt 1 ]; then
#  ssh-keygen -t rsa -N $SSH_PASSWORD -C "jupyter_in_space" -f /home/jovyan/.ssh/id_rsa
#  rclone mkdir ibm_cos:/$BUCKET/$PROJECT/
#  rclone sync gitco:/home/jovyan/ ibm_cos:/$BUCKET/$PROJECT/
#else
#  rclone sync ibm_cos:/$BUCKET/$PROJECT/ gitco:/home/jovyan/
#  chmod 400 /home/jovyan/.ssh/id_rsa
#fi

#./expect_ssh.sh
#git config --global user.email $GIT_EMAIL
#git config --global user.name $GIT_NAME

#while true; do rclone sync gitco:/home/jovyan/ ibm_cos:/$BUCKET/$PROJECT/; sleep 1; done  &

#jupyter lab --no-browser --ServerApp.password="$(echo $JL_PASSWORD | python -c 'from notebook.auth import passwd;print(passwd(input()))')"
