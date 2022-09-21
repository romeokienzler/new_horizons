#!/bin/sh


echo AWSAccessKeyId=$ACCESS_KEY_ID >> /home/jovyan/.duplicity_credentials.txt
echo AWSSecretKey=$SECRET_ACCESS_KEY >> /home/jovyan/.duplicity_credentials.txt

export DISABLE_BACKUP_LOOP=${DISABLE_BACKUP_LOOP=0}
export PROJECT=${PROJECT="default"}
export SSH_PASSWORD=${SSH_PASSWORD="password"}
export JL_PASSWORD=${JL_PASSWORD="password"}

eval `ssh-agent`

duplicity list-current-files s3://$S3_ENDPOINT/$BUCKET/$PROJECT
export PROJECT_EXISTS=$?
if [ $PROJECT_EXISTS -gt 0 ]; then # doesn't exist or other error
  ssh-keygen -t rsa -N $SSH_PASSWORD -C "jupyter_in_space" -f /home/jovyan/.ssh/id_rsa
  duplicity --allow-source-mismatch --exclude /home/jovyan/.cache /home/jovyan/ s3://$S3_ENDPOINT/$BUCKET/$PROJECT/
else #restore
  duplicity  restore --force s3://$S3_ENDPOINT/$BUCKET/$PROJECT/ /home/jovyan/
#  chmod 400 /home/jovyan/.ssh/id_rsa
fi

./expect_ssh.sh
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_NAME


if [ $DISABLE_BACKUP_LOOP -ne 1 ]; then
  while true; do duplicity --allow-source-mismatch --exclude /home/jovyan/.cache /home/jovyan/ s3://$S3_ENDPOINT/$BUCKET/$PROJECT/; sleep 1; done  &
fi

cd /home/jovyan/work/
jupyter lab --no-browser --ServerApp.password="$(echo $JL_PASSWORD | python -c 'from notebook.auth import passwd;print(passwd(input()))')"
