class Admin::ApplicationController < LoginrequiredController
    before_action :authenticate_admin!

    def index
    end

    private

    def dashboard_path
        if current_user.retailer?
            retailer_dashboard_path
        elsif current_user.supplier?
            supplier_dashboard_path
        elsif current_user.trucking?
            trucking_dashboard_path
        end
    end

    def authenticate_admin!
        unless current_user.admin?
            redirect_to dashboard_path, alert: 'You are not authorized to access that section.'
        end
    end
end
