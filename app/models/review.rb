class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :rating, numericality: { greater_than: 0 }
  validates :rating, numericality: { less_than: 6 }

  after_create :update_restaurant_average

  def update_restaurant_average
    restaurant.update_average
  end
end
