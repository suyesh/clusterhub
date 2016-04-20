class ConnectionRetailer < ActiveRecord::Base
  belongs_to :retailer, class_name: "User"
  belongs_to :user

  enum status: [:pending, :approved, :denied]
end
