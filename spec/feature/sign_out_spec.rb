require 'rails_helper'

RSpec.feature 'Users can Log out' do
  let(:admin) { FactoryGirl.create(:john_doe, :admin) }
  let(:retailer) { FactoryGirl.create(:john_doe, :retailer) }
  let(:supplier) { FactoryGirl.create(:john_doe, :supplier) }
  let(:trucking) { FactoryGirl.create(:john_doe, :trucking) }

  before do
    visit '/'
    click_link 'Log In'
  end

  scenario 'Admin can Log out of their account.' do
    admin.active!
    fill_in 'Email', with: admin.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq admin_dashboard_url
    expect(page).to have_link 'Log out'

    click_link 'Log out'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'You have Succesfully Logged out.'
  end
end
