class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.integer :origin_airport_id
      t.integer :destination_airport_id

      t.timestamps
    end
  end
end
