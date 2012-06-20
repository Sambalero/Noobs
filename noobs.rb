require 'pony'
require 'sinatra'
require 'haml'
require "bundler/setup"
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

    Pony.mail(
      :from => params[:name],
      :to => 'kevinswallow2@hotmail.com',
      :subject => params[:contact],
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
