require "rails_helper"

RSpec.feature "Dashboard access control" do
  let(:user) {
    FactoryGirl.create(:john_doe, :admin)
  }

  before do
    visit "/"
    click_link 'Log In'
  end

  scenario "If User is Admin" do
    user.active!
    fill_in "Email", with: user.email
    fill_in "session_password", with: "password"

    click_button "Log In"

    expect(page.current_url).to eq admin_dashboard_url
    expect(page).to have_content "Login successful"
    expect(page).to have_content "Users"
  end

end
