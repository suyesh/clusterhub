class AddMoreToRetailPrices < ActiveRecord::Migration
  def change
    add_column :retail_prices, :retailer_id, :integer
    add_column :retail_prices, :fuel, :string
    add_column :retail_prices, :price, :decimal
  end
end
