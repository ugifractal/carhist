class BackfillCarSellsToken < ActiveRecord::Migration[8.1]
  def change
    CarSell.where(token: nil).find_each do |cs|
      cs.update!(token: SecureRandom.hex(5))
    end
  end
end
