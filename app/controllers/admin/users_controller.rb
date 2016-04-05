class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :set_slack, only: [:update]
  before_action :set_twilio, only: [:update]

  def index
    @users = User.order(:status)
    # filter by pending (those who didn't activate the account yet)
    # filter by Email
    # https://github.com/activerecord-hackery/ransack
  end

  def edit
  end

  def update
    if @user.update(user_params)

      if @user.retailer? && @user.active?
        @client.messages.create(
          from: '+18482299159',
          to: "+1#{@user.cell_number}",
          body: "Hey there! #{@user.first_name}. Petrohub just approved your account as a Retailer. You can now login with your email #{@user.email} and follow your suppliers for their daily pricing and much more. Thank you for being a part of Petrohub."
        )
        @slack.chat_postMessage(channel: '#admin_activities', text: "#{current_user.first_name} just approved application for #{@user.first_name} from #{@user.business_name} as Retailer.", as_user: true)
        flash[:notice] = 'You have successfully updated the application.'
        redirect_to admin_retailers_path
      elsif @user.supplier? && @user.active?
        @client.messages.create(
          from: '+18482299159',
          to: "+1#{@user.cell_number}",
          body: "Hey there! #{@user.first_name}. Petrohub just approved your account as a Supplier. You can now login with your email #{@user.email} and follow your retailers and send them daily pricing and much more.. Thank you for being a part of Petrohub."
        )
        @slack.chat_postMessage(channel: '#admin_activities', text: "#{current_user.first_name} just approved application for #{@user.first_name} from #{@user.business_name} as Supplier.", as_user: true)
        flash[:notice] = 'You have successfully updated the application.'
        redirect_to admin_suppliers_path
      elsif @user.trucking? && @user.active?
        @client.messages.create(
          from: '+18482299159',
          to: "+1#{@user.cell_number}",
          body: "Hey there! #{@user.first_name}. Petrohub just approved your account as Trucking Provider. Expect and email from us with futhur details."
        )
        @slack.chat_postMessage(channel: '#admin_activities', text: "#{current_user.first_name} just approved application for #{@user.first_name} from #{@user.business_name} as Trucking provider.", as_user: true)
        flash[:notice] = 'You have successfully updated the application.'
        redirect_to admin_truckings_path
      elsif @user.denied?
        @client.messages.create(
          from: '+18482299159',
          to: "+1#{@user.cell_number}",
          body: "Hey there! #{@user.first_name}. Unfortunately Petrohub was unable to approve your account. You can now login with your email #{@user.email} and follow your suppliers for their daily pricing and much more. Thank you for being a part of Petrohub."
        )
        @slack.chat_postMessage(channel: '#admin_activities', text: "#{current_user.first_name} just Denied application for #{@user.first_name} from #{@user.business_name}.", as_user: true)
        flash[:notice] = 'You have successfully updated the application.'
        redirect_to admin_dashboard_path
      else
        flash[:notice] = "User was modified but no action was taken because user is still #{@user.status}."
        redirect_to admin_dashboard_path
      end
    else
      flash.now[:alert] = 'Something went wrong. Please try again.'
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_slack
    require 'slack-ruby-client'
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end
    @slack = Slack::Web::Client.new
  end

  def set_twilio
    require 'twilio-ruby'
    @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :business_name, :phone_number, :cell_number, :street_address, :apt_suite, :city, :state, :zip_code,:in_biz, :terms,:role, :status, :email, :password, :password_confirmation)
  end
end
