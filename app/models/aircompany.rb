class Aircompany < ActiveRecord::Base
  belongs_to :airport
  has_many :timetableaps
  has_many :timetableap_flights
  cattr_reader :per_page
  @@per_page = 20
  attr_accessible :AP_hubs, :AWB_prefix, :Airline_name_eng, :Airline_name_rus, :airport_id, :Country, :IATA_code, :ICAO_code
end
