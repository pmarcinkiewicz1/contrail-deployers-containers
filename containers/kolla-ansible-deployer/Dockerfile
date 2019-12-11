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
    yum install -y python-ipaddress git sudo vim gcc sshpass openssl python-devel libffi-devel openssl-devel && \
    pip --no-cache-dir install --upgrade 'ansible==2.7.11' "cffi<1.13" pycrypto oslo_utils oslo_config jinja2 && \
    /root/prepare.sh && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]
