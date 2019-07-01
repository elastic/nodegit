FROM centos:6

ENV SHELL /bin/bash
WORKDIR /build

RUN yum -y update
RUN yum -y install epel-release curl
RUN curl http://linuxsoft.cern.ch/cern/scl/slc6-scl.repo --output /etc/yum.repos.d/slc6-scl.repo && \
    yum -y --nogpgcheck install devtoolset-3-gcc devtoolset-3-gcc-c++ git make openssl-devel

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

WORKDIR /src
ADD build_deps.sh src/
RUN src/build_deps.sh
CMD scl enable devtoolset-3 bash
