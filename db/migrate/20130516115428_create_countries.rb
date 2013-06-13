class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_name
      t.string :country_iata_code
      t.string :country_icao_code
      t.integer :country_number

      t.timestamps
    end
  end
end
