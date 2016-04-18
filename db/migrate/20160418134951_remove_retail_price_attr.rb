class RemoveRetailPriceAttr < ActiveRecord::Migration
  def change
    remove_column :retail_prices, :r_regular, :decimal
    remove_column :retail_prices, :r_medium, :decimal
    remove_column :retail_prices, :r_premium, :decimal
    remove_column :retail_prices, :r_diesel, :decimal
    remove_column :retail_prices, :contact_id, :integer
  end
end
