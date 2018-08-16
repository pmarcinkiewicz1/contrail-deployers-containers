ARG LINUX_DISTR=centos
ARG LINUX_DISTR_VER=7.5.1804
FROM $LINUX_DISTR:$LINUX_DISTR_VER

ARG CONTAINER_NAME
ENV PS1="\033[1m($CONTAINER_NAME)\033[m\017[$(id -un)@$(hostname -s) $(pwd)]$ "

RUN yum install -y git && \
    yum install -y python-pip && \
    pip install 'ansible==2.5.2' && \
    git clone https://github.com/Juniper/openshift-ansible -b release-3.7-contrail /root/openshift-ansible3.7 && \
    git clone https://github.com/Juniper/openshift-ansible -b release-3.9-contrail /root/openshift-ansible3.9 && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]
