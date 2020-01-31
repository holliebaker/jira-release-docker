# Jira Release Manager Docker

Provides a containerised environment for the [Jira Release Manager](https://github.com/elsbury13/jira-release-manager).

## Instructions

1. Generate a [GitHub Access Token](https://github.com/settings/tokens/new) in order to clone the private repo.

1. Copy `docker-compose.yml.example` to `docker-compose.yml` and fill in the relevant information.
```yaml
version: "3.5"

volumes:
  Code:

services:
  web:
    image: jira-releases
    ports:
      - "8080:80"
    links:
      - php
    volumes:
      - Code:/var/www/html
    environment:
      - JIRA_USERNAME=<jira-username>
      - JIRA_API_KEY=<jira-api-key>
      - JIRA_URL=<jira-api-url>
      - HOST_URL=<host-url>
      - GITHUB_ACCESS_TOKEN=<github-access-token>
  php:
    image: php:7-fpm
    volumes:
      - Code:/var/www/html

```
1. Build the `jira-releases` from Dockerfile
```bash
docker build -t jira-releases .
```
1. Do a
```bash
docker-compose up
```

