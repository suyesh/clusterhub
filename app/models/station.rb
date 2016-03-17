class Station < ActiveRecord::Base
  belongs_to :retailer, class_name: "User"
  has_many :tanks, dependent: :destroy
end
