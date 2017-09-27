class AddSellsToGains < ActiveRecord::Migration[5.1]
  def change
    add_column :gains, :sell, :datetime
  end
end
