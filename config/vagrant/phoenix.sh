#!/usr/bin/env bash

echo "Begin provisioning using config/vagrant/phoenix.sh"

mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

echo "End provisioning using config/vagrant/phoenix.sh"
