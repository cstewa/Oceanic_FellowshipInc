class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.references :user
      t.boolean :roundtrip
      t.boolean :multi_city

      t.timestamps
    end
    add_index :itineraries, :user_id
  end
end
