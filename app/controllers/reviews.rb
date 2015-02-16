# get '/cities/:city_id/restaurants/:restaurant_id/reviews/new' do
# post '/cities/:city_id/restaurants/:restaurant_id/reviews' do

get '/restaurants/:restaurant_id/reviews/new' do
  redirect "/login" unless current_user

  @restaurant = Restaurant.find_by_id(params[:restaurant_id])
  erb :"/reviews/new"
end

post '/restaurants/:restaurant_id/reviews' do
  redirect "/login" unless current_user

  @restaurant = Restaurant.find_by_id(params[:restaurant_id])

  @review = Review.create(params[:review].merge(user: current_user, restaurant: @restaurant))

  # @review = Review.new(params[:review])
  # @review.user = current_user
  # @review.restaurant = @restaurant
  # @review.save

  erb :"/restaurants/show"
end
