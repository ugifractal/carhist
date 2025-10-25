class UpdateApiKeysForCompany < ActiveRecord::Migration[8.0]
  def change
    remove_column :api_keys, :user_id, :integer
    add_column :api_keys, :company_id, :string
  end
end
