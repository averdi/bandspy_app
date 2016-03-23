class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :artist_id
      t.integer :venue_id
      t.string :datetime

      t.timestamps null: false
    end
  end
end
