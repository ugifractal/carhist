class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :plan, default: "free"
      t.datetime :paid_until
      t.timestamps
    end
    add_column :users, :company_id, :integer
    add_column :users, :owner, :boolean, default: false
  end
end
