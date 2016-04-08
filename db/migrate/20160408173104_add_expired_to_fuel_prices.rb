class AddExpiredToFuelPrices < ActiveRecord::Migration
  def change
    add_column :fuel_prices, :expired, :boolean, default: false
  end
end
