require 'rails_helper'

RSpec.feature 'Supplier can create contacts' do
  let(:supplier) { FactoryGirl.create(:john_doe, :supplier, :active) }
  let(:john) {FactoryGirl.create(:contact)}

  before(:each) do
    visit '/'
    click_link 'Log In'

    fill_in 'user_email', with: supplier.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'
  end

  scenario 'Supplier can Create Contacts' do
    expect(page.current_url).to eq supplier_dashboard_url

    click_link 'Retailers'

    expect(page.current_url).to eq supplier_contacts_url

    click_link 'Add New'

    expect(page.current_url).to eq new_supplier_contact_url

    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Doe'
    fill_in 'Business Name', with: 'Acme Inc'
    fill_in 'Phone Number', with: '2124567890'
    fill_in 'Mobile Number', with: '5202124567'
    select 'TMobile', from: 'Mobile Carrier'
    fill_in 'Street Address', with: '212 Wise St'
    fill_in 'Apt/Suite', with: '410'
    fill_in 'City', with: 'New york'
    select 'New York', from: 'State'
    fill_in 'Zip Code', with: '11104'
    fill_in 'Regular', with: 1.2
    fill_in 'Medium', with: 1.2
    fill_in 'Premium', with: 1.2
    fill_in 'Diesel', with: 1.2
    fill_in 'Delivery Charges', with: 200
    # fill_in 'Tax ID', with: '12345678'
    # fill_in 'SSN', with: '124000987'
    # fill_in 'How many years in Business?', with: '5'
    # fill_in 'Email', with: 'test@example.com'
    # fill_in 'user_password', with: 'password'
    # fill_in 'user_password_confirmation', with: 'password'
    # check('user_terms')
    click_button 'Add Retailer'
    # expect{supplier.contacts}.to change{supplier.contacts.count}.by(1)

    expect(page).to have_content 'Retailer has been successfully added.'
    expect(page.current_url).to eq supplier_contacts_url
  end

  scenario "Supplier can edit Contacts" do
   supplier.contacts << john

   visit "/supplier"
   click_link "Retailers"

   expect(page.current_url).to eq supplier_contacts_url
   expect(page).to have_content "John"
   click_link "Edit"

   expect(page.current_url).to eq edit_supplier_contact_url(john.id)

   fill_in 'First Name', with: 'Jack'
   fill_in 'Last Name', with: 'Doe'
   fill_in 'Business Name', with: 'Acme Inc'
   fill_in 'Phone Number', with: '2124567890'
   fill_in 'Mobile Number', with: '5202124567'
   select 'TMobile', from: 'Mobile Carrier'
   fill_in 'Street Address', with: '212 Wise St'
   fill_in 'Apt/Suite', with: '410'
   fill_in 'City', with: 'New york'
   select 'New York', from: 'State'
   fill_in 'Zip Code', with: '11104'
   fill_in 'Regular', with: 1.2
   fill_in 'Medium', with: 1.2
   fill_in 'Premium', with: 1.2
   fill_in 'Diesel', with: 1.2
   fill_in 'Delivery Charges', with: 200

   click_button "Update"

   expect(page).to have_content "Contact successfully Updated"

   expect(page.current_url).to eq supplier_contacts_url
   expect(page).to have_content "Jack"
  end
end
