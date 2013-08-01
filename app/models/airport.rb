class Airport < ActiveRecord::Base
  attr_accessible :city, :name, :latitude, :longitude

  has_many :departing_flights, :class_name => 'Flight', :foreign_key => 'origin_airport_id', :dependent => :destroy
  has_many :arriving_flights, :class_name => 'Flight', :foreign_key => 'destination_airport_id', :dependent => :destroy

  validates_presence_of :name, :city
end
