class SessionsController < ApplicationController
  layout 'static_application'
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(retailer_dashboard_path, notice: 'Login successful') if @user.role? == :retailer && @user.status? == :active
      redirect_back_or_to(supplier_dashboard_path, notice: 'Login successful') if @user.role? == :supplier && @user.status? == :active
      redirect_back_or_to(admin_dashboard_path, notice: 'Login successful') if @user.role? == :admin && @user.status? == :active
      redirect_back_or_to(trucking_dashboard_path, notice: 'Login successful') if @user.role? == :trucking && @user.status? == :active
      redirect_to login_path, notice: 'We are currently reviewing your application. Please contact Petrohub if you have furthur questions.' if @user.role? == :pending && @user.status? != :active
      redirect_to login_url, notice: 'Your account is not active. Please contact us for access.' if @user.role? == :retailer || @user.role? == :supplier || @user.role? == :trucking && @user.status? != :active
    else
      flash.now[:alert] = 'Something went wrong while we tried to access your account. Please verify your Email and Password and try again.'
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
