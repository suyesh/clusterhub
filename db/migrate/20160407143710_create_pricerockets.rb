class CreatePricerockets < ActiveRecord::Migration
  def change
    create_table :pricerockets do |t|
      t.string :texts

      t.timestamps null: false
    end
  end
end
