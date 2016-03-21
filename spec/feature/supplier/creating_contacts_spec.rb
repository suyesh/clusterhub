require "rails_helper"

RSpec.feature "Supplier can create contacts" do
  let(:supplier) {FactoryGirl.create(:john_doe, :supplier, :active)}

  before do
    sign_in_with(supplier.email, "password")
    visit supplier_dashboard_url
    click_link "Contacts"
    expect(current_url).to eq supplier_contacts_url
    click_link "Add Contact"
    expect(current_url).to eq new_supplier_contact_url
  end

  scenario "With valid Attributes" do
    fill_in "First Name", with: "Shahid"
    fill_in "Last Name", with: "Afridi"
    fill_in "Cell Number", with: "6467895287"
    fill_in "Email", with: "shahid@retailer.com"
    fill_in "87", with: 0.02
    fill_in "93", with: 0.22
    fill_in "Diesel", with: 0.11
    fill_in "Delivery", with: 200

    click_button "Add Contact"

    expect(current_url).to eq supplier_contacts_url
    expect(page).to have_content "Contact was successfully saved."
  end
end
