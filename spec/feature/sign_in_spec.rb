require 'rails_helper'

RSpec.feature 'Users can sign In' do
  let(:user) {
    FactoryGirl.create(:john_doe)
  }

  before(:each) do
    visit '/'
    click_link 'Log In'
  end

  scenario 'With Valid attributes' do
    expect(page.current_url).to eq login_url

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'We are currently reviewing your application. Please contact Petrohub if you have furthur questions.'
  end

  scenario 'With Invalid attributes' do
    expect(page.current_url).to eq login_url

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: ' '
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'Something went wrong while we tried to access your account. Please verify your Email and Password and try again.'
  end

  scenario 'Retailer with active account' do
    user.retailer!
    user.active!

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq retailer_dashboard_url
    expect(page).to have_content 'Login successful'
  end

  scenario 'Supplier with active account' do
    user.supplier!
    user.active!

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq supplier_dashboard_url
    expect(page).to have_content 'Login successful'
  end

  scenario 'Trucking with active account' do
    user.trucking!
    user.active!

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq trucking_dashboard_url
    expect(page).to have_content 'Login successful'
  end

  scenario 'Admin with active account' do
    user.admin!
    user.active!

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq admin_dashboard_url
    expect(page).to have_content 'Login successful'
  end

  scenario 'Retailer with Inactive account' do
    user.retailer!

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'Your account is not active. Please contact us for access.'
  end

  scenario 'Supplier with Inactive account' do
    user.supplier!

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'Your account is not active. Please contact us for access.'
  end

  scenario 'Trucking with Inactive account' do
    user.trucking!

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'Your account is not active. Please contact us for access.'
  end

  scenario 'Admin with Inactive account' do
    user.admin!

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'Your account is not active. Please contact us for access.'
  end
end
