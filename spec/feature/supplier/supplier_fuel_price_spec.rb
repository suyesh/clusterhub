require 'rails_helper'

RSpec.feature 'Supplier can create Fuel_Price' do
  let(:supplier) { FactoryGirl.create(:john_doe, :supplier, :active) }

  before(:each) do
    visit '/'
    click_link 'Log In'

    fill_in 'user_email', with: supplier.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'


  end

  scenario "Supplier Updates the  Fuel Price" do
    click_link 'Fuel Price'
    expect(current_url).to eq supplier_fuel_prices_url
    click_link "New Price"
    expect(page.current_path).to eq new_supplier_fuel_price_path
    fill_in "Regular", with: 1.34
    fill_in "Medium", with: 1.48
    fill_in "Premium", with: 1.82
    fill_in "Diesel", with: 2.00
    click_button "Update"

    expect(current_url).to eq supplier_fuel_prices_url
    expect(page).to have_content "You have successfully Added new Fuel Price."
    expect(page).to have_content "Regular"
    expect(page).to have_content "Medium"
    expect(page).to have_content "Premium"
    expect(page).to have_content "Diesel"
    expect(page).to have_content "1.34"
    expect(page).to have_content "1.48"
    expect(page).to have_content "1.82"
    expect(page).to have_content "2.0"
  end
end
