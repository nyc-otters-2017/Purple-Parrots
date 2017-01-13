get '/users' do
  erb :'/users/index'
end


get '/users/new' do
  current_user
  if @current_user
    redirect '/'
  else
    erb :'/users/new'
  end
end


post '/users' do
  passwords_match?(params[:user][:password1], params[:user][:password2])
  if @password == nil
    @password_error = 'Please type in a valid email and matching passwords'
    erb :'/users/new'
  else
    @user = User.new(email: params[:user][:email], password: @password)
    if @user.save
      session[:user_id] = @user.id
      erb :'/users/edit'
    else
      @errors = @user.errors.full_messages
      erb :'/users/new'
    end
  end
end


get '/users/login' do
  if current_user
    redirect '/'
  else
    erb :'/users/login'
  end
end


post '/users/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  elsif !@user
    @errors = ['We could not log you in with that password and email']
  else
    @errors = @user.errors.full_messages
    erb :'users/login'
  end
end


get '/users/logout' do
  session.clear
  redirect '/users'
end


get '/users/:id' do
  find_user(params[:id])
  email_hash(@user)
  erb :'users/show'
end


get '/users/:id/edit' do
  @user = find_user(params[:id])
  @current_user = current_user
  if @user.id == @current_user.id
    erb :'users/edit'
  else
    @access_denied = 'That is not you. You do not have permission to do that'
    erb :'/users/index'
  end
end


put '/users/:id' do
  find_user(params[:id])
  if @user.update(params[:user])
    email_hash(@user)
    erb :'/users/show'
  else
    @errors = @user.errors.full_messages
    erb :'users/edit'
  end
end


delete '/users/:id' do

end
