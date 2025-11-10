class AddTokenToCarSells < ActiveRecord::Migration[8.1]
  def change
    add_column :car_sells, :token, :string
  end
end
