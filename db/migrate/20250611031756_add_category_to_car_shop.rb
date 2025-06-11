class AddCategoryToCarShop < ActiveRecord::Migration[8.0]
  def change
    add_column :car_shops, :category, :string
  end
end
