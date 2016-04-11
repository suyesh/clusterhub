class AddToPricerockets < ActiveRecord::Migration
  def change
    add_column :pricerockets, :status, :integer
  end
end
