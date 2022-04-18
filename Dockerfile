FROM centos:latest

ARG JFROG_CLI_VER=2.9.0


RUN rpm -ivh "https://releases.jfrog.io/artifactory/jfrog-rpms/jfrog-cli-v2/jfrog-cli-$JFROG_CLI_VER.x86_64.rpm" 
CMD ["cat"]
