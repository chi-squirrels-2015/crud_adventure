get '/cities/:city_id/restaurants/:restaurant_id' do
  @restaurant = Restaurant.find(params[:restaurant_id])

  erb :"restaurants/show"
end
