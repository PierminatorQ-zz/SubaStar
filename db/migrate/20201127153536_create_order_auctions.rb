class CreateOrderAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_auctions do |t|
      t.integer :price
      t.references :order, foreign_key: true
      t.references :auction, foreign_key: true

      t.timestamps
    end
  end
end
