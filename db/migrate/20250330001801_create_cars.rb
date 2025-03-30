class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :name
      t.integer :year
      t.integer :car_model_id
      t.datetime :created
      t.datetime :updated

      t.timestamps
    end
  end
end
