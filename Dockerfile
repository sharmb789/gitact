FROM redhat/ubi8:8.6-754

RUN subscription-manager register --username=kempas01 --password=BlackPearl@098 \
&& subscription-manager attach --auto \
&& subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms \
&& dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
&& dnf clean all
