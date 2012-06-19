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
  require 'pony'
    Pony.mail(
      :from => params[:name] + "<" + params[:contact] + ">",
      :to => 'kevinswallow2@hotmail.com',
      :subject => "NOOBS comment",
      :body => params[:comment],
      :port => '587',
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV['app5287164@heroku.com'],
        :password => ENV['2tc2jutb'],
        :authentication => :plain,
        :enable_starttls_auto => true
      })
    haml :thankYou
end    
