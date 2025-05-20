class CreateCarShops < ActiveRecord::Migration[8.0]
  def change
    create_table :car_shops do |t|
      t.string :name
      t.text :address
      t.string :google_map_url
      t.boolean :approved
      t.integer :submitted_by
      t.text :description

      t.timestamps
    end
  end
end
