class RemoveFormulaFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :c_regular, :decimal
    remove_column :contacts, :c_medium, :decimal
    remove_column :contacts, :c_premium, :decimal
    remove_column :contacts, :c_diesel, :decimal
    remove_column :contacts, :c_delivery, :decimal
  end
end
