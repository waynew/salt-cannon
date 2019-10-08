FROM centos:7

ARG repo_user
ARG repo_pass
RUN sudo yum install https://${repo_user}:${repo_pass]@repo.saltstack.com/staging/yum/redhat/salt-repo-latest.el7.noarch.rpm
RUN yum install -y salt-minion
