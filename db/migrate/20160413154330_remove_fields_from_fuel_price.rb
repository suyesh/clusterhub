class RemoveFieldsFromFuelPrice < ActiveRecord::Migration
  def change
    remove_column :fuel_prices, :regular, :decimal
    remove_column :fuel_prices, :medium, :decimal
    remove_column :fuel_prices, :premium, :decimal
    remove_column :fuel_prices, :diesel, :decimal
  end
end
