class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activated.subject
  #
  def activated(user)
    @user= user
  end

  def fuel_price(supplier, retailers)
    retailers.each do |retailer|
    end
  end
end
