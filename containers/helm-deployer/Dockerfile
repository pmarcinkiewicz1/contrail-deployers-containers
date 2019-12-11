ARG CONTRAIL_REGISTRY
ARG CONTRAIL_DEPLOYERS_TAG
FROM ${CONTRAIL_REGISTRY}/contrail-deployers-base:${CONTRAIL_DEPLOYERS_TAG}
COPY squid.pem /etc/pki/ca-trust/source/anchors/squid.pem
ARG CONTAINER_NAME

COPY src /root/

RUN update-ca-trust export &&\
    update-ca-trust &&\
    export REQUESTS_CA_BUNDLE=/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem &&\
    yum install -y sshpass git && \
    # use the same ansible verion as upstream
    pip --no-cache-dir install --upgrade setuptools "ansible==2.7.11" "cffi<1.13" && \
    /root/prepare.sh && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]
