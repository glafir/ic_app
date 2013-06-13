class CreateFlightTypes < ActiveRecord::Migration
  def change
    create_table :flight_types do |t|
      t.string :flight_type

      t.timestamps
    end
  end
end
