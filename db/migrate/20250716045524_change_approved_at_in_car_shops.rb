class ChangeApprovedAtInCarShops < ActiveRecord::Migration[8.0]
  def up
    change_column :car_shops, :approved_at, :datetime, using: 'NULL'
  end

  def down
    change_column :car_shops, :approved_at, :boolean
  end
end
