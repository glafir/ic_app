class CreateAircraftCompanies < ActiveRecord::Migration
  def change
    create_table :aircraft_companies do |t|
      t.string :aircraft_company

      t.timestamps
    end
  end
end
