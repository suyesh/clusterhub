class Pricerocket < ActiveRecord::Base
  belongs_to :supplier, class_name: "User"
end
