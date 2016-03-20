class SessionsController < ApplicationController
  layout 'static_application'
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:session][:email], params[:session][:password])
      if @user.retailer? && @user.active?
        redirect_back_or_to(retailer_dashboard_path, notice: 'Login successful')
      elsif @user.supplier? && @user.active?
        redirect_back_or_to(supplier_dashboard_path, notice: 'Login successful')
      elsif @user.admin? && @user.active?
        redirect_back_or_to(admin_dashboard_path, notice: 'Login successful')
      elsif @user.trucking? && @user.active?
        redirect_back_or_to(trucking_dashboard_path, notice: 'Login successful')
      elsif @user.pending? && @user.inactive?
        redirect_to login_path, notice: 'We are currently reviewing your application. Please contact Petrohub if you have furthur questions.'
      elsif (@user.retailer? || @user.supplier? || @user.trucking? || @user.admin?) && !@user.active?
        redirect_to login_url, notice: 'Your account is not active. Please contact us for access.'
      end
    else
      flash[:alert] = 'Something went wrong while we tried to access your account. Please verify your Email and Password and try again.'
      redirect_to login_url
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: 'You have Succesfully Logged out.')
  end
end
