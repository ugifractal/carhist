class AddIndexToCarSells < ActiveRecord::Migration[8.1]
  def change
    add_index :car_sells, :token
    change_column_null :car_sells, :token, false
  end
end
