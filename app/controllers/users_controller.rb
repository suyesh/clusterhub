class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully. It might take upto 24 hours for Petrohub to approve your account. If you have any Questions, please email sales@petrohub.org"
      redirect_to root_path
    else
      flash.now[:alert] = "Oops! Something went wrong.Account could not be created. Please Check your info and resubmit"
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :crypted_password, :business_name, :phone_number, :cell_number,:tax_identification, :ssn, :address, :city, :zip_code, :state, :account_type, :y_in_biz, :account_number)
  end
end
