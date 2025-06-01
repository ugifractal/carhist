class AddNameToApiKey < ActiveRecord::Migration[8.0]
  def change
    add_column :api_keys, :name, :string
  end
end
