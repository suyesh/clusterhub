class Connection < ActiveRecord::Base
  belongs_to :retailer, class_name: "User"
  belongs_to :supplier, class_name: "User"
end
