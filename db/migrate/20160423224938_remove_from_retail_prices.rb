class RemoveFromRetailPrices < ActiveRecord::Migration
  def change
    remove_column :retail_prices, :fuel
    remove_column :retail_prices, :price
  end
end
