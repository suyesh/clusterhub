class RemoveUserIdFromStations < ActiveRecord::Migration
  def self.up
    remove_column :stations, :user_id
  end
end
