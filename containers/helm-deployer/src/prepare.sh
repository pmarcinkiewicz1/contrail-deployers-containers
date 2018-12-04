#!/bin/bash -e

yum install -y git

cd /root
[ -d contrail-helm-deployer ] || git clone https://github.com/Juniper/contrail-helm-deployer -b R5.0
[ -d openstack-helm ] || git clone https://github.com/Juniper/openstack-helm -b R5.0
[ -d openstack-helm-infra ] || git clone https://github.com/Juniper/openstack-helm-infra -b R5.0
