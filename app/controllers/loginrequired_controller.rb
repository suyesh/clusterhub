class LoginrequiredController < ApplicationController
    before_action :not_authenticated!
    before_action :require_login

    private

    def not_authenticated!
        unless current_user
            redirect_to login_url, alert: 'You must be Logged in to Visit this page.'
        end
    end
end
