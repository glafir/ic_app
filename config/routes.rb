IcApp::Application.routes.draw do
  resources :flight_types

  resources :aircraft_companies

  resources :aircraft_wake_categories

  resources :aircraft_types

  resources :aircrafts

  resources :countries

  resources :runway_aps
  get "/runway_aps/:id/calendar/" => "runway_aps#runway_calendar"
  get "/runway_aps/:id/:date" => "runway_aps#rasp_runway_day"
  resources :timetablesap_flights
  get "/timetablesap_flight/form" => "timetablesap_flights#form"
  get "/some" => "timetablesap_flights#some"
  post "/timetablesap_flight/form" => "timetablesap_flights#form_enter"
  resources :rw_typestations


  resources :rw_routes


  resources :rw_stations


  devise_for :users
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
	get "/logout", :to => "devise/sessions#destroy"
    delete "/logout", :to => "devise/sessions#destroy"
  end
  resources :towns

  resources :zones_stations

  resources :regions

  resources :timetableap_fordays

  get "tablo/index"

  resources :timetableaps
  
  resources :aircompanies

  root :to => "general#air"
  resources :airports
  get "/airports/:id/tablo_out" => "airports#tablo_out"
  get "/airports/:id/tablo_in" => "airports#tablo_in"
  get "/search/airlines" => "airports#search_airlines"
  get "/search" => "airports#search"
  post "/search" => "airports#search"
  get "general/rw"
  get "general/air"
  get "general/help"  
  get "general/home"
  get "/general" => "general#home"
  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "airpots/city"
  get "airpots/city/:city_eng" => "airports#city"
  get "/tablo" => "tablo#index"
  get "tablo/:id" => "tablo#index"
  get "insertdata" => "timetableaps#insert"
end
