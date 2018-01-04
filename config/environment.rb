require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'


# turned off SQL Messages to console  must comment out while seeding
ActiveRecord::Base.logger.level = 1


require 'rainbow/refinement'
using Rainbow
