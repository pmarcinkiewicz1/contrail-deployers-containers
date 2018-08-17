ARG LINUX_DISTR=centos
ARG LINUX_DISTR_VER=7.5.1804
FROM $LINUX_DISTR:$LINUX_DISTR_VER

ARG CONTAINER_NAME
ENV PS1="\033[1m($CONTAINER_NAME)\033[m\017[$(id -un)@$(hostname -s) $(pwd)]$ "

RUN yum install -y epel-release && \
    yum install -y git python-ipaddress python-pip sudo vim gcc python-devel && \
    pip install --upgrade pip && \
    pip install 'ansible==2.4.2' && \
    pip install pycrypto oslo_utils oslo_config jinja2 && \
    git clone https://github.com/Juniper/contrail-ansible-deployer -b master /root/contrail-ansible-deploer && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]
