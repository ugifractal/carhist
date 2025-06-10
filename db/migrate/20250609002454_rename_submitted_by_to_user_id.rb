class RenameSubmittedByToUserId < ActiveRecord::Migration[8.0]
  def change
    rename_column :car_shops, :submitted_by, :user_id
  end
end
