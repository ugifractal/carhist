class AddCompanyIdToCarModels < ActiveRecord::Migration[8.0]
  def change
    add_column :car_models, :company, :string
  end
end
