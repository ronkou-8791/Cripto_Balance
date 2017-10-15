class CreateEthbtcs < ActiveRecord::Migration[5.1]
  def change
    create_table :ethbtcs do |t|
      t.datetime :buy
      t.integer :buy_size
      t.datetime :sell
      t.integer :sell_size
      t.integer :price

      t.timestamps
    end
  end
end
