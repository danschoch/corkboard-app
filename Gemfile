source "https://rubygems.org"

gem 'sinatra'
gem 'activerecord', '4.2.5', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'
gem 'pg'

group :production do
  # Use Postgresql for ActiveRecord
#   gem 'pg'
end

group :development, :test do
  # Use SQLite for ActiveRecord
  gem 'sqlite3'
end
