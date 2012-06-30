require 'pony'
require 'sinatra'
require "bundler/setup"
require "sinatra/reloader" if development?  
require 'active_record'
require 'sinatra/activerecord'  #necessary?

require './db/models'  #necessary?

__DIR__ = ::File.dirname(__FILE__)
require __DIR__ + '/controllers/init'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3', 
  :database => 'db/development.db'
)

get '/' do
  erb :welcome
end

get '/commentary' do
  erb :commentary
end

get '/page2' do
  erb :page2
end





get '/*' do
  erb :not_found
end

post '/' do   

  Pony.mail(
    :from => "Noobs",
    :to => 'kpswallow2@gmail.com',
    :subject => params[:name],
    :body => "comment: " + params[:comment] +"\n from: " + params[:contact],
    :port => '587',
    :via => :smtp,
    :via_options => {
      :address => 'smtp.sendgrid.net',
      :port => '587',
    :domain => 'swallowsnest.net',
    :user_name => 'app5287164@heroku.com',
    :password => '2tc2jutb',
      :authentication => :plain,
      :enable_starttls_auto => true
    })
  erb :thankYou     
end  
