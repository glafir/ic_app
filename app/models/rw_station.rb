# encoding: UTF-8
class RwStation < ActiveRecord::Base
belongs_to :rw_typestation
cattr_reader :per_page
@@per_page = 100
  attr_accessible :rw_zone, :name_eng, :name_rus, :rw_typestation_id, :rw_route_id
end

