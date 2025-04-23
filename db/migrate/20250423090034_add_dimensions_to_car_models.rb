class AddDimensionsToCarModels < ActiveRecord::Migration[8.0]
  def change
    add_column :car_models, :overall_width, :integer
    add_column :car_models, :overall_height, :integer
    add_column :car_models, :overall_length, :integer
    add_column :car_models, :wheelbase, :integer
    add_column :car_models, :tank_capacity, :integer
  end
end
