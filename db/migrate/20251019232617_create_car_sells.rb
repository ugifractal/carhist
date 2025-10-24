class CreateCarSells < ActiveRecord::Migration[8.0]
  def change
    create_table :car_sells do |t|
      t.integer :car_id
      t.decimal :price, precision: 15, scale: 2
      t.string :status
      t.text :description
      t.timestamps
    end
  end
end
