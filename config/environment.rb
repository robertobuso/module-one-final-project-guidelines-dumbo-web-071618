require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
