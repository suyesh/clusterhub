require 'rails_helper'

RSpec.feature 'Dashboard access control' do
  let(:user) do
    FactoryGirl.create(:john_doe)
  end

  before do
    visit '/'
    click_link 'Log In'
  end

  scenario 'If User is Retailer' do
    user.active!
    user.retailer!
    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'

    click_button 'Log In'

    expect(page.current_url).to eq retailer_dashboard_url
    expect(page).to have_content 'Login successful'
    expect(page).to have_content 'My Stations'

    visit '/admin'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq retailer_dashboard_url
  end

  scenario 'If User is Supplier' do
  end
end
