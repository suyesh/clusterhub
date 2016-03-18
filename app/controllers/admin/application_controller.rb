class Admin::ApplicationController < LoginrequiredController

  before_action :authenticate_admin!

  def index
  end

  private

  def authenticate_admin!
    if !current_user.admin?
      redirect_to login_path, notice: "You dont have permission to access this section."
    end
  end
end
