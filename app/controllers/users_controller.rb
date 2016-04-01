class UsersController < ApplicationController
  before_action :set_twilio, only: [:create]
  layout 'static_application'
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @client.messages.create(
        from: '+18482299159',
        to: "+1#{@user.cell_number}",
        body: "Hey there! #{@user.first_name}. Thank you for signing up for  PetroHub. We will contact you shortly. If you have any questions please feel free to call us at 7329866193. thank you."
        )
      flash[:notice] = 'Thank you for Applying for PetroHub account. We are currently reviewing your application, which might take upto 24hrs.'
      redirect_to new_user_path
    else
      flash[:alert] = 'Oops! something went wrong. Please check your application and resubmit. Thank you.'
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :business_name, :phone_number, :cell_number, :street_address, :apt_suite, :city, :state, :zip_code, :tax_id, :ssn, :in_biz, :terms, :email, :password, :password_confirmation)
  end

  def set_twilio
    require "twilio-ruby"
    @client = Twilio::REST::Client.new ENV["twilio_account_sid"], ENV["twilio_auth_token"]
  end
end
