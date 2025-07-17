class AddCompanyIdToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :company_id, :integer
  end
end
