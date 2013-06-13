class Country < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  attr_accessible :country_iata_code, :country_icao_code, :country_name, :country_number



  def self.search(search)
    if search
      where('country_name LIKE ?', "%#{search}%")
    else
      find(:all)
    end
  end
end
