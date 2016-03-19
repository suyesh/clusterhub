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

    visit '/supplier'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq retailer_dashboard_url

    visit '/trucking'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq retailer_dashboard_url
  end

  scenario 'If User is Supplier' do
    user.active!
    user.supplier!
    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'

    click_button 'Log In'

    expect(page.current_url).to eq supplier_dashboard_url
    expect(page).to have_content 'Login successful'
    expect(page).to have_content 'Daily Quotes'

    visit '/admin'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq supplier_dashboard_url

    visit '/retailer'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq supplier_dashboard_url

    visit '/trucking'
    expect(page).to have_content 'You are not authorized to access that section.'
    expect(page.current_url).to eq supplier_dashboard_url
  end
end
