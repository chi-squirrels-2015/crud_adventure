class Restaurant < ActiveRecord::Base
  belongs_to :city
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user
end
