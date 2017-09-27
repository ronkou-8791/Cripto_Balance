class AddAmountsToShares < ActiveRecord::Migration[5.1]
  def change
    add_column :shares, :amount, :integer
  end
end
