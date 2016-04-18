class CreateFuelFormulas < ActiveRecord::Migration
  def change
    create_table :fuel_formulas do |t|
      t.string :fuel
      t.decimal :margin
      t.integer :retailer_id
      t.timestamps null: false
    end
  end
end
