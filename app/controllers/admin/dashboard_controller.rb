class Admin::DashboardController < Admin::ApplicationController

  def index
      @users = User.all.order(:status)
  end
end
