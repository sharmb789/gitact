FROM centos:latest



RUN yum install -y epel-release  
&& yum install -y R
=======

RUN rpm -ivh "https://releases.jfrog.io/artifactory/jfrog-rpms/jfrog-cli-v2/jfrog-cli-$JFROG_CLI_VER.x86_64.rpm" 

CMD ["cat"]
