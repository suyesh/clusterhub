require 'rails_helper'

RSpec.feature 'Users can sign Up' do
  scenario 'With Valid attributes' do
    visit '/'
    click_link 'apply'

    expect(page.current_url).to eq new_user_url

    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    fill_in 'Business Name', with: 'Acme Inc'
    fill_in 'Phone Number', with: '2124567890'
    fill_in 'Cell Number', with: '5202124567'
    fill_in 'Street Address', with: '212 Wise St'
    fill_in 'Apt/Suite', with: '410'
    fill_in 'City', with: 'New york'
    select "New York", :from => "State"
    fill_in 'Zip Code', with: '11104'
    fill_in 'Tax ID', with: '12345678'
    fill_in 'SSN', with: '124000987'
    fill_in 'How many years in Business?', with: '5'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    check('user_terms')
    click_button 'Apply'

    expect(page.current_url).to eq root_url
    #expect(page).to have_content 'Please Upload documents listed below.'

    #attach_file('Upload Document', Rails.root + 'spec/support/files/file.pdf')

    #click_button 'Apply'

    expect(page).to have_content 'Thank you for Applying for PetroHub account. We are currently reviewing your application, which might take upto 24hrs.'
  end

  scenario 'With Invalid attributes' do
  end
end
