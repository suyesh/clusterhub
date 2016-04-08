class CreatePricerockets < ActiveRecord::Migration
  def change
    create_table :pricerockets do |t|
      t.integer :supplier_id
      t.string :to
      t.text :body
      t.timestamps null: false
    end
  end
end
