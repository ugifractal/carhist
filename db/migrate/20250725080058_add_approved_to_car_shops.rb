class AddApprovedToCarShops < ActiveRecord::Migration[8.0]
  def change
    add_column :car_shops, :approved, :boolean, default: false
  end
end
