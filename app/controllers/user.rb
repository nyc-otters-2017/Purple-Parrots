get '/users' do
  redirect '/'
end




get '/users/new' do
  erb :'/users/new'
end




post '/users' do
  passwords_match?(params[:user][:password1], params[:user][:password2])
  if @password
    @user = User.find_by(email: params[:email], password: @password)
    redirect "/users/#{@user.id}"
  else
    erb :'/users/new'
  end
end




get '/users/login' do
  erb :'/users/login'
end




get '/users/logout' do
  session.clear
  redirect '/users'
end




get '/users/:id' do
  @user = User.find(id: params[:id])
  erb :'users/show'
end




get '/users/:id/edit' do
  @user = User.find(id: params[:id])
  current_user
  if @user.id == @current_user.id
    erb :'users/edit'
  else
    ## unsure how to do this
  end
end




put '/users/:id' do
  @user = User.find(id: params[:id])
  current_user
  if @user.update(params[:user])
    erb :'/users/show', layout: false
  else
    @errors = @users.erros.full_messages
    erb :'users/edit'
  end
end




delete '/users/:id' do

end
