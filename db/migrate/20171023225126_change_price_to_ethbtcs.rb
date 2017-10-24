class ChangePriceToEthbtcs < ActiveRecord::Migration[5.1]
  def up
    change_column :Ethbtcs, :price, :decimal, precision: 9, scale: 8
  end

  #変更前の型
  def down
    change_column :Ethbtcs, :price, :intger
  end
end
