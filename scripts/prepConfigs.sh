#!/bin/bash
mkdir /opt/application/conf/
if [[ "$DEPLOYMENT_GROUP_NAME" =~ "_prod" ]]; then
  cp -r /tmp/application/configs/prod/ /opt/application/conf/
  sed -i "s/%APPENV%/PRODUCTION/g" /var/www/html/index.html
elif [[ "$DEPLOYMENT_GROUP_NAME" =~ "_stg " ]]; then
  cp -r /tmp/application/configs/staging/ /opt/application/conf/
  sed -i "s/%APPENV%/STAGING/g" /var/www/html/index.html
else
  echo "** prepConfigs.sh ** Something wrong with DEPLOYMENT_GROUP_NAME"
fi
rm -rf /tmp/application/