class ModConnectionRetailers < ActiveRecord::Migration
  def change
    remove_column :connection_retailers, :supplier_id, :integer
    add_column :connection_retailers, :user_id, :integer
    remove_column :connection_suppliers, :retailer_id, :integer
    add_column :connection_suppliers, :user_id, :integer
  end
end
