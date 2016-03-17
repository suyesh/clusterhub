require "rails_helper"


RSpec.feature "Users can sign In" do

   user = User.create(
   first_name: "John",
   last_name: "Doe",
   business_name: "ACME inc",
   phone_number: "2128456789",
   cell_number: "2123456789",
   street_address: "81 updown st",
   apt_suite: "35",
   city: "New York",
   state: "New York",
   zip_code: "11367",
   tax_id: "223103456",
   ssn: "23456789",
   in_biz: "3",
   email: "apple@yahoo.com",
   password: "password",
   terms: 1)

   before do
     visit "/"
     click_link "Log In"
   end

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
      expect(page.current_url).to eq login_url

      fill_in "Email", with: user.email
      fill_in "user_password", with: "password"
      click_button "Log In"

      if user.role? == :retailer && user.status? == :active
        expect(page.current_url).to eq retailer_dashboard_url
      elsif user.role? == :supplier && user.status? == :active
        expect(page.current_url).to eq supplier_dashboard_url
      elsif user.role? == :trucking && user.status? == :active
        expect(page.current_url).to eq trucking_dashboard_url
      elsif user.role? == :admin && user.status? == :active
        expect(page.current_url).to eq admin_dashboard_url
      elsif user.role? == :pending && user.status? != :active
        expect(page.current_url).to eq login_url
        expect(page).to have_content "We are currently reviewing your application. Please contact Petrohub if you have furthur questions."
      elsif user.role? == :retailer || user.role? == :supplier || user.role? == :trucking && user.status? != :active
        expect(page.current_url).to eq login_url
        expect(page).to have_content "Your account is not active. Please contact us for access."
      else
        expect(page.current_url).to eq login_url
        expect(page).to have_content "Something went wrong while we tried to access your account. Please verify your Email and Password and try again."
      end
  end

  scenario "With Invalid attributes" do
  end

end
