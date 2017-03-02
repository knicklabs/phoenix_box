#!/usr/bin/env bash

echo "Begin provisioning using config/vagrant/elixir.sh"

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir

echo "End provisioning using config/vagrant/elixir.sh"
