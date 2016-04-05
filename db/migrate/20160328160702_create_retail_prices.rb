class CreateRetailPrices < ActiveRecord::Migration
  def change
    create_table :retail_prices do |t|
      t.decimal :r_regular
      t.decimal :r_medium
      t.decimal :r_premium
      t.decimal :r_diesel
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
