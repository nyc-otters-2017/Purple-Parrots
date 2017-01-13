get '/users' do
  erb :'/users/index'
end


get '/users/new' do
  if !current_user
    erb :'/users/new'
  else
    redirect '/'
  end
end


post '/users' do
  passwords_match?(params[:user][:password1], params[:user][:password2])
  if @password
    @user = User.new(email: params[:user][:email], password: @password)
    if @user.save
      session[:user_id] = @user.id
      erb :'/users/edit'
    else
      status 422
      error 422 do
        'You broke it'
      end
    end
  else
    erb :'/users/new'
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
  else
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
    status 422
    error 422 do
      'Unauthorized request'
    end
  end
end


put '/users/:id' do
  find_user(params[:id])
  if @user.update_attribute(:username, params[:username])
    email_hash(@user)
    erb :'/users/show'
  else
    @errors = @users.errors.full_messages
    erb :'users/edit'
  end
end





delete '/users/:id' do

end
