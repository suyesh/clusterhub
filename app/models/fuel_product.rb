class FuelProduct < ActiveRecord::Base
    validates :fuel, presence: true
    validates :price, numericality: true
    belongs_to :fuel_price
end
