class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.references :user
      t.integer :row_number
      t.string :seat_letter
      t.references :flight
      t.string :itinerary_id

      t.timestamps
    end
    add_index :seats, :user_id
    add_index :seats, :flight_id
  end
end
