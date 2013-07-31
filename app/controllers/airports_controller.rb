class AirportsController < ApplicationController
  def index
    # @origin_airports = Airport.all.map{|x| x.departing_flights}.flatten.uniq{|x| x.origin_airport}
    @origin_airports = Airport.all.select{|x| x.departing_flights.length > 0}
  end

  def departing_flights
    @origin_airport = Airport.find(params[:id])
    departing_airports_ids = []
    departing_flights = @origin_airport.departing_flights
    departing_flights.each do |flight| departing_airports_ids <<  flight.destination_airport_id end
    @departing_airports = departing_airports_ids.map{|id| Airport.find(id)}.uniq{|x| x.name}

  end

  def destination_airport

  @destination_airport = Airport.find(params[:destination_airport_id])
  @origin_airport = Airport.find(params[:origin_airport_id])
  flight_times_ids = []
  @flight_times = Flight.where("destination_airport_id = ? AND origin_airport_id = ?", @destination_airport.id, @origin_airport.id )
  end

  def selected_flight
    @flight = Flight.find(params[:flight_id])
    redirect_to flight_path(@flight)
  end
end