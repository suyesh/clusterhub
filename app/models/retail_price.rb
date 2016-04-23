class RetailPrice < ActiveRecord::Base
    belongs_to :retailer, class_name: 'User'
end
