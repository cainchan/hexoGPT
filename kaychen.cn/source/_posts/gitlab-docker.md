---
title: Gitlab Docker部署
date: 2021-08-07 11:20:00
tags:
 - Gitlab
 - Docker
---

#### Gitlab

```yaml
version: "3"
services:
  gitlab:
    container_name: 'gitlab'
    image: 'gitlab/gitlab-ce:latest'
    restart: always
    user: root
    hostname: '192.168.56.128'
    privileged: true
    environment:
      GITLAB_OMNIBUS_CONFIG:
        external_url 'https://192.168.56.128'
    ports:
      - '80:80'
      - '443:443'
      - '2222:22'
    volumes:
      - './data/gitlab/config:/etc/gitlab'
      - './data/gitlab/logs:/var/log/gitlab'
      - './data/gitlab/data:/var/opt/gitlab'
    network_mode: bridge
```



#### Gitlab-Runner

```yaml
version: "3"
services:
  gitlab-runner:
    image: gitlab/gitlab-runner:alpine
    container_name: gitlab-runner
    privileged: true
    volumes:
      - ./data/gitlab-runner/config:/etc/gitlab-runner
      - /var/run/docker.sock:/var/run/docker.sock
      - $HOME/.m2:/root/.m2
    environment:
      TZ: "$TZ"
    restart: always
    network_mode: bridge
```



#### Jenkins

```yaml
version: "3"
services:
  jenkins:
    container_name: jenkins
    image: jenkinsci/blueocean
    restart: always
    volumes:
      - "/opt/jenkins_home:/var/jenkins_home"
      - "/var/run/docker.sock:/var/run/docker.sock"
    ports:
      - 8081:8080
    network_mode: bridge
```

