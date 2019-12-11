ARG CONTRAIL_REGISTRY
ARG CONTRAIL_DEPLOYERS_TAG
FROM ${CONTRAIL_REGISTRY}/contrail-deployers-base:${CONTRAIL_DEPLOYERS_TAG}
COPY squid.pem /etc/pki/ca-trust/source/anchors/squid.pem
ARG CONTAINER_NAME

# If <source> is a directory, the entire contents of the directory are copied, including filesystem metadata.
# Note: The directory itself is not copied, just its contents.
COPY src /root/

RUN update-ca-trust export &&\
    update-ca-trust &&\
    export REQUESTS_CA_BUNDLE=/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem &&\
    yum install -y git python-pip && \
    pip --no-cache-dir install --upgrade 'ansible==2.6.18' "cffi<1.13" && \
    /root/prepare.sh && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]
