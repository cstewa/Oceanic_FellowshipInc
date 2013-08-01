class Itinerary < ActiveRecord::Base
  belongs_to :user
  attr_accessible :multi_city, :roundtrip
  has_many :flights
  has_many :seats
end
