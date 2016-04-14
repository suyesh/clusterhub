class FuelPrice < ActiveRecord::Base
    validates :fuel_products, presence: true
    belongs_to :supplier, class_name: 'User'
    has_many :fuel_products
    accepts_nested_attributes_for :fuel_products, allow_destroy: true
end
