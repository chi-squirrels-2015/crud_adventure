get '/cities/:city_id/restaurants/:restaurant_id/reviews/new' do
  @restaurant = Restaurant.find_by_id(params[:restaurant_id])
  erb :"/reviews/new"
end

post '/cities/:city_id/restaurants/:restaurant_id/reviews/new' do
  user = current_user if current_user
  @restaurant = Restaurant.find_by_id(params[:restaurant_id])
  Review.create(user: user, restaurant: @restaurant, title: params[:title], content: params[:content], rating: params[:rating])

  sum = 0
  @restaurant.reviews.each do |review|
    sum += review.rating
  end
  @restaurant.average_rating = sum / @restaurant.reviews.count
  @restaurant.save

  erb :"/restaurants/show"
end
