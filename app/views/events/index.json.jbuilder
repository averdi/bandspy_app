json.array!(@events) do |event|
  json.extract! event, :id, :artist_id, :venue_id, :datetime
  json.url event_url(event, format: :json)
end
