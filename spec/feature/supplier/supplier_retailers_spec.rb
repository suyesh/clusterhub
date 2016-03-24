require 'rails_helper'

RSpec.feature "Supplier can create contacts" do
  let(:supplier) {FactoryGirl.create(:john_doe, :admin, :active)}

  before(:each) do
    visit "/"
    click_link "Log In"

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log In'
  end


end
