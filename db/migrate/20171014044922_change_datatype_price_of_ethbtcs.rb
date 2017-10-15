class ChangeDatatypePriceOfEthbtcs < ActiveRecord::Migration[5.1]
  def change
    change_column :ethbtcs, :price, :float
  end
end
