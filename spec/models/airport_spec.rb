require 'spec_helper'

describe Airport do
  it "gets created" do
    airport = Airport.create(:name => "SFO", :city => "San Francisco")
    airport = Airport.create(:name => "LAX", :city => "Los Angeles)


    expect(Airport.all).to include(airport)
  end

  it "needs a name" do
    airport = Airport.create(:city => "San Francisco")

    expect(Airport.all).not_to include(airport)
  end

  it "needs a city" do
    airport = Airport.create(:name => "SFO")

    expect(Airport.all).not_to include(airport)
  end

  it "adds a departing flight" do
    airport1 = Airport.create(:name => "SFO", :city => "San Francisco")
    airport2 = Airport.create(:name => "PHL", :city => "Philadelphia")

    flight = airport1.departing_flights.create(:departure_time => "2013/08/01 18:00:00", :destination_airport_id => airport2.id )

    expect(airport1.departing_flights).to include(flight)
  end

  it "adds an arriving flight" do
    airport1 = Airport.create(:name => "SFO", :city => "San Francisco")
    airport2 = Airport.create(:name => "PHL", :city => "Philadelphia")

    flight = airport1.arriving_flights.create(:departure_time => "2013/08/01 18:00:00", :origin_airport_id => airport2.id)

    expect(airport1.arriving_flights).to include(flight)
  end
end
