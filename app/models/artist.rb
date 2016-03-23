class Artist < ActiveRecord::Base
  has_many :events

  def self.search(search)
    where("content LIKE ?", "%#{search}%")
  end

end
