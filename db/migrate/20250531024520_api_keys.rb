class ApiKeys < ActiveRecord::Migration[8.0]
  def change
    create_table :api_keys do |t|
      t.integer :user_id
      t.string :api_key

      t.timestamps
    end
  end
end
