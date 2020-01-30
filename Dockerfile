FROM nginx:latest

WORKDIR /var/www/html

RUN set -eu ; \
    apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/elsbury13/jira-release-manager.git

COPY jira-release-manager.conf.template /etc/nginx/conf.d/jira-release-manager.conf.template

COPY setup.sh /usr/local/bin/setup.sh
RUN chmod 755 /usr/local/bin/setup.sh

EXPOSE 80

ENTRYPOINT ["setup.sh"]
CMD ["nginx", "-g", "daemon off;"]
