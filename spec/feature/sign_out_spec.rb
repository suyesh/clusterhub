require 'rails_helper'

RSpec.feature 'Users can Log out' do
  let(:admin) { FactoryGirl.create(:john_doe, :admin, :active) }
  let(:retailer) { FactoryGirl.create(:john_doe, :retailer, :active) }
  let(:supplier) { FactoryGirl.create(:john_doe, :supplier, :active) }
  let(:trucking) { FactoryGirl.create(:john_doe, :trucking, :active) }

  def fill_in_info(user)
    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'
  end

  def check_dashboard_logout(page)
    expect(page).to have_link 'Log out'
    click_link 'Log out'
    expect(page.current_url).to eq login_url
    expect(page).to have_content 'You have Succesfully Logged out.'
  end

  def verify_logout(user)
    visit "/#{user}"
    expect(page.current_url).to eq login_url
    expect(page).to have_content 'You must be Logged in to Visit this page.'
  end

  before do
    visit '/'
    click_link 'Log In'
  end

  scenario 'Admin can Log out of their account.' do
    fill_in_info(admin)
    expect(page.current_url).to eq admin_dashboard_url
    check_dashboard_logout(page)
    verify_logout(admin)
  end

  scenario 'Retailer can Log out of their account.' do
    fill_in_info(retailer)
    expect(page.current_url).to eq retailer_dashboard_url
    check_dashboard_logout(page)
    verify_logout(retailer)
  end

  scenario 'Supplier can Log out of their account.' do
    fill_in_info(supplier)
    expect(page.current_url).to eq supplier_dashboard_url
    check_dashboard_logout(page)
    verify_logout(supplier)
  end

  scenario 'Trucking can Log out of their account.' do
    fill_in_info(trucking)
    expect(page.current_url).to eq trucking_dashboard_url
    check_dashboard_logout(page)
    verify_logout(trucking)
  end
end
