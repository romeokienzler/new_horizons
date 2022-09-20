#!/bin/sh


echo AWSAccessKeyId=$ACCESS_KEY_ID >> /home/jovyan/duplicity_credentials.txt
echo AWSSecretKey=$SECRET_ACCESS_KEY >> /home/jovyan/duplicity_credentials.txt


eval `ssh-agent`

duplicity list-current-files s3://$S3_ENDPOINT/$BUCKET/$PROJECT
export PROJECT_EXISTS=$?
if [ $PROJECT_EXISTS -gt 0 ]; then # doesn't exist or other error
  ssh-keygen -t rsa -N $SSH_PASSWORD -C "jupyter_in_space" -f /home/jovyan/.ssh/id_rsa
  duplicity --allow-source-mismatch /home/jovyan/ s3://$S3_ENDPOINT/$BUCKET/$PROJECT/
else #restore
  duplicity  restore s3://$S3_ENDPOINT/$BUCKET/$PROJECT/ /home/jovyan/
#  chmod 400 /home/jovyan/.ssh/id_rsa
fi

./expect_ssh.sh
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_NAME


if [ $DISABLE_BACKUP_LOOP -ne 1 ]; then
  while true; do duplicity --allow-source-mismatch --exclude /home/jovyan/.cache /home/jovyan/ s3://$S3_ENDPOINT/$BUCKET/$PROJECT/; sleep 1; done  &
fi


jupyter lab --no-browser --ServerApp.password="$(echo $JL_PASSWORD | python -c 'from notebook.auth import passwd;print(passwd(input()))')"
