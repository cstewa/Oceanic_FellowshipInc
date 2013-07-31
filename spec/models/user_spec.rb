require 'spec_helper'

describe User do
  before do
    @user = User.create(
      :email => 'boarding@now.com',
      :password => 'run',
      :password_confirmation => 'run',
      :is_admin => false,
      :is_registered => false
      )
  end

  it "gets created" do
    expect(User.all).to include(@user)
  end

  it "has a seat and flight through seat" do
    flight = Flight.create(
      :departure_time => Time.now,
      :origin_airport_id => Airport.create(:name => "SFO", :city => "San Francisco").id,
      :destination_airport_id => Airport.create(:name => "PHL", :city => "Philadelphia").id
      )
    seat = @user.seats.create(
      # :user_id => @user.id,
      :seat_letter => 'A',
      :row_number => '1',
      :flight_id => flight.id
      )
    expect(@user.seats).to include(seat)
    expect(@user.flights).to include(flight)
  end

end
