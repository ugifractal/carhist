class RemoveUserIdFromCars < ActiveRecord::Migration[8.0]
  def change
    remove_column :cars, :user_id, :integer
  end
end
