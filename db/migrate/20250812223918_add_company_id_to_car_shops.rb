class AddCompanyIdToCarShops < ActiveRecord::Migration[8.0]
  def change
    add_column :car_shops, :company_id, :string
  end
end
