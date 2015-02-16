get "/cities" do
  @cities = City.all

  erb :"/cities/index"

end

get '/cities/:city_id/restaurants' do
  @city = City.find(params[:city_id])

  erb :"cities/show"
end
