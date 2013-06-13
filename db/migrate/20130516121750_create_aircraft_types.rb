class CreateAircraftTypes < ActiveRecord::Migration
  def change
    create_table :aircraft_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
