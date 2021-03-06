Oceanic::Application.routes.draw do
  get "planes/show"

  get "login/:flight_id" => 'user_sessions#new'
  match 'login' => 'user_sessions#new', :as => :login

  get "/create_user/:flight_id" => 'users#new'
  match 'logout' => 'user_sessions#destroy', :as => :logout

  get "/guest_user/:flight_id" => 'users#guest_signup'

  get 'purchase/:flight_id' => 'users#purchase', :as => :purchase
  post 'save_purchase' => 'users#save_purchase', :as => :save_purchase

  get 'start_roundtrip/:flight_id' => 'users#start_roundtrip', :as => :start_roundtrip
  post 'save_roundtrip' => 'users#save_roundtrip', :as => :save_roundtrip
  get 'go_roundtrip/:origin_airport_id/:destination_airport_id' => 'airports#destination_airport', :as => :go_roundtrip


  get 'start_multicity/:flight_id' =>  'users#multicity', :as  => :start_multicity

  get "airports/index"

  get "/admin" => 'users#admin'

  post "selected_flight" => 'airports#selected_flight'
  get "/departing_flights/:id" => 'airports#departing_flights', :as => 'multi_trip'
  get "/destination_airport/:origin_airport_id/:destination_airport_id" => 'airports#destination_airport', :as => 'round_trip'

  resources :users
  resources :flights
  resources :user_sessions, :except => [:index, :show, :edit, :update]
  resources :planes

  root :to => 'airports#index'

end
