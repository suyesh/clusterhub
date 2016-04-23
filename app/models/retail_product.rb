class RetailProduct < ActiveRecord::Base
  validates :fuel, presence: true
  validates :price, numericality: true
  belongs_to :retail_price
end
