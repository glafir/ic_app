# encoding: UTF-8
class Town < ActiveRecord::Base
cattr_reader :per_page
@@per_page = 10
  attr_accessible :area, :date_found, :name, :pop
end

