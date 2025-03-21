class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.datetime :created
      t.datetime :updated

      t.timestamps
    end
  end
end
