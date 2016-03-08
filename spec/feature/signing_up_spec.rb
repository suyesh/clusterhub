require "rails_helper"

RSpec.feature "Users can create Accounts" do
  before do
    visit "/"
    click_link "Sign up"
  end

  scenario "With valid attributes" do
    fill_in "First Name", with: "Suyesh"
    fill_in "Last Name", with: "Bhandari"
    fill_in "Email", with: "test@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    fill_in "Business Name", with: "Acme Retail Inc"
    fill_in "Phone Number", with: "3472817892"
    fill_in "Cell Number", with: "3472817892"
    fill_in "Tax ID", with: "1234567890"
    fill_in "SSN #", with: "2222"
    fill_in "Street Address", with: "3416 99 st"
    fill_in "Zip Code", with: "11234"
    fill_in "City", with: "New York"
    select('New York', :from => 'State')
    select("Retail", :from => "Business Type")
    fill_in "Years in Business", with: "5"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully. It might take upto 24 hours for Petrohub to approve your account. If you have any Questions, please email sales@petrohub.org")
    expect(page.current_url).to eq root_url
  end

  scenario "Without valid attributes" do
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "Email", with: ""
    fill_in "user_password", with: ""
    fill_in "user_password_confirmation", with: ""
    fill_in "Business Name", with: ""
    fill_in "Phone Number", with: ""
    fill_in "Cell Number", with: ""
    fill_in "Tax ID", with: ""
    fill_in "SSN #", with: ""
    fill_in "Street Address", with: ""
    fill_in "Zip Code", with: ""
    fill_in "City", with: ""
    select('New York', :from => 'State')
    select("Retail", :from => "Business Type")
    fill_in "Years in Business", with: ""
    click_button "Sign up"

    expect(page).to have_content("Oops! Something went wrong.Account could not be created. Please Check your info and resubmit")
  end

  scenario "without valid password presesence and minimum length" do
    fill_in "First Name", with: "Suyesh"
    fill_in "Last Name", with: "Bhandari"
    fill_in "Email", with: "test@email.com"
    fill_in "user_password", with: "pas"
    fill_in "user_password_confirmation", with: "pas"
    fill_in "Business Name", with: "Acme Retail Inc"
    fill_in "Phone Number", with: "3472817892"
    fill_in "Cell Number", with: "3472817892"
    fill_in "Tax ID", with: "1234567890"
    fill_in "SSN #", with: "2222"
    fill_in "Street Address", with: "3416 99 st"
    fill_in "Zip Code", with: "11234"
    fill_in "City", with: "New York"
    select('New York', :from => 'State')
    select("Retail", :from => "Business Type")
    fill_in "Years in Business", with: "5"
    click_button "Sign up"

    expect(page).to have_content("Oops! Something went wrong.Account could not be created. Please Check your info and resubmit")
    expect(page).to have_content("Password is too short")
  end

  scenario "without valid email" do
    fill_in "First Name", with: "Suyesh"
    fill_in "Last Name", with: "Bhandari"
    fill_in "Email", with: "test"
    fill_in "user_password", with: "password22"
    fill_in "user_password_confirmation", with: "pasword22s"
    fill_in "Business Name", with: "Acme Retail Inc"
    fill_in "Phone Number", with: "3472817892"
    fill_in "Cell Number", with: "3472817892"
    fill_in "Tax ID", with: "1234567890"
    fill_in "SSN #", with: "2222"
    fill_in "Street Address", with: "3416 99 st"
    fill_in "Zip Code", with: "11234"
    fill_in "City", with: "New York"
    select('New York', :from => 'State')
    select("Retail", :from => "Business Type")
    fill_in "Years in Business", with: "5"
    click_button "Sign up"

    expect(page).to have_content("Oops! Something went wrong.Account could not be created. Please Check your info and resubmit")
    expect(page).to have_content("Email is invalid")
  end

end
