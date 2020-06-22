#!/bin/bash

set -o nounset
set -o errexit

# Local and host tap interfaces
localTapInterface=tap1
hostTapInterface=eth1

# Local and host gateway addresses
# Match local to docker, host to local
localGateway='10.10.0.1/24'
hostGateway='10.10.0.2'
hostNetmask='255.255.255.0'

# Startup local and host tuntap interfaces
sudo ifconfig $localTapInterface $localGateway up
docker run --rm --privileged --net=host --pid=host alpine ifconfig $hostTapInterface $hostGateway netmask $hostNetmask up
