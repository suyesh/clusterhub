class RetailPrice < ActiveRecord::Base
    belongs_to :retailer, class_name: 'User'
    has_many :retail_products
end
