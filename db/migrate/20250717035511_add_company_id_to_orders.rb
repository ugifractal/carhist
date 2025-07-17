class AddCompanyIdToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :company_id, :integer
    add_column :orders, :midtrans_redirect_url, :string
    remove_column :users, :plan, :string
  end
end
