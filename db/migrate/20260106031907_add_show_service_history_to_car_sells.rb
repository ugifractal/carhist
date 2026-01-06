class AddShowServiceHistoryToCarSells < ActiveRecord::Migration[8.1]
  def change
    add_column :car_sells, :show_service_history, :boolean, default: false
  end
end

