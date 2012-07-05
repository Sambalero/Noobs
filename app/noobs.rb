require 'pony'
require 'sinatra'
require "bundler/setup"
require "sinatra/reloader" if development?  
require 'active_record'
require 'sinatra/activerecord'  #necessary?

require './db/models'  #necessary?

# require controller files
__DIR__ = ::File.dirname(__FILE__)
require __DIR__ + '/controllers/init'
require __DIR__ + '/../config/routes'
require 'uri'


set :database, 'postgres://Kevin:@localhost/noobs'

db = URI.parse(ENV['DATABASE_URL'] || 'postgres://Kevin:@localhost/noobs')
ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)



