class AddKeyDigest < ActiveRecord::Migration[8.0]
  def change
    add_column :api_keys, :key_digest, :string
  end
end
