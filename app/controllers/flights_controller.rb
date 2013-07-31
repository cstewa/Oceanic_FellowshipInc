class FlightsController < ApplicationController
  def show
    @flight = Flight.find(params[:id])
    @seating_chart = @flight.seating_chart
  end
end
