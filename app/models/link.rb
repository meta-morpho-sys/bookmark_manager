require 'data_mapper'
require 'dm-postgres-adapter'

#this class corresponds to a table in the database

class Link
  include DataMapper::Resource
  property :id,     Serial
  property :title,  String
  property :url,    String
end


#Setting up a connection with a database
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
