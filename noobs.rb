require 'rubygems'
require 'sinatra'
require 'haml'
require 'data_mapper'
require "sinatra/reloader" if development?  

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Comment
  include DataMapper::Resource
  property :id,           Serial
  property :contact,      String, :required => true
  property :verbiage,      String, :required => true
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  haml :welcome
end

get '/*' do
  haml :not_found
end
