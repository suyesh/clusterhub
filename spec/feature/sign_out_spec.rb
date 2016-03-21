require 'rails_helper'

RSpec.feature 'Users can Log out' do
  let(:admin) { FactoryGirl.create(:john_doe, :admin, :active) }
  let(:retailer) { FactoryGirl.create(:john_doe, :retailer, :active) }
  let(:supplier) { FactoryGirl.create(:john_doe, :supplier, :active) }
  let(:trucking) { FactoryGirl.create(:john_doe, :trucking, :active) }


  scenario 'Admin can Log out of their account.' do
    sign_in_with(admin.email, 'password')
    expect(page.current_url).to eq admin_dashboard_url

    click_link 'Log Out'
    expect(page).to have_text('You have Succesfully Logged out.')
    expect(current_path).to eq(login_path)
  end

  scenario 'Retailer can Log out of their account.' do
    sign_in_with(retailer.email, 'password')
    expect(page.current_url).to eq retailer_dashboard_url

    click_link 'Log Out'
    expect(page).to have_text('You have Succesfully Logged out.')
    expect(current_path).to eq(login_path)
  end
#test
  scenario 'Supplier can Log out of their account.' do
    sign_in_with(supplier.email, 'password')
    expect(page.current_url).to eq supplier_dashboard_url

    click_link 'Log Out'
    expect(page).to have_text('You have Succesfully Logged out.')
    expect(current_path).to eq(login_path)
  end

  scenario 'Trucking can Log out of their account.' do
    sign_in_with(trucking.email, 'password')
    expect(page.current_url).to eq trucking_dashboard_url

    click_link 'Log Out'
    expect(page).to have_text('You have Succesfully Logged out.')
    expect(current_path).to eq(login_path)
  end
end
