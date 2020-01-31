#!/bin/bash

set -eux

cd /var/www/html/
if [[ -d jira-release-manager ]]
then
    cd jira-release-manager && git pull
else
    git clone https://${GITHUB_ACCESS_TOKEN}@github.com/may-den/jira-release-manager && \
    cd jira-release-manager
fi

cp .env.example .env
sed -i -e "s/##USERNAME##/${JIRA_USERNAME}/g" .env
sed -i -e "s/##API_KEY##/${JIRA_API_KEY}/g" .env
sed -i -e "s~##URL###~${JIRA_URL}~g" .env

cd /etc/nginx/conf.d
mv jira-release-manager.conf.template jira-release-manager.conf
sed -i -e "s~##HOST_URL##~${HOST_URL}~g" jira-release-manager.conf

exec "$@"
