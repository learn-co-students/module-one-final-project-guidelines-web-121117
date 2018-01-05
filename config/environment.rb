require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require 'open-uri'
require 'json'
require 'artii'
include Interface

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
