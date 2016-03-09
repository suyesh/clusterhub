class AddAccountStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_status, :integer, default: 0
  end
end
