require './noobs'

ENV['RACK_ENV'] = 'development'

run Sinatra::Application
