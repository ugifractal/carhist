class AddCompanyIdToCars < ActiveRecord::Migration[8.0]
  def change
    add_reference :cars, :company
  end
end
