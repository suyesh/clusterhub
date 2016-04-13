class CreateFuelProducts < ActiveRecord::Migration
  def change
    create_table :fuel_products do |t|
      t.string :fuel
      t.decimal :price
      t.integer :fuel_price_id

      t.timestamps null: false
    end
  end
end
