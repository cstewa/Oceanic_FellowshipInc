require 'spec_helper'

describe Flight do
  it "gets created" do
    airport1 = Airport.create(:name => "SFO", :city => "San Francisco")
    airport2 = Airport.create(:name => "PHL", :city => "Philadelphia")

    flight = Flight.create(:departure_time => Time.now, :origin_airport_id => airport1.id, :destination_airport_id => airport2.id)
    expect(Flight.all).to include(flight)
  end

  it "needs a departure time" do
    airport1 = Airport.create(:name => "SFO", :city => "San Francisco")
    airport2 = Airport.create(:name => "PHL", :city => "Philadelphia")
    flight = Flight.create(:origin_airport_id => airport1.id, :destination_airport_id => airport2.id)

    expect(Flight.all).not_to include(flight)
  end

  it "needs an origin airport" do
    airport2 = Airport.create(:name => "PHL", :city => "Philadelphia")
    flight = Flight.create(:departure_time => Time.now, :destination_airport_id => airport2.id)

    expect(Flight.all).not_to include(flight)
  end

  it "adds a destination airport" do
   airport1 = Airport.create(:name => "SFO", :city => "San Francisco")
   flight = Flight.create(:departure_time => Time.now, :origin_airport_id => airport1.id)

   expect(Flight.all).not_to include(flight)
  end

  it "can be added to an airport" do
    airport1 = Airport.create(:name => "SFO", :city => "San Francisco")

    flight = airport1.arriving_flights.create(:departure_time => "2013/08/01 18:00:00", :origin_airport_id => airport1.id)

    expect(airport1.arriving_flights).to include(flight)
  end


end
