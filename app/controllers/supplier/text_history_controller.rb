class Supplier::TextHistoryController < Supplier::ApplicationController
    def index
        @texts = current_user.pricerockets.all.order('created_at DESC')
    end
end
