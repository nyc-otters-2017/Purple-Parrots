get '/users' do
  erb :'/users/index'
end




get '/users/new' do
  # if current_user
  #   redirect '/'
  # else
    erb :'/users/new'
  # end
end




post '/users' do
  passwords_match?(params[:user][:password1], params[:user][:password2])
  if @password
    @user = User.new(email: params[:email], password: @password)
    if @user.save
      erb :"/users/edit"
    else
      ##error handling
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




get '/users/logout' do
  session.clear
  redirect '/users'
end




get '/users/:id' do
  find_user(params[:id])
  erb :'users/show'
end




get '/users/:id/edit' do
  find_user(params[:id])
  current_user
  # if @user.id == @current_user.id
    erb :'users/edit'
  # else
    ## unsure how to do this
  # end
end




put '/users/:id' do
  find_user(params[:id])
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
