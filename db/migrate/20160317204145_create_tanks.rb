class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :type_of_fuel
      t.string :size
      t.string :registration_id
      t.references :station, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
