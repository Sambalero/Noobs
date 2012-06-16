require 'rubygems'
require 'sinatra'
require 'haml'
require "sinatra/reloader" if development?  


get '/' do
  haml :welcome
end
