class Supplier::RetailersController < Supplier::ApplicationController
    def index
        @retailers = User.where(role: :retailer)
    end

    def new
        @retailer = User.new
    end

    def create
    end
end
