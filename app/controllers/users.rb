get '/login' do

  erb :"users/login"
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/"
  else
    erb :"/users/login"
  end

end

get '/signup' do
  erb :"users/signup"
end

post '/signup' do
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :"users/signup"
  end
end

get '/logout' do
  session.clear
  redirect "/"
end
