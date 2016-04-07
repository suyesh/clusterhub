class CreatePricerockets < ActiveRecord::Migration
  def change
    create_table :pricerockets do |t|
      t.integer :texts
      t.integer :supplier_id
      t.timestamps null: false
    end
  end
end
