class CarShop < ActiveRecord::Migration[8.0]
  def change
    create_table :car_shops do |t|
      t.string :name
      t.string :address
      t.string :google_map_url
      t.boolean :approved, default: false
      t.jsonb :submitted_by, default: {}
      t.text :description
      t.timestamps
    end
  end
end
