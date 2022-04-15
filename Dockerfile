FROM centos:centos7.7.1908

ARG JFROG_CLI_VER=2.6.1


RUN rpm -ivh "https://releases.jfrog.io/artifactory/jfrog-rpms/jfrog-cli-v2/jfrog-cli-$JFROG_CLI_VER.x86_64.rpm" \
  && mkdir -p /sources /app/bin \
  && echo "Connecting to Artifactory using Jfrog CLI.." \
  && jfrog c add artifactory-oh.pfizer.com --interactive=false --artifactory-url=https://artifactory-oh.pfizer.com/artifactory --user=kempas01 --password=M0ksha098 \
  && jfrog c use artifactory-oh.pfizer.com

CMD ["cat"]
