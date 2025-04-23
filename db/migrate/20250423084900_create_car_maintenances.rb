class CreateCarMaintenances < ActiveRecord::Migration[8.0]
  def change
    create_table :car_maintenances do |t|
      t.integer :car_id 
      t.string :maintenance_type 
      t.text :description 
      t.datetime :performed_at 
      t.datetime :created
      t.datetime :updated

      t.timestamps
    end
  end
end
