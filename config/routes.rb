Oceanic::Application.routes.draw do
  get "planes/show"

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

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
