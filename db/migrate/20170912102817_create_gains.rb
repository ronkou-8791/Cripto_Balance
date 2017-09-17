class CreateGains < ActiveRecord::Migration[5.1]
  def change
    create_table :gains do |t|
      t.integer :gain_price
      t.integer :purchase_price
      t.integer :currrent_price

      t.timestamps
    end
  end
end
