# encoding: UTF-8
class RwRoute < ActiveRecord::Base
cattr_reader :per_page
@@per_page = 10
  attr_accessible :end_route, :start_route
end

