FROM debian:8

ARG repo_user
ARG repo_pass
RUN apt-get update && apt-get install -y wget
RUN wget -O - https://${repo_user}:${repo_pass}@repo.saltstack.com/staging/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://${repo_user}:${repo_pass}@repo.saltstack.com/staging/apt/debian/8/amd64/latest jessie main" >> /etc/apt/sources.list.d/saltstack.list
RUN apt-get update

RUN apt-get install -y salt-minion
