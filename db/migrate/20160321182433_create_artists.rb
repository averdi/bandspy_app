class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.boolean :on_tour

      t.timestamps null: false
    end
  end
end
