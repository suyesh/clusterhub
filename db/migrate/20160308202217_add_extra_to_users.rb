class AddExtraToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :business_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :cell_number, :string
    add_column :users, :tax_identification, :string
    add_column :users, :ssn, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
    add_column :users, :state, :string
    add_column :users, :account_type, :string
    add_column :users, :y_in_biz, :string
    add_column :users, :account_number, :string
    add_index :users, :account_number, unique: true
    add_index :users, :ssn, unique: true
    add_index :users, :tax_identification, unique: true
  end
end
