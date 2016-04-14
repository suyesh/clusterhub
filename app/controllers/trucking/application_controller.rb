class Trucking::ApplicationController < LoginrequiredController
    before_action :authenticate_trucking!

    def index
    end

    private

    def dashboard_path
        if current_user.admin?
            admin_dashboard_path
        elsif current_user.retailer?
            retailer_dashboard_path
        elsif current_user.supplier?
            supplier_dashboard_path
        end
    end

    def authenticate_trucking!
        unless current_user.trucking?
            redirect_to dashboard_path, alert: 'You are not authorized to access that section.'
        end
    end
end
