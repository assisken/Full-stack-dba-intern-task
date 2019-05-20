#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Got from https://www.rabbitmq.com/install-debian.html#apt-packagecloud

## Install RabbitMQ signing key
apt-key adv --keyserver "hkps.pool.sks-keyservers.net" --recv-keys "0x6B73A36E6026DFCA"

## Install apt HTTPS transport
apt-get install apt-transport-https

## Add Bintray repositories that provision latest RabbitMQ and Erlang 21.x releases
tee /etc/apt/sources.list.d/bintray.rabbitmq.list <<EOF
deb http://dl.bintray.com/rabbitmq-erlang/debian stretch erlang-21.x
deb https://dl.bintray.com/rabbitmq/debian stretch main
EOF

## Update package indices
apt-get update -y

## Install rabbitmq-server and its dependencies
apt-get install rabbitmq-server -y --fix-missing
