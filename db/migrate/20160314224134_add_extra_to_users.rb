class AddExtraToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :business_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :cell_number, :string
    add_column :users, :street_address, :string
    add_column :users, :apt_suite, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
    add_column :users, :tax_id, :string
    add_column :users, :ssn, :string
    add_column :users, :account_number, :string
    add_column :users, :in_biz, :string
    add_column :users, :role, :integer, default: 0
    add_column :users, :status, :integer, default: 0
    add_index :users, :tax_id, unique: true
    add_index :users, :ssn, unique: true
    add_index :users, :account_number, unique: true
  end
end
