require 'rails_helper'

RSpec.feature 'Users can sign In' do
  user = User.create(
    first_name: 'John',
    last_name: 'Doe',
    business_name: 'ACME inc',
    phone_number: '2128456789',
    cell_number: '2123456789',
    street_address: '81 updown st',
    apt_suite: '35',
    city: 'New York',
    state: 'New York',
    zip_code: '11367',
    tax_id: '223103456',
    ssn: '23456789',
    in_biz: '3',
    email: 'apple@yahoo.com',
    password: 'password',
    password_confirmation: 'password',
    terms: 1)

  before do
    visit '/'
    click_link 'Log In'
  end

  scenario 'With Valid attributes' do
    expect(page.current_url).to eq login_url

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'We are currently reviewing your application. Please contact Petrohub if you have furthur questions.'
  end

  scenario 'With Invalid attirbutes' do
    expect(page.current_url).to eq login_url

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: ' '
    click_button 'Log In'

    expect(page.current_url).to eq sessions_url
    expect(page).to have_content 'Something went wrong while we tried to access your account. Please verify your Email and Password and try again.'
  end

  scenario 'Retailer with active account' do
    user.retailer!
    user.active!

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq retailer_dashboard_url
    expect(page).to have_content 'Login successful'
  end

  scenario 'Supplier with active account' do
    user.supplier!
    user.active!

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq supplier_dashboard_url
    expect(page).to have_content 'Login successful'
  end

  scenario 'Trucking with active account' do
    user.trucking!
    user.active!

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq trucking_dashboard_url
    expect(page).to have_content 'Login successful'
  end

  scenario 'Admin with active account' do
    user.admin!
    user.active!

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq admin_dashboard_url
    expect(page).to have_content 'Login successful'
  end

  scenario 'Retailer with Inactive account' do
    user.retailer!

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'Your account is not active. Please contact us for access.'
  end

  scenario 'Supplier with Inactive account' do
    user.supplier!

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'Your account is not active. Please contact us for access.'
  end

  scenario 'Trucking with Inactive account' do
    user.trucking!

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'Your account is not active. Please contact us for access.'
  end

  scenario 'Admin with Inactive account' do
    user.admin!

    fill_in 'Email', with: user.email
    fill_in 'session_password', with: 'password'
    click_button 'Log In'

    expect(page.current_url).to eq login_url
    expect(page).to have_content 'Your account is not active. Please contact us for access.'
  end
end
