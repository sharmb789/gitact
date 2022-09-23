FROM redhat/ubi8:8.6-754
ARG R_VERSION=GIT_R_VERSION
RUN subscription-manager register --username=kempas01 --password=BlackPearl@098 && \
    subscription-manager attach --auto && \
    subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms && \
    dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \ 
    echo "Installing R-${R_VERSION} Base..." && \
    curl -O https://cdn.rstudio.com/r/centos-8/pkgs/R-${R_VERSION}-1-1.x86_64.rpm && \
    dnf install -y R-${R_VERSION}-1-1.x86_64.rpm && \
    dnf install -y unixODBC unixODBC-devel && \
    dnf clean all && \
    rm -rf R-${R_VERSION}-1-1.x86_64.rpm &&\
    ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R && \
    ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript && \
    ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/${R_VERSION}
    
COPY Makevars /opt/R/${R_VERSION}/lib/R/etc/Makevars
COPY Makevars /opt/R/${R_VERSION}/lib64/R/etc/Makevars

COPY Renviron /opt/R/${R_VERSION}/lib/R/etc/Renviron
COPY Renviron /opt/R/${R_VERSION}/lib64/R/etc/Renviron

RUN dnf install -y wget
RUN wget https://github.com/metrumresearchgroup/pkgr/releases/download/v3.1.0/pkgr_3.1.0_linux_amd64.tar.gz -O /tmp/pkgr.tar.gz \
&& tar -xzf /tmp/pkgr.tar.gz pkgr \
&& mv pkgr /usr/local/bin/pkgr \
&& chmod +x /usr/local/bin/pkgr \
&& rm -rf /tmp/pkgr.tar.gz
COPY pkgr.yml /pkgr.yml
RUN pkgr install

