class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :aircraft_model
      t.string :aircraft_icao_code
      t.string :aircraft_iata_code
      t.integer :aircraft_seats
      t.integer :aircraft_wake_category_id
      t.string :aircraft_webinfo
      t.integer :aircraft_type_id
      t.integer :aircraft_maxspeed

      t.timestamps
    end
  end
end
