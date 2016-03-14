require "rails_helper"


RSpec.feature "Users can sign In" do

  scenario "With Valid attributes" do
    #User should be able to sign in.
    #User should be redirected to their respective dashboard:-
      #=> If retailer, Retailer dashboard
      #=> If Supplier, Supplier dashboard
      #=> If Trucking, Trucking dashboard
      #=> If Admin, Admin Dashboard
    #User should not be able to login:-
      #=> If their account has not been approved by Admin, should have active status
      #=> If their account has Inactive status
      #=> If their account has Denied or pending status.
    #The root of Users should be based on user type:-
      #=> Admin should be application root of admin namespace
      #=> Retailer should be application root of retailer namespace
      #=> Supplier should be application root of supplier namespace
      #=> Trucking should be application root of trucking namespace
  end

  scenario "With Invalid attributes" do
  end

end
