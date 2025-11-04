class AddAddressToCarSells < ActiveRecord::Migration[8.1]
  def change
    add_column :car_sells, :province_id, :integer
    add_column :car_sells, :regency_id, :integer
    add_column :car_sells, :district_id, :integer
    add_column :car_sells, :village_id, :integer
  end
end
