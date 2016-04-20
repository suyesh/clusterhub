class CreateConnectionSuppliers < ActiveRecord::Migration
  def change
    create_table :connection_suppliers do |t|
      t.integer :retailer_id
      t.integer :supplier_id
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
