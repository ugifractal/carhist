class AddLanguangeToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :languange, :string
  end
end
