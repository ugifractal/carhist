class RenameApprovedToApprovedAtInCarShops < ActiveRecord::Migration[8.0]
  def change
    rename_column :car_shops, :approved, :approved_at
  end
end
