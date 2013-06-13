class CreateAircraftWakeCategories < ActiveRecord::Migration
  def change
    create_table :aircraft_wake_categories do |t|
      t.string :category

      t.timestamps
    end
  end
end
