class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :order_number
      t.decimal :price, scale: 2, precision: 12
      t.string :status, default: "pending"
      t.timestamps
    end
  end
end
