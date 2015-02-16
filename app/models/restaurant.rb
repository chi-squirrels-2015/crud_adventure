class Restaurant < ActiveRecord::Base
  belongs_to :city
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user

  def update_average
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end

    self.average_rating = sum / reviews.count
    self.save
  end
end
