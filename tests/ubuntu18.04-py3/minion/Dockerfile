FROM ubuntu:18.04

ARG repo_user
ARG repo_pass
ENV TZ Etc/UTC
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget gpg
RUN wget -O - https://${repo_user}:${repo_pass}@repo.saltstack.com/staging/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://${repo_user}:${repo_pass}@repo.saltstack.com/staging/py3/ubuntu/18.04/amd64/latest bionic main" >> /etc/apt/sources.list.d/saltstack.list
RUN apt-get update

RUN apt-get install -y salt-minion
