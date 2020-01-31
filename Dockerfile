FROM nginx:latest

WORKDIR /var/www/html

RUN set -eu ; \
    apt-get update && \
    apt-get install -y git

COPY jira-release-manager.conf.template /etc/nginx/conf.d/jira-release-manager.conf.template

COPY setup.sh /usr/local/bin/setup.sh
RUN chmod 755 /usr/local/bin/setup.sh

VOLUME /var/www/html
EXPOSE 80

ENTRYPOINT ["setup.sh"]
CMD ["nginx", "-g", "daemon off;"]
