class Seat < ActiveRecord::Base
  attr_accessible :row_number, :seat_letter, :user_id, :flight_id

  belongs_to :user
  belongs_to :flight
end
