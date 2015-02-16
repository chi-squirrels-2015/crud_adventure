chicago = City.create!(name: "Chicago")

gabi = User.create!(name: "Gabi", email: "gabi@dbc.com", password: "1234")
andrew = User.create!(name: "Andrew", email: "andrew@dbc.com", password: "1234")

italian = Restaurant.create!(name: "Mama Mia!!", city: chicago)
french = Restaurant.create!(name: "Mon Mere", city: chicago)
mexican = Restaurant.create!(name: "Mi Madre", city: chicago)
korean = Restaurant.create!(name: "Ileol Suga", city: chicago)
swedish = Restaurant.create!(name: "Milde", city: chicago)

Review.create!(user: gabi, restaurant: italian, title: "Best f00D eva!", content: "Food was great!", rating: 5)
Review.create!(user: gabi, restaurant: french, title: "Pretty good", content: "Food was great!", rating: 4)
Review.create!(user: gabi, restaurant: korean, title: "Horrible", content: "Food was great!", rating: 1)
Review.create!(user: gabi, restaurant: mexican, title: "Awesome", content: "Food was great!", rating: 4)
Review.create!(user: gabi, restaurant: swedish, title: "Most terrible", content: "Food was great!", rating: 2)
Review.create!(user: gabi, restaurant: italian, title: "Best f00D eva! FOR REALZ", content: "Even better than the last time I went", rating: 5)
Review.create!(user: andrew, restaurant: italian, title: "Awesomesauce", content: "Food was great!", rating: 5)
Review.create!(user: andrew, restaurant: mexican, title: "Greatest f00D eva!", content: "Food was great!", rating: 5)
Review.create!(user: andrew, restaurant: swedish, title: "Deliciousness", content: "Food was great!", rating: 4)
Review.create!(user: andrew, restaurant: french, title: "Deliciousness squared", content: "Food was great!", rating: 5)
Review.create!(user: andrew, restaurant: french, title: "Great food", content: "Food was great!", rating: 5)
Review.create!(user: andrew, restaurant: swedish, title: "Awesomeness!", content: "Great service", rating: 5)

# Create average rating per restaurant
restaurants = Restaurant.all
restaurants.each do |restaurant|
  sum = 0
  restaurant.reviews.each do |review|
    sum += review.rating
  end
  restaurant.average_rating = sum / restaurant.reviews.count
  restaurant.save
end
