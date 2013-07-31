class AirportsController < ApplicationController
  def index
    @origin_airports = Airport.all.map{|x| x.departing_flights}.flatten
  end
end