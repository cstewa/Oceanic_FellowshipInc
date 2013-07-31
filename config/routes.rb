Oceanic::Application.routes.draw do

  post "selected_flight" => 'airports#selected_flight'
  get "/departing_flights/:id" => 'airports#departing_flights'
  get "/destination_airport/:origin_airport_id/:destination_airport_id" => 'airports#destination_airport'

  root :to => 'airports#index'

end
