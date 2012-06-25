require 'pony'
require 'sinatra'
require "bundler/setup"
require "sinatra/reloader" if development?  

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
      :subject => ,
      :body => "comment: " + params[:comment] +"\n from: " + params[:contact]
      :port => '587',
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV["SENDGRID_USERNAME"],
        :password => ENV["SENDGRID_PASSWORD"],
        :authentication => :plain,
        :enable_starttls_auto => true
      })
    erb :thankYou     
end  
