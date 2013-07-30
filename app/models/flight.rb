class Flight < ActiveRecord::Base
  attr_accessible :departure_time, :destination_airport_id, :origin_airport_id

  belongs_to :origin_airport, :class_name => 'Airport'
  belongs_to :destination_airport, :class_name => 'Airport'
  has_many :seats
  has_many :users, :through => :seats

  validates_presence_of :destination_airport_id, :origin_airport_id, :departure_time

end
