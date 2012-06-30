class UsersController

get '/users' do
  @users = User.all
  erb :users
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :show
end

end