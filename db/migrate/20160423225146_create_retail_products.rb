class CreateRetailProducts < ActiveRecord::Migration
  def change
    create_table :retail_products do |t|
      t.string :fuel
      t.decimal :price
      t.integer :retail_price_id
      t.timestamps null: false
    end
  end
end
