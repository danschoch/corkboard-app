require "yaml"


require 'bundler/setup'
Bundler.require
# (:default, ENV['SINATRA_ENV'])

SIN_ENV = ENV['SINATRA_ENV'] ||= "development"
DB_SETTINGS = YAML.load_file("config/database.yml")[SIN_ENV]
ActiveRecord::Base.establish_connection(DB_SETTINGS)


set :database_file, './database.yml'

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/development.sqlite"
# )

require_all 'app'