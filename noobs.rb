require 'rubygems'
require 'sinatra'
require 'haml'


get '/' do
  haml :welcome
end
