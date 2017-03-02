#!/usr/bin/env bash

echo "Begin provisioning using config/vagrant/ubuntu.sh"

apt-get -y update
apt-get -y install vim wget
apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev inotify-tools

echo "End provisioning using config/vagrant/ubuntu.sh"