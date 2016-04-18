class FuelFormula < ActiveRecord::Base
    validates :fuel, presence: true
    validates :margin, numericality: true
    belongs_to :retailer
end
