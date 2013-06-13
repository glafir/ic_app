class CreateRunwayAps < ActiveRecord::Migration
  def change
    create_table :runway_aps do |t|
      t.integer :airport_id
      t.integer :runway_length
      t.integer :runway_elevation
      t.string :runway_data

      t.timestamps
    end
  end
end
