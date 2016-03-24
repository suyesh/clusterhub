class CreateFuelPrices < ActiveRecord::Migration
  def change
    create_table :fuel_prices do |t|
      t.decimal :regular
      t.decimal :medium
      t.decimal :premium
      t.decimal :diesel
      t.integer :supplier_id

      t.timestamps null: false
    end
  end
end
