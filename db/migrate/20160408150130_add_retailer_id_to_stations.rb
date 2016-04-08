class AddRetailerIdToStations < ActiveRecord::Migration
  def change
    add_column :stations, :retailer_id, :integer
  end
end
