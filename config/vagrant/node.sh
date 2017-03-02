#!/usr/bin/env bash

echo "Begin provisioning using config/vagrant/node.sh"

curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install nodejs

echo "End provisioning using config/vagrant/node.sh"