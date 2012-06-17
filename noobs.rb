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

#class Noobs < Sinatra::Base ???
#change run Sinatra to run Noobs.new in config.ru?

get '/' do
  haml :welcome
end

get '/commentary' do
  haml :commentary
end

get '/page2' do
  haml :page2
end

get '/*' do
  haml :not_found
end

post '/' do
  haml :next
end
