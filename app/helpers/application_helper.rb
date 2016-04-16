module ApplicationHelper
    def is_active_controller(controller_name)
        params[:controller] == controller_name ? 'active' : nil
    end

    def is_active_action(action_name)
        params[:action] == action_name ? 'active' : nil
    end

    def user_navigation(current_user)
        if current_user.admin?
            render 'layouts/admin_navigation'
        elsif current_user.retailer?
            render 'layouts/retailer_navigation'
        elsif current_user.supplier?
            render 'layouts/supplier_navigation'
        else
            render 'layouts/trucking_navigation'
        end
    end
end
