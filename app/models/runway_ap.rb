class RunwayAp < ActiveRecord::Base
belongs_to :airport
  belongs_to :airport
  cattr_reader :per_page
  @@per_page = 100
  attr_accessible :airport_id, :runway_name,  :runway_data, :runway_elevation, :runway_length
end
