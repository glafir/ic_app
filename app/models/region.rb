# encoding: UTF-8
class Region < ActiveRecord::Base
cattr_reader :per_page
@@per_page = 10
  attr_accessible :area, :capital_state, :code, :name, :pop_state
end

