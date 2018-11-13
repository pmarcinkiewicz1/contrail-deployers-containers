ARG LINUX_DISTR=centos
ARG LINUX_DISTR_VER=7.5.1804
FROM $LINUX_DISTR:$LINUX_DISTR_VER

ARG CONTAINER_NAME
ENV PS1="\033[1m($CONTAINER_NAME)\033[m\017[$(id -un)@$(hostname -s) $(pwd)]$ "

COPY src/* /root/

RUN yum install -y epel-release && \
    yum install -y git python-pip && \
    pip install --upgrade pip && \
    pip install 'ansible==2.5.2' && \
    /root/prepare.sh && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]
