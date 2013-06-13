class Airport < ActiveRecord::Base
  has_many :aircompanys
  has_many :runway_aps
  cattr_reader :per_page
  @@per_page = 10
  attr_accessible :Dist_to_town, :Terminals, :TerminalsColl, :city_eng, :city_rus, :email, :fax, :gmt_offset, :iata_code, :icao_code, :iso_code, :latitude, :longitude, :name_eng, :name_rus, :phone, :runnway_coll, :runway_elevation, :runway_length, :website



  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
