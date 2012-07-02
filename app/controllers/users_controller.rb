class UsersController

get '/users' do
  @users = User.all
  erb :users
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :show
end

post '/users' do
  name = params[:name]
  user = User.new(:name => name)
puts user
  user.save
  @users = User.all
  erb :users
end

end