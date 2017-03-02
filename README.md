# PhoenixBox

This Vagrant box is based off of [vagrant-phoenix-postgres](https://github.com/jackdb/pg-app-dev-vm)

## Software

* Ubuntu 14.04 LTS
* Elixir 1.4.1
* Phoenix 1.2.0
* PostgreSQL 9.4.11
* NodeJS 7.6.0
* NPM 4.1.2 / Yarn
* Git 1.9.1

## Before getting started

Windows users, make sure you run vagrant from a terminal with admin rights.

## NPM

When running NPM install in a Phoenix project, you may need to tell NPM not to create symlinks.

```
npm install –no-bin-links
```

## Phoenix

To get started with a Phoenix project:

1. Download dependencies `mix deps.get`
2. Create the database `mix ecto.create`
3. Run the migrations `mix ecto.migrate`
4. Start the server `mix phoenix.server`