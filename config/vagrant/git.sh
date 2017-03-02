#!/usr/bin/env bash

echo "Begin provisioning using config/vagrant/git.sh"

apt-get -y update
apt-get -y install git-core

echo "End provisioning using config/vagrant/git.sh"
