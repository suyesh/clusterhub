module Admin::DashboardHelper
    def user_full_name(user)
        full_name = user.first_name + ' ' + user.last_name
        full_name
    end
end
