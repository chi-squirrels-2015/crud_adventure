get '/' do

  erb :index
end

post '/' do

  redirect '/users'
end

get '/users' do

  erb :"users/index"

end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    redirect "/users"
  else
    erb :"users/new"
  end
end






get 'logout' do


end
