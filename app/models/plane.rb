class Plane < ActiveRecord::Base
  attr_accessible :number
  has_many :flights
end
