# encoding: UTF-8
class RwTypestation < ActiveRecord::Base
has_many :rw_stations
cattr_reader :per_page
@@per_page = 10
  attr_accessible :typestation_name
end

