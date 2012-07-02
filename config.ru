require 'rubygems'
require 'bundler'

Bundler.require

require './app/noobs'

# ENV['RACK_ENV'] = 'development'

run Sinatra::Application
