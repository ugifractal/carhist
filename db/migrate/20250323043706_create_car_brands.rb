class CreateCarBrands < ActiveRecord::Migration[8.0]
  def change
    create_table :car_brands do |t|
      t.string :name
      t.datetime :created
      t.datetime :updated
      t.timestamps
    end
  end
end
