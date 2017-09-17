class CreateShares < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|
      t.datetime :create_at
      t.integer :coin
      t.integer :btcjpy

      t.timestamps
    end
  end
end
