class CreateHistoryImages < ActiveRecord::Migration[8.0]
  def change
    create_table :history_images do |t|
      t.integer :car_maintenance_id
      t.string :type
      t.string :title
      t.jsonb :image_data
      t.timestamps
    end
  end
end
