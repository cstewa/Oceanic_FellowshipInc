class FlightsItinerariesBridge < ActiveRecord::Migration
  def change
    create_table :flights_itineraries do |t|
      t.integer :flight_id
      t.integer :itinerary_id
    end
  end
end
