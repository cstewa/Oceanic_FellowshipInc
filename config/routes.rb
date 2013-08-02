Oceanic::Application.routes.draw do
  get "planes/show"

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  get 'purchase/:flight_id' => 'users#purchase', :as => :purchase
  post 'save_purchase' => 'users#save_purchase', :as => :save_purchase

  get 'start_roundtrip/:flight_id' => 'users#roundtrip', :as => :start_roundtrip
  get 'start_multicity/:flight_id' =>  'users#multicity', :as  => :start_multicity

  get "airports/index"

  get "/admin" => 'users#admin'

  post "selected_flight" => 'airports#selected_flight'
  get "/departing_flights/:id" => 'airports#departing_flights'
  get "/destination_airport/:origin_airport_id/:destination_airport_id" => 'airports#destination_airport'

  resources :users
  resources :flights
  resources :user_sessions, :except => [:index, :show, :edit, :update]
  resources :planes

  root :to => 'airports#index'

end
