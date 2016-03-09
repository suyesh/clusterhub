class AddUserKindToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_kind, :integer, default: 0
  end
end
