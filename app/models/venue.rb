class Venue < ActiveRecord::Base
  has_many :events
  has_many :users, through: :user_venues
end
