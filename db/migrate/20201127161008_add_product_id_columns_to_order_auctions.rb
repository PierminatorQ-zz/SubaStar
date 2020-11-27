class AddProductIdColumnsToOrderAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :order_auctions, :product_id, :integer
  end
end
