require 'spec_helper'

describe Seat do
  before do
    @seat = Seat.create(
      :row_number => "1",
      :seat_letter => "A"
    )
  end

  it "gets created" do
    expect(Seat.all).to include(@seat)
  end

  it "has a flight" do
    @seat.flight = Flight.create(
      :departure_time => Time.now,
      :origin_airport_id => Airport.create(:name => "SFO", :city => "San Francisco").id,
      :destination_airport_id => Airport.create(:name => "PHL", :city => "Philadelphia").id
      )
    expect(@seat.flight.origin_airport.name).to eq("SFO")
  end

  it "has a user" do
    user = User.create(
      :email => 'boarding@now.com',
      :password => 'run',
      :password_confirmation => 'run',
      :is_admin => false,
      :is_registered => false
      )
    user.seats << @seat
    expect(@seat.user).to eq(user)
  end
end
