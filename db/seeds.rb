# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create airports
airports = Airport.create([
  {name: "SFO", city: "San Francisco", latitude: 37.61, longitude: -122.39},
  {name: "Denver International", city: "Denver", latitude: 39.84, longitude: -104.6},
  {name: "JFK", city: "NYC", latitude: 40.6, longitude: -73.7},
  {name: "LAX", city: "Los Angeles", latitude: 33.9, longitude: -118.4},
  {name: "La Guardia", city: "NYC", latitude: 40.77, longitude: -73.87},
  {name: "San Jose International", city: "San Jose", latitude: 37.36, longitude: -121.9},
  {name: "Santa Barbara", city: "Santa Barbara", latitude: 34.42, longitude: -119.83},
  {name: "Philadelphia International", city: "Philadelphia", latitude: 39.87, longitude: -75.24}
])
airports.each { |a| puts a.inspect }

# Create planes
planes_array = []
(1..airports.length**2).to_a.map{ |n| n*100000 }.each do |number|
  planes_array << {:number => number}
end
@planes = Plane.create(planes_array)
@planes.each { |p| puts p.inspect }

# Create first round of flights
@first_round = []
airports.each do |airport|
  (1..airports.length).to_a.each do |id|
    if airport.id != id
      airport.departing_flights.create(
        :destination_airport_id => id,
        :plane_id => @planes.shift.id,
        :departure_time => rand(1.day).from_now,
        :duration => (1..12).to_a.sample
      )
      @first_round << Flight.last
      puts Flight.last.inspect
    end
  end
end

# @first_round = []
# airports.each do |airport|
#   @airports_ids = []
#   (1..airports.length).to_a.each do |id|
#     if airport.id != id
#       @airports_ids << id
#     end
#   end
#   @airports_ids.each do |id|
#     airport.departing_flights.create(
#       :destination_airport_id => id,
#       :plane_id => @planes.shift.id,
#       :departure_time => rand(1.day).from_now
#     )
#     @first_round << Flight.last
#     puts Flight.last.inspect
#   end
# end



# Create second round of flights
@second_round = []
@first_round.each do |flight|
  @airports_ids = []
  (1..airports.length).to_a.each do |id|
    if flight.destination_airport_id != id
      @airports_ids << id
    end
  end
  Flight.create(
    :origin_airport_id => flight.destination_airport_id,
    :destination_airport_id => @airports_ids.sample,
    :plane_id => flight.plane_id,
    :departure_time => flight.departure_time + (flight.duration).hours + 3.hours
  )
  @second_round << Flight.last
  puts Flight.last.inspect
end

# Create third round of flights
@third_round = []
@second_round.each do |flight|
 @airports_ids = []
 (1..airports.length).to_a.each do |id|
   if flight.destination_airport_id != id
     @airports_ids << id
   end
 end
 Flight.create(
   :origin_airport_id => flight.destination_airport_id,
   :destination_airport_id => @airports_ids.sample,
   :plane_id => flight.plane_id,
   :departure_time => flight.departure_time + (flight.duration).hours + 3.hours
 )
 @third_round << Flight.last
 puts Flight.last.inspect
end

# Create seats
# rows = (1..15).to_a
# letters = ["A", "B", "C", "D", "E", "F"]

# Flight.all.each do |flight|
#   rows.each do |row|
#     letters.each do |letter|
#       flight.seats.create(
#         :row_number => row,
#         :seat_letter => letter
#       )
#       puts Seat.last.inspect
#     end
#   end
# end