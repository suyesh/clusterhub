class Supplier::ApplicationController < LoginrequiredController
    before_action :authenticate_supplier!

    private

    def dashboard_path
        if current_user.admin?
            admin_dashboard_path
        elsif current_user.retailer?
            retailer_dashboard_path
        elsif current_user.trucking?
            trucking_dashboard_path
        end
    end

    def authenticate_supplier!
        unless current_user.supplier?
            redirect_to dashboard_path, alert: 'You are not authorized to access that section.'
        end
    end
end
