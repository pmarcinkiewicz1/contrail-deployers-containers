ARG DEPLOYERS_BASE_CONTAINER
FROM ${DEPLOYERS_BASE_CONTAINER}
COPY squid.pem /etc/pki/ca-trust/source/anchors/squid.pem
RUN update-ca-trust export &&\
    update-ca-trust &&\
    export REQUESTS_CA_BUNDLE=/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem &&\
    yum update -y && \
    yum install -y python-setuptools && easy_install pip && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENV PS1="\033[1m($(printenv CONTAINER_NAME))\033[m\017[$(id -un)@$(hostname -s) $(pwd)]$ "

CMD ["/usr/bin/tail","-f","/dev/null"]
