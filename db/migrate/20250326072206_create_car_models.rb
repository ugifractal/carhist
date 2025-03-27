class CreateCarModels < ActiveRecord::Migration[8.0]
  def change
    create_table :car_models do |t|
      t.string :model
      t.integer :year
      t.datetime :created
      t.datetime :updated
      t.integer :car_brand_id

      t.timestamps
    end
  end
end
