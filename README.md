# Capistrano-helpers

This gem provides Capistrano 3 helper methods such as:

- `cap generate_db_diagram` generate db diagram for your application
- `cap console:open` open Rails console on remote server
- `cap console:open_sandbox` open Rails console on remote server in sandbox mode
- `cap db:dump` dump the current database on remote server
- `cap db:restore_to_local` restore local database with latest dump from remote server
- `cap db:pull` the combination of `db:dump` and `db:restore_to_local`
- `cap live:check` check if everything is deployed

for a comprehensive list, please refer to `cap --tasks`

## Here be dragons

As this gem is extracted from several internal projects, please make sure you removed all the same-named cap tasks 
within your project after installed this gem, otherwise you will be surprised

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-helpers', :require => false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-helpers

## Usage

Add below to `Capfile` or `config/deploy.rb`:

    require 'capistrano-helpers'
