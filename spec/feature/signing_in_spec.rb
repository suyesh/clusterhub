require 'rails_helper'

RSpec.feature 'Users can sign in if user.status is approved. On creation User status should be pending' do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit '/'
    click_link 'Sign in'
  end

  scenario 'Brand New Users Whose user.status is pending' do
    fill_in 'Email', with: user.email
    fill_in 'sessions_password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content 'Your account has not been activated yet. Please call us at +12676073876.'
    expect(page.current_url).to eq root_url
  end

  scenario "Users whose status has been changed to 'approved'" do
    user.approved!

    fill_in 'Email', with: user.email
    fill_in 'sessions_password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content 'You have logged in successfully.'
  end

  scenario "Users whose status has been changed to 'frozen'" do
    user.disabled!

    fill_in 'Email', with: user.email
    fill_in 'sessions_password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content 'Your account has been frozen. Please call us at +12676073876 if you have any questions'
  end
end
