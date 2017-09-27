class AddPurchasesToGains < ActiveRecord::Migration[5.1]
  def change
    add_column :gains, :purchase, :datetime
  end
end
