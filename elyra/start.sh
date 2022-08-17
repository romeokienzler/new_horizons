#!/bin/sh

mkdir -p ~/.config/rclone/
echo [ibm_cos] > ~/.config/rclone/rclone.conf
echo type = s3 >> ~/.config/rclone/rclone.conf
echo provider = Other >> ~/.config/rclone/rclone.conf
echo env_auth = false >> ~/.config/rclone/rclone.conf
echo access_key_id = $ACCESS_KEY_ID >> ~/.config/rclone/rclone.conf
echo secret_access_key = $SECRET_ACCESS_KEY >> ~/.config/rclone/rclone.conf
echo endpoint = $S3_ENDPOINT >> ~/.config/rclone/rclone.conf
echo acl = private >> ~/.config/rclone/rclone.conf
echo "" >> ~/.config/rclone/rclone.conf
echo [gitco] >> ~/.config/rclone/rclone.conf
echo type = local >> ~/.config/rclone/rclone.conf

export PROJECT_EXISTS=`rclone ls ibm_cos:/$BUCKET/$PROJECT |wc -l`
if [ $PROJECT_EXISTS -lt 1 ]; then
  rclone sync ibm_cos:/$BUCKET/$PROJECT/ gitco:/home/jovyan/
else
  rclone mkdir ibm_cos:/$BUCKET/$PROJECT/
  rclone sync gitco:/home/jovyan/ ibm_cos:/$BUCKET/$PROJECT/
fi

while true; do rclone sync gitco:/home/jovyan/ ibm_cos:/$BUCKET/$PROJECT/; sleep 1; done  &

jupyter lab --no-browser --ServerApp.password="$(echo $JL_PASSWORD | python -c 'from notebook.auth import passwd;print(passwd(input()))')"
