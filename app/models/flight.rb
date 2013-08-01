class Flight < ActiveRecord::Base
  attr_accessible :departure_time, :destination_airport_id, :origin_airport_id, :plane_id, :duration

  belongs_to :origin_airport, :class_name => 'Airport'
  belongs_to :destination_airport, :class_name => 'Airport'
  has_many :seats
  has_many :users, :through => :seats
  has_and_belongs_to_many :itineraries
  belongs_to :plane


  validates_presence_of :destination_airport_id, :origin_airport_id, :departure_time

  def seating_chart
    row_array = Flight.where(:id => self.id).joins(:seats).select("distinct seats.row_number").map {|s| s.row_number.to_i}.sort
    row_hash = {}
    row_array.each do |number|
      row_hash[number] = []
      Seat.where(:flight_id => 1, :row_number=> number).each do |seat|
        row_hash[number] << seat
      end
    end
    row_hash
  end

end