class ConnectionSupplier < ActiveRecord::Base
    belongs_to :user
    belongs_to :supplier, class_name: 'User'

    enum status: [:pending, :approved, :denied]
end
