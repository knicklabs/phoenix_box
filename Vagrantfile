# -*- mode: ruby -*-
# vi: set ft=ruby :

API_VERSION = '2'

BOX = 'ubuntu/trusty64'

HOST_FOLDER  = 'vagrant'
GUEST_FOLDER = '/vagrant'

HOST_PHOENIX_PORT = 4000
GUEST_PHOENIX_PORT = 4000

HOST_DEVSERVER_PORT = 4001
GUEST_DEVSERVER_PORT = 4001

HOST_POSTGRESQL_PORT = 5432
GUEST_POSTGRESQL_PORT = 5432

Vagrant.configure(API_VERSION) do |config|
  config.vm.box = BOX

  # Rsync files in host folder with guest folder
  config.vm.synced_folder(
    HOST_FOLDER,
    GUEST_FOLDER,
    type: 'rsync',
    rsync__exclude: '.git',
    rsync__args: ["--verbose", "--rsync-path='sudo rsync'", "--archive", "--delete", "-z"]
  )

  # Provision script to setup Ubuntu
  config.vm.provision :shell, path: 'config/vagrant/ubuntu.sh'

  # Provision script to setup Git
  config.vm.provision :shell, path: 'config/vagrant/git.sh'

  # Provision script to setup NodeJS
  config.vm.provision :shell, path: 'config/vagrant/node.sh'

  # Provision script to setup Yarn
  config.vm.provision :shell, path: 'config/vagrant/yarn.sh'

  # Provision script to setup Postgresql 
  config.vm.provision :shell, path: 'config/vagrant/postgresql.sh'

  # Provision script to setup Elixir
  config.vm.provision :shell, path: 'config/vagrant/elixir.sh'

  # Provision script to setup Phoenix
  config.vm.provision :shell, path: 'config/vagrant/phoenix.sh'

  # Static IP 
  # config.vm.network "private_network", ip: "192.168.50.40"

  # Port forward Phoenix app 
  config.vm.network(
    :forwarded_port, 
    host: HOST_PHOENIX_PORT,
    guest: GUEST_PHOENIX_PORT
  )

  # Port forward DevServer
  config.vm.network(
    :forwarded_port,
    host: HOST_DEVSERVER_PORT,
    guest: GUEST_DEVSERVER_PORT
  )

  # Port forward Postgresql database 
  config.vm.network(
    :forwarded_port,
    host: HOST_POSTGRESQL_PORT,
    guest: GUEST_POSTGRESQL_PORT
  )

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
end
