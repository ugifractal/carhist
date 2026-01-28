class AddDescriptionToHistoryImages < ActiveRecord::Migration[8.1]
  def change
    add_column :history_images, :description, :text
  end
end
