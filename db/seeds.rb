# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

airports = Airport.create([
  {name: "SFO", city: "San Francisco"},
  {name: "Denver International", city: "Denver"},
  {name: "JFK", city: "NYC"},
  {name: "LAX", city: "Los Angeles"},
  {name: "La Guardia", city: "NYC"},
  {name: "San Jose International", city: "San Jose"},
  {name: "Santa Barbara", city: "Santa Barbara"},
  {name: "Philadelphia International", city: "Philadelphia"}
])

airports.each do |airport|
  airport.departing_flights.create([
    {:destination_airport_id => 3, :departure_time => rand(1.month).from_now},
    {:destination_airport_id => 4, :departure_time => rand(1.month).from_now},
    {:destination_airport_id => 2, :departure_time => rand(1.month).from_now},
    {:destination_airport_id => 7, :departure_time => rand(1.month).from_now}
  ])
end

airports.each do |airport|
  airport.arriving_flights.create([
    {:origin_airport_id => 1, :departure_time => rand(1.month).from_now},
    {:origin_airport_id => 5, :departure_time => rand(1.month).from_now},
    {:origin_airport_id => 3, :departure_time => rand(1.month).from_now},
    {:origin_airport_id => 6, :departure_time => rand(1.month).from_now},
    {:origin_airport_id => 2, :departure_time => rand(1.month).from_now}
  ])
end

rows = (1..20).to_a
letters = ["A", "B", "C", "D", "E", "F"]

Flight.all.each do |flight|
  rows.each do |row|
    letters.each do |letter|
      flight.seats.create(
        :row_number => row,
        :seat_letter => letter
      )
    end
  end
end