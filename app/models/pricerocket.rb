class Pricerocket < ActiveRecord::Base
    belongs_to :supplier, class_name: 'User'
    enum status: [:not_sent, :sent]
end
