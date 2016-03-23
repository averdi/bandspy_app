class UserVenue < ActiveRecord::Base
  has_many :users
  has_many :venues
end
