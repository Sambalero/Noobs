require 'rubygems'
require 'sinatra'
require 'haml'
require "sinatra/reloader" if development?  


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
