class CreateCarFuelings < ActiveRecord::Migration[8.0]
  def change
    create_table :car_fuelings do |t|
      t.integer :car_id
      t.datetime :filled_at
      t.integer :price
      t.integer :km
      t.integer :ron_number
      t.string :location
      t.integer :fuel_range
      t.timestamps
    end
  end
end
