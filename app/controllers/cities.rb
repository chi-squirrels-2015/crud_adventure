get "/cities" do
  @cities = City.all

  erb :"/cities/index"

end

get '/cities/:id' do
  @city = City.find(params[:id])

  erb :"cities/show"

end
