class CreateUserVenues < ActiveRecord::Migration
  def change
    create_table :user_venues do |t|
      t.integer :user_id
      t.integer :venue_id

      t.timestamps null: false
    end
  end
end
