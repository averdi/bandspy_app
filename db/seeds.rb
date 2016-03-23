# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 Bandsintown.app_id = 'bandspy'


artists = ["The Cramps", "The Beatles", "Adele"]

artists.each do |artist_name|
  artist = Bandsintown::Artist.new({
  :name => artist_name
    })
  Artist.create(name: artist.name, on_tour: true)
end

