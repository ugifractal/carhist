class RemoveUserIdFromCarShops < ActiveRecord::Migration[8.0]
  def change
    remove_column :car_shops, :user_id, :integer
  end
end
