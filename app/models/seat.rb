class Seat < ActiveRecord::Base
  attr_accessible :row_number, :seat_letter, :user_id, :flight_id, :itinerary_id

  belongs_to :user
  belongs_to :flight
  belongs_to :itinerary
end
